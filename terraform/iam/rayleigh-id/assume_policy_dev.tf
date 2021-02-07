### Create policies for allowing user to assume the role in the development account
### You can copy this file and change `dev` to other environment if you have any other account

# Admin Access policy 
# If this policy is applied, then you will be able to assume role in the development account with admin permission
module "rayleigh_dev_admin" {
  source      = "./_module_assume_policy/"
  aws_account = "rayleigh-dev"
  subject     = "admin"
  resources   = ["arn:aws:iam::${var.dev_account_id}:role/assume-rayleigh-dev-admin"]
}

output "assume_rayleigh_dev_admin_policy_arn" {
  value = module.rayleigh_dev_admin.assume_policy_arn
}

# Poweruser Access policy 
# If this policy is applied, then you will be able to assume role in the development account with poweruser permission
module "rayleigh_dev_poweruser" {
  source      = "./_module_assume_policy/"
  aws_account = "rayleigh-dev"
  subject     = "poweruser"
  resources   = ["arn:aws:iam::${var.dev_account_id}:role/assume-rayleigh-dev-poweruser"]
}

output "assume_rayleigh_dev_poweruser_policy_arn" {
  value = module.rayleigh_dev_poweruser.assume_policy_arn
}


# ReadOnly Access policy 
# If this policy is applied, then you will be able to assume role in the development account with readonly permission
module "rayleigh_dev_readonly" {
  source      = "./_module_assume_policy/"
  aws_account = "rayleigh-dev"
  subject     = "readonly"
  resources   = ["arn:aws:iam::${var.dev_account_id}:role/assume-rayleigh-dev-readonly"]
}

output "assume_rayleigh_dev_readonly_policy_arn" {
  value = module.rayleigh_dev_readonly.assume_policy_arn
}
