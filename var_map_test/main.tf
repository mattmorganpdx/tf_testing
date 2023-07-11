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

variable "resource_handler" {
  type    = string
  default = ""
}

variable "static" {
  type    = string
  default = ""
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

output "my_map" {
  value = var.map_type_test
}

output "my_list" {
  value = var.list_type_test
}

output "my_bool" {
  value = var.bool_type_test
}


