variable "instance_type" {
  description = "This describes the instance type"
  type = string
}

variable "ami_id" {
    description = "This describes the ami image"
    type = string
}

variable "user" {
  type =  string
}

variable "password" {
  type = string
}

variable "port" {
  type = number
}

variable "dbname" {
  type = string
}

variable "SECRET" {
  type = string
}

variable "pass" {
  type = string
}

variable "email"{
    type = string
}

variable "server_port"{

    type = number
}

variable "ssh_port" {
  type = number
}