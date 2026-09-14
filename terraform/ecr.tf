resource "aws_ecr_repository" "services" {
  for_each = toset([
    "auth-service",
    "evaluation-service",
    "flag-service",
    "targeting-service",
    "analytics-service"
  ])

  name                 = each.value
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}