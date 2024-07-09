provider "aws" {
  region = "us-east-1"
#   access_key = var.access_key
#   secret_key = var.secret_key
}

module "ec2_instance" {
  source = "./modules/ec2_instance"
  ami_id = var.ami_id
  instance_type = var.instance_type
  user = var.user
  port= var.port
  dbname= var.dbname
  SECRET = var.SECRET
  password = var.password
  pass = var.pass
  email = var.email
  server_port = var.server_port
  ssh_port = var.ssh_port

}