resource "aws_key_pair" "task1-key" {
  key_name    = var.Key-name
  public_key  = var.public-key 
}

resource "aws_security_group" "task1-sg" {
  name        = var.aws-security-group-name
  description = "Allow TLS inbound traffic"
  vpc_id      = var.vpc_id


  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.my-cidr
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.my-cidr
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.my-cidr
  }

  tags = {
    Name = var.aws-security-group-name
  }
}

resource "aws_ebs_volume" "task1-ebs" {
  availability_zone = var.availability-zone
  size              = var.volume-size

  tags = {
    Name = var.aws-ebs-volume-name
  }
}

resource "aws_instance" "task1-inst" {
  ami           = var.ami-id
  instance_type = var.aws-instance-type
  availability_zone = var.availability-zone
  key_name      = "awskey"
  security_groups = [ var.aws-security-group-name ]
  user_data = <<-EOF
                #! /bin/bash
                sudo yum install httpd -y
                sudo systemctl start httpd
                sudo systemctl enable httpd
                sudo yum install git -y
                mkfs.ext4 /dev/xvdf1
                mount /dev/xvdf1 /var/www/html
                cd /var/www/html
                git clone https://github.com/divyanshuss/WEB_APP_TASK-
                
  EOF

  tags = {
    Name = var.instance-name
  }
}

resource "aws_volume_attachment" "task1-attach" {
 device_name = "/dev/sdf"
 volume_id = "${aws_ebs_volume.task1-ebs.id}"
 instance_id = "${aws_instance.task1-inst.id}"
}




