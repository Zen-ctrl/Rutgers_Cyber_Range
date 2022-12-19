# This is a resource by TF itself, for  creating a SSH private key rater than conventional methods
# This way the key will be stored in TF State file and will be retried from the TF itself when needed for remote exections
resource "tls_private_key" "ssh" {
  algorithm   = "RSA"
  rsa_bits  = 4096
}


# Assigning the newly created above key to AWS Key pair
resource "aws_key_pair" "ec2" {
  key_name   = "${var.Project}-${var.env}-key"
  public_key = tls_private_key.ssh.public_key_openssh
}


resource "local_file" "private_key" {
  content         = tls_private_key.ssh.private_key_pem
  filename        = "${var.Project}-${var.env}-key.pem"
}