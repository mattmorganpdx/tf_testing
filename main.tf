
module "web_server" {
    source = "./web_server"
}

variable "content" {
    default = "moo!"
}

resource "local_file" "foo" {
    content     = module.web_server.web_server_hostname
    filename = "/tmp/foo.bar"
}

resource "local_file" "bar" {
    content     = var.content
    filename = "/tmp/bar.foo"
}
