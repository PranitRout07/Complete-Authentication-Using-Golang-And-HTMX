resource "aws_instance" "example" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name = "${aws_key_pair.mykey.key_name}"
  vpc_security_group_ids = [aws_security_group.instance.id]
  tags = {
    Name = "terraform-example"
  }
  # user_data = file("${path.module}/script.sh")
  user_data = data.template_file.startup_script.rendered

  user_data_replace_on_change = true 
  connection {
    type        = "ssh"
    user        = "ubuntu"  # The SSH user for the EC2 instance
    private_key = file("${path.module}/id_rsa")
    host        = self.public_ip  # Connect using the instance's public IP
  }

  provisioner "file" {
    source      = "${path.module}/docker-compose.yaml" # Local path to your docker-compose.yml file
    destination = "/home/ubuntu/docker-compose.yaml"  # Destination path on the EC2 instance
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update -y",
      "sudo apt install docker.io -y",
      "sudo systemctl start docker",
      "sudo systemctl enable docker",
      "sudo apt-get install -y docker-compose",
      "sudo docker-compose --env-file /etc/profile.d/.env up -d",
    ]
  }
}


data "template_file" "startup_script" {
  template = file("${path.module}/script.sh")
  vars = {
    user="${var.user}"
    password="${var.password}"
    port="${var.port}"
    dbname="${var.dbname}"
    SECRET="${var.SECRET}"
    pass="${var.pass}"
    email="${var.email}"
  }
}