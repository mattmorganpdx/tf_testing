
variable "content" {
    default = "I'm the test branch"
}

resource "local_file" "config_file" {
    content     = var.content
    filename = "/tmp/config_a.txt"
}
