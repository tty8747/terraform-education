resource "aws_db_instance" "this" {
  allocated_storage     = 5
  max_allocated_storage = 12
  engine                = "MariaDB"
  engine_version        = "10.5"
  instance_class        = "db.t2.micro"
  db_name                  = var.dbname
  username              = var.dbuser
  password              = var.dbpass
  skip_final_snapshot = true
  availability_zone   = "eu-central-1a"
  db_subnet_group_name   = aws_db_subnet_group.this.id
  vpc_security_group_ids = [aws_security_group.nginx.id]
}

resource "aws_db_subnet_group" "this" {
  name       = "this"
  # subnet_ids = [aws_subnet.nginx.id]
  subnet_ids = [for i in aws_subnet.db : i.id]

  tags = {
    Name = "Subnet group for ${var.dbname}"
  }
}

resource "aws_security_group_rule" "db_port" {
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  cidr_blocks       = [aws_vpc.nginx.cidr_block]
  security_group_id = aws_security_group.nginx.id
  description       = "for db"
}

output "db_endpoint" {
  value = aws_db_instance.this.endpoint
}
