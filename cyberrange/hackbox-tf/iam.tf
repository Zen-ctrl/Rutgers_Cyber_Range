##############################################################
###### Backend EC2 Server EC2 Profile
##############################################################
resource "aws_iam_instance_profile" "instance-profile" {
  name = "${var.Project}-${var.env}-instance-profile"
  role = aws_iam_role.instance-role.name
  tags = merge(
    { 
      "Service" = "IAM Profile" 
    }, 
    local.common_tags
  )
}

resource "aws_iam_role" "instance-role" {
  name = "${var.Project}-${var.env}-instance-role"
  tags = merge(
    { 
      "Service" = "IAM Role" 
    }, 
    local.common_tags
  )
  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
                "Service": "ec2.amazonaws.com"
            },
            "Effect": "Allow",
            "Sid": ""
        }
    ]
}
EOF
}

resource "aws_iam_policy" "instance-role-policy" {
  name        = "${var.Project}-${var.env}-instance-role-policy"
  path        = "/"
  description = "Allows an instance to forward logs to CloudWatch and SSM"
  tags = merge(
    { 
      "Service" = "IAM Policy" 
    }, 
    local.common_tags
  )
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "ssm:DescribeAssociation",
                "ssm:GetDeployablePatchSnapshotForInstance",
                "ssm:GetDocument",
                "ssm:DescribeDocument",
                "ssm:GetManifest",
                "ssm:GetParameter",
                "ssm:GetParameters",
                "ssm:ListAssociations",
                "ssm:ListInstanceAssociations",
                "ssm:PutInventory",
                "ssm:PutComplianceItems",
                "ssm:PutConfigurePackageResult",
                "ssm:UpdateAssociationStatus",
                "ssm:UpdateInstanceAssociationStatus",
                "ssm:UpdateInstanceInformation"
            ],
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "ssmmessages:CreateControlChannel",
                "ssmmessages:CreateDataChannel",
                "ssmmessages:OpenControlChannel",
                "ssmmessages:OpenDataChannel"
            ],
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "ec2messages:AcknowledgeMessage",
                "ec2messages:DeleteMessage",
                "ec2messages:FailMessage",
                "ec2messages:GetEndpoint",
                "ec2messages:GetMessages",
                "ec2messages:SendReply"
            ],
            "Resource": "*"
        },
        {
          "Effect": "Allow",
          "Action": [
              "logs:DescribeDestinations",
              "logs:FilterLogEvents",
              "logs:PutMetricFilter",
              "logs:PutQueryDefinition",
              "logs:CreateLogGroup",
              "logs:CreateLogStream",
              "logs:PutLogEvents",
              "logs:PutRetentionPolicy",
              "logs:DescribeLogStreams"
            ],
            "Resource": [
                "arn:aws:logs:*:*:*"
            ]
        }
    ]
}
EOF
}

resource "aws_iam_policy_attachment" "iam-role-policy-attach" {
  name       = "${var.Project}-${var.env}-role-policy-attach"
  roles      = [aws_iam_role.instance-role.name]
  policy_arn = aws_iam_policy.instance-role-policy.arn
}