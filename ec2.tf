resource "aws_network_interface" "docker" {
  subnet_id = aws_subnet.my_subnet.id

resource "tls_private_key" "docker" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "docker" {
  key_name   = "docker-key01"
  public_key = tls_private_key.docker.public_key_openssh
}

resource "aws_instance" "docker" {
  ami           = "ami-09d56f8956ab235b3" # us-east-1
  instance_type = "t2.micro"
  user_data     = file("install_docker.sh")
  key_name      = aws_key_pair.docker.key_name

  root_block_device {
    volume_size = 8
    volume_type = "gp3"
    encrypted   = false
  }

  network_interface {
    network_interface_id = aws_network_interface.docker.id
    device_index         = 0
  }
}
