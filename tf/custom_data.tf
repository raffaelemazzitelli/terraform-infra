data "external" "example" {
  program = ["sh", "${path.module}/custom-script.sh"]
}

output "example" {
  value = data.external.example.key
}