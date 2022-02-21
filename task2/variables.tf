variable "id_rsa_path" {
  type        = string
  default     = "~/.ssh/id_rsa.pub"
  description = "Path to public key"
}

variable "region" {
  type    = string
  default = "eu-central-1"
}

variable "db_regions" {
  type = list(string)
  default = ["eu-central-1a", "eu-central-1b"]
}

variable "db_cidr_block" {
  type    = list(string)
  default = ["192.168.18.16/28", "192.168.18.32/28"]
}

variable "cidr_block" {
  type    = string
  default = "192.168.18.0/26"
}

variable "subnet" {
  type    = string
  default = "192.168.18.0/28"
}

variable "dbname" {
  type    = string
  default = "dbname"
}

variable "dbuser" {
  type    = string
  default = "dbname"
}

variable "dbpass" {
  type    = string
  default = "dbpass123456"
}
