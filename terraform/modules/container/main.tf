# container/main.tf
# Fernando Gutierrez

resource "aws_ecr_repository" "python_ecr" {
  name = "ft-ecr-python"
  tags = {
    Name = "ft-ecr-python"
  }
}
