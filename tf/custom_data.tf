data "external" "example" {
  program = ["sh", "${path.module}/custom-script.sh"]
}

