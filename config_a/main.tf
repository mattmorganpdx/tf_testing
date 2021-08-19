
variable "content" {
    default = "oink! I'm the test branch for config_a"
}

resource "local_file" "config_file" {
    content     = var.content
    filename = "/tmp/config_a.txt"
}
