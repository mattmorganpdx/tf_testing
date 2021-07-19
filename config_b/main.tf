
variable "content" {
    default = "moo!"
}

resource "local_file" "config_file" {
    content     = var.content
    filename = "/tmp/config_b.txt"
}