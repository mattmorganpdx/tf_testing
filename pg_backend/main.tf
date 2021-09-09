terraform {
  backend "pg" {
    conn_str = "postgres://postgres:mysecretpassword@172.19.0.1/terraform_backend?sslmode=disable"
  }
}

variable "content" {
    default = "oink! from the config_a sub directory"
}

resource "local_file" "config_file" {
    content     = var.content
    filename = "/tmp/config_a.txt"
}