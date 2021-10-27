ec2.tf

provider  "aws" {
  access_key = "AKIAYFLGAMTYJ2NHNWDN"
  secret_key = "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"
  region     = "us-east-1"
}
resource "aws_instance" "Jenkins_server" {
  ami           = "ami-02e136e904f3da870"
  instance_type = "t2.micro"
  key_name  = "Jenkins_Instance"
  count  = "1"
  security_groups = ["security_jenkins_port"]
  tags = {
   name = "jenkins_Instance"
 }
}

