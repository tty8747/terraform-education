data "aws_vpcs" "listVPCs" {
}

output "vpcs" {
  value = [for i in data.aws_vpcs.listVPCs.ids : i]
}

data "aws_subnets" "listSubnets" {
  filter {
    name   = "vpc-id"
    values = [for i in data.aws_vpcs.listVPCs.ids : i]
  }
}

output "subnets" {
  value = [for i in data.aws_subnets.listSubnets.ids : i]
}

data "aws_security_groups" "listSG" {
  filter {
    name   = "vpc-id"
    values = [for i in data.aws_vpcs.listVPCs.ids : i]
  }
}

output "sgroups" {
  value = [for i in data.aws_security_groups.listSG.ids : i]
}
