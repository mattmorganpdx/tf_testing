resource "null_resource" "env_check" {
  provisioner "local-exec" {
    command = "env > /tmp/env_check.txt"
  }
}