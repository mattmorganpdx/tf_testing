
variable "content" {
    default = "moo! I'm the test branch for config_b"
}

resource "local_file" "config_file" {
    content     = var.content
    filename = "/tmp/config_b.txt"
}