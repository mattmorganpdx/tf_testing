variable "map_type_test" {
  type = object({ name : string, content : number })
  default = {
    name    = "Mabel",
    content = 52
  }
}

variable "list_type_test" {
  type    = list(any)
  default = ["red", "yellow", "green"]
}

variable "bool_type_test" {
  type    = bool
  default = false
}

variable "null_type_test" {
  default = "default if not supplied"
}

variable "resource_handler" {
  type    = string
  default = ""
}

variable "static" {
  type    = number
  default = 0
}

resource "local_file" "foo" {
  filename = "/tmp/${var.map_type_test["name"]}"
  content  = <<-EOT
    resource_handler = ${var.resource_handler}
    something static = ${var.static}
    ${var.map_type_test["content"]}
    %{for color in var.list_type_test~}
list item = ${color}
    %{endfor~}
Bool vaule = ${var.bool_type_test}
  EOT
}

resource "local_file" "test" {
  count = length(var.list_type_test)
  filename = "/tmp/test-${count.index}"
  content = element(var.list_type_test, count.index)
}

output "my_map" {
  value = var.map_type_test
}

output "my_list" {
  value = var.list_type_test
}

output "my_bool" {
  value = var.bool_type_test
}

output "my_rh" {
  value = var.resource_handler
}

output "my_static_number" {
  value = var.static
}

output "my_nullable" {
  value = var.null_type_test != "null" ? var.null_type_test : "default because null"
}


