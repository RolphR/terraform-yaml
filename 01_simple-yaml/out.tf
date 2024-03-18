output "config" {
  value = { for file, config in terraform_data.config : file => config.output }
}
