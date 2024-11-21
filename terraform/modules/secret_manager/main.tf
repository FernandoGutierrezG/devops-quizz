# secret_manager/variables.tf
# Fernando Gutierrez

resource "aws_secretsmanager_secret" "db_secret" {
  name        = "db-credentials"
  description = "Database credentials for the app"
}

resource "aws_secretsmanager_secret_version" "db_secret_version" {
  secret_id     = aws_secretsmanager_secret.db_secret.id
  secret_string = jsonencode({
    username = "admin",
    password = var.db_password
  })
}
