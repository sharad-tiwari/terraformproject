ec2.tf

provider  "aws" {
  access_key = ""
  secret_key = ""
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

resource "aws_security_group" "security_jenkins_port" {
  name        = "security_jenkins_port"
  description = "security group for jenkins"

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

 ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

 # outbound from jenkis server
  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

