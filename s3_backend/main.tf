terraform {
  backend "s3" {
    bucket = "cmp-tf-backend"
    key = "state/state"
    region = "us-west-2"
  }
}

output "some_thing" {
  value = "I wrote to my bucket!"
}