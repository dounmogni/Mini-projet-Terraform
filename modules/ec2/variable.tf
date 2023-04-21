variable "maintainer" {
  type    = string
  default = "nicolas"
}

variable "instance_type" {
  type    = string
  default = "t2.nano"
}

variable "ssh_key" {
  type    = string
  default = "devops-nicolas" #nom de la paire de cle genere sur aws pour connexion ssh
}

variable "sg_name" {
  type    = string
  default = "NULL"
}

variable "public_ip" {
  type    = string
  default = "NULL"
}

variable "AZ" {
  type    = string
  default = "us-east-1b"
}

variable "user" {
  type    = string
  default = "ubuntu"
}