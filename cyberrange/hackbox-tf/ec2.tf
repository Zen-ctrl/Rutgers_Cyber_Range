module "ec2" {
  source = "./modules/ec2"
  depends_on = [
    module.vpc,
    module.sg_ec2
  ]

  instance = {
    "${var.Project}-${var.env}-ec2" = {
      ami                    = var.ec2-ami
      instance_type          = var.ec2-instance_type
      monitoring             = true # Whether to enabled CPU and Network metrics monitoring
      subnet_id              = module.vpc.public_subnet_01_id
      iam_instance_profile   = aws_iam_instance_profile.instance-profile.name # Attaching IAM profile for AWS SSM Session Manager permissions
      vpc_security_group_ids = [module.sg_ec2.id]
      key_name               = aws_key_pair.ec2.key_name
      # Metadata is an option where you can curl EC2 generla info (such as IP, hostname, etc) while being inside the EC2, for that we have several options to be enabled
      metadata_options = {
        http_endpoint = "enabled"
        http_tokens   = "required"
        http_put_response_hop_limit = "1"
        instance_metadata_tags = null
      }
      root_block_device = {
        volume_size = var.ec2-volume_size
        delete_on_termination = true
      }
      # This is just for resource identification (resource tagging)
      tags = merge(
        { "Service" = "EC2" }, 
        local.common_tags
      ) 
      volume_tags = merge(
        { 
          "Name"    = "${var.Project}-${var.env}-root-block" 
          "Service" = "EBS" 
        }, 
        local.common_tags
      )
    }
  }
}

# Setting a Permant Public IP to the EC2, so that public IP won't change even after restart
resource "aws_eip" "ec2" {
  instance = module.ec2.instance_id["${var.Project}-${var.env}-ec2"]
  vpc      = true
  tags = merge(
    { 
      "Name"    = "${var.Project}-${var.env}-eip" 
      "Service" = "EIP" 
    }, 
    local.common_tags
  )
}

output "intance_id" {
    value = module.ec2.instance_id["${var.Project}-${var.env}-ec2"]
}

output "intance_public_ip" {
    value = aws_eip.ec2.public_ip
}


# This is a feature in TF, where we can set arbitary resource blocks to set, validate, run custom scripts or functions
# Here we are connecting to the EC2 instance using SSH for runnning several scripts and uploading files 
resource "null_resource" "ssh-init" {
  # The trigger will ensure that if you run the TF apply a second time, it will only work if you mande changes to the file. 
  # if not, it will be skippped
  triggers = {
    key = sha256(file("./ec2_init/init.sh"))
  }

  provisioner "remote-exec" {
    connection {
      host        = aws_eip.ec2.public_ip
      user        = "ubuntu"
      type        = "ssh"
      private_key = tls_private_key.ssh.private_key_pem # The private key is generatee by TF, so we can reference the value, without actually pointing the file itself
      timeout     = "2m"
    }
    script = "./ec2_init/init.sh" # Pointing the first script to be executed
  }
  # this argument is use to make sure the TF won't run this resoruce until mentioned resources are fully deployed
  # NOTE: TF tries to deploy multiple resources at the same time, this way we make sure SSH connection will work since this resource will run only after ec2 is deployed
  depends_on = [
    module.ec2,
    aws_eip.ec2
  ]
}

# This is resource is simply turning the mentioned folder into a zip file
# The zip file is not needed in this workflow, we only need the Hash value of it
data "archive_file" "ansible_files" {
  type        = "zip"
  source_dir = "ansible_scripts/"
  output_path = "ansible_scripts.zip"
}

data "archive_file" "web_files" {
  type        = "zip"
  source_dir = "web/"
  output_path = "web.zip"
}

resource "null_resource" provision_files {
  # The trigger will ensure that if you run the TF apply a second time, it will only work if you mande changes to the file. 
  # if not, it will be skippped
  triggers = {
    # Here we are checking whether hashes changed or newly added as triggers
    # The current hash is stored in terraform.state file and will be compared at every TF run
    ansible_files = "${data.archive_file.ansible_files.output_sha}"
    web_files = "${data.archive_file.web_files.output_sha}"
    nginx_conf = sha256(file("./ec2_init/nginx.conf"))
    cloudwatch_conf = sha256(file("./ec2_init/aws_logs.json"))
  }

  connection {
    host        = aws_eip.ec2.public_ip
    user        = "ubuntu"
    type        = "ssh"
    private_key = tls_private_key.ssh.private_key_pem
    timeout     = "2m"
  }
  
  # Uploading scripts, files, folders, config files
  # Note: File provisioner can't upload files to ay file location since we are not in root mode, make sure you have destination path where user "ubuntu" has perms
  # File provisioner doesn't have sudo access
  # Note that the folder paths were created and given access to the "ubuntu" user from the initial script (./ec2_init/init.sh) beforehand
  provisioner "file" {
    source      = "ansible_scripts/"
    destination = "/home/ansible_scripts"
  }

  provisioner "file" {
    source      = "web/"
    destination = "/usr/share/nginx/html"
  }

  provisioner "file" {
    source      = "ec2_init/nginx.conf"
    destination = "/home/nginx/nginx.conf"
  }

  provisioner "file" {
    source      = "ec2_init/aws_logs.json"
    destination = "/home/cw/aws_logs.json"
  }

  depends_on = [
    null_resource.ssh-init
  ]
}

resource "null_resource" "custom-configs" {
  # The trigger will ensure that if you run the TF apply a second time, it will only work if you mande changes to the file. 
  # if not, it will be skippped
  triggers = {
    # Here we are checking whether hashes changed or newly added as triggers
    # The current hash is stored in terraform.state file and will be compared at every TF run
    ansible_files = "${data.archive_file.ansible_files.output_sha}"
    web_files = "${data.archive_file.web_files.output_sha}"
    nginx_conf = sha256(file("./ec2_init/nginx.conf"))
    cloudwatch_conf = sha256(file("./ec2_init/aws_logs.json"))
  }

  provisioner "remote-exec" {
    connection {
      host        = aws_eip.ec2.public_ip
      user        = "ubuntu"
      type        = "ssh"
      private_key = tls_private_key.ssh.private_key_pem
      timeout     = "2m"
    }

    # Here we are placing the config files and removing unwanted temporary folders/files
    # which got created in the earlier provisioner stages
    # and also restarting services 
    inline = [
      "sudo rm /etc/nginx/sites-available/*",
      "sudo rm /etc/nginx/sites-enabled/*",
      "sudo mv /home/nginx/nginx.conf /etc/nginx",
      "sudo mv /home/cw/aws_logs.json /opt/aws/amazon-cloudwatch-agent/etc",
      "sudo rm -rf /home/nginx",
      "sudo rm -rf /home/cw",
      "sudo chown -R www-data: /usr/share/nginx/html/*",
      "sudo systemctl restart nginx",
      "sudo systemctl enable nginx",
      "cd /home/ansible_scripts",
      "sudo ansible-playbook --connection=local bins.yml Ansible_Bins_Mock.yaml Linux_User_Gen.yaml",
      "cd ..",
      "sudo rm -rf ansible_scripts",
      "sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a fetch-config -m ec2 -s -c file:/opt/aws/amazon-cloudwatch-agent/etc/aws_logs.json"
    ]
  }
  depends_on = [
    null_resource.provision_files
  ]
}