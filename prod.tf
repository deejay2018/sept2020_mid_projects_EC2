provider "aws" {
  profile = "default"
  region  = "eu-west-1"
}

/*terraform {
  backend "s3" {
    bucket = "mazzy-simple-bucket"
    key    = "techbleat.tfstate"
    region = "eu-west-1"
  }
}*/

resource "aws_instance" "nginx_task" {
  ami             = "ami-0bb3fad3c0286ebd5"
  instance_type   = "t2.micro"
  key_name        = "MyNewPair"
  #security_groups = ["launch-wizard-1"]
  vpc_security_group_ids = [aws_security_group.demo_nginx.id]
  user_data = file("install_nginx_prod.sh")

  tags = {
    Name        = "Nginx Server"
    Provisioner = "Terraform"
    Test        = "yes_no"
  }
}
resource "aws_instance" "tomcat_node" {
  ami                    = "ami-0bb3fad3c0286ebd5"
  instance_type          = "t2.micro"
  key_name               = "MyNewPair"
  vpc_security_group_ids = [aws_security_group.demo_tomcat.id]
//  security_groups = ["terraform_created_sg"]
  user_data = file("install_tomcat_prod.sh")
  tags = {
    Name        = "Tomcat server"
    Provisioner = "Terraform"
  }
}