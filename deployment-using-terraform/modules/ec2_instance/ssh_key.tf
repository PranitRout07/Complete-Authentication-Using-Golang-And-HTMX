resource "aws_key_pair" "mykey"{
    key_name = "mykey007"
    public_key = file("${path.module}/id_rsa.pub")
}