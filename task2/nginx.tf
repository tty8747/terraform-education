data "aws_ami" "ubuntu20" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_key_pair" "homepc" {
  key_name   = "id_rsa.pub from home pc"
  public_key = file(var.id_rsa_path)
}

resource "aws_network_interface" "nginx" {
  subnet_id       = aws_subnet.nginx.id
  security_groups = [aws_security_group.nginx.id]

  tags = {
    Name = "Public network interface for nginx instance"
  }
}

resource "aws_eip" "nginx" {
  vpc = true

  tags = {
    Name = "nginx"
  }
}

resource "aws_eip_association" "nginx" {
  allocation_id        = aws_eip.nginx.id
  network_interface_id = aws_network_interface.nginx.id
}

resource "aws_instance" "nginx" {
  ami = data.aws_ami.ubuntu20.id
  instance_type = "t2.micro"
  key_name      = aws_key_pair.homepc.id
  user_data     = data.template_file.init.rendered

  network_interface {
    network_interface_id = aws_network_interface.nginx.id
    device_index         = 0
  }

  tags = {
    Name = "nginx"
  }
}
