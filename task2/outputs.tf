output "nginx-public-ip" {
  value = aws_eip.nginx.public_dns
}
