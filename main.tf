# main.tf
terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

# This resource defines our "infrastructure" (a managed configuration file)
resource "local_file" "iac_server_config" {
  filename = "${path.module}/server_config.env"
  content  = <<EOT
# Managed by Terraform IaC
ENVIRONMENT=production
DB_HOST=127.0.0.1
PORT=8080
EOT
}
