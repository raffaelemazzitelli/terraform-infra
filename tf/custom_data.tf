data "external" "test" {
  program = ["sh", "${path.module}/custom-script.sh"]
}

output "output-test" {
  value = data.external.test
}
