variable "map_type_test" {
    default = {name = "Mabel", content = 52}
}


resource "local_file" "foo" {
    content     = var.map_type_test["content"]
    filename = "/tmp/${var.map_type_test["name"]}"
}

