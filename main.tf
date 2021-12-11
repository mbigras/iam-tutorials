module "customer_managed_policy" {
  source = "./modules/customer-managed-policy"
}

output "console_url" {
  value = module.customer_managed_policy.console_url
}

output "password" {
  value = module.customer_managed_policy.password
}
