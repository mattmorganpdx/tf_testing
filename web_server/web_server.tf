provider "aws" {
  profile = "cb"
  region = "us-west-2"
}

data "aws_instance" "web_server_1" {
  instance_id = "i-0768a26eb49e052f1"
}

output "web_server_hostname" {
  value = data.aws_instance.web_server_1.tags["Name"]
}