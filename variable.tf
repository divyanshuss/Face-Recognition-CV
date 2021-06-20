variable "AWS_ACCESS_KEY" {
default = "XXXXXXXXXXXXXXXXXXXXX"
}
variable "AWS_SECRET_KEY" {
default = "XXXXXXXXXX"
}
variable "AWS_REGION" {
default = "ap-south-1"
}
variable "ami-id"{
default = "ami-0ad704c126371a549"
}

variable "availability-zone" {
default = "ap-south-1a"
}

variable "Key-name"{
default = "task1-key"
}

variable "public-key" {
default ="ssh-rsa XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
}

variable "aws-security-group-name" {
default = "task-security-group"
}
variable "my-cidr" {
    default = ["0.0.0.0/0"]
}
variable "volume-size" {
default = "5"
}


variable "aws-ebs-volume-name"{
default = "task-ebs-volume"
}
variable "aws-instance-type"{
default = "t2.micro"
}

variable "instance-name"{
default = "task6"
}

variable "vpc_id" {
default = "vpc-0e35d565"
}

