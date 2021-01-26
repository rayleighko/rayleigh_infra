# Atlantis user
variable "atlantis_user" {
  description = "The username that will be triggering atlantis commands. This will be used to name the session when assuming a role. More information - https://github.com/runatlantis/atlantis#assume-role-session-names"
  default     = "atlantis_user"
}

# Account IDs
# Add all account ID to here 
variable "account_id" {
  default = {
    id   = "{your-id-account_id}"
    dev  = "{your-dev-account_id}"
    prod = "{your-prod-account_id}"
  }
}

# Remote State that will be used when creating other resources
# You can add any resource here, if you want to refer from others
variable "remote_state" {
  default = {
    # VPC
    vpc = {
      perpickdapne2 = {
        region = "ap-northeast-2"
        bucket = "perpick-id-apnortheast2-tfstate"
        key    = "perpick/terraform/vpc/perpicki_apnortheast2/terraform.tfstate"
      }

      perpickpapne2 = {
        region = "ap-northeast-2"
        bucket = "perpick-dev-apnortheast2-tfstate"
        key    = "perpick/terraform/vpc/perpickd_apnortheast2/terraform.tfstate"
      }

      perpickpapne3 = {
        region = "ap-northeast-2"
        bucket = "perpick-prod-apnortheast2-tfstate"
        key    = "perpick/terraform/vpc/perpickp_apnortheast2/terraform.tfstate"
      }
    }


    # WAF ACL
    waf_web_acl_global = {
      prod = {
        region = ""
        bucket = ""
        key    = ""
      }
    }


    # AWS IAM
    iam = {

      id = {
        region = "ap-northeast-2"
        bucket = "perpick-id-apnortheast2-tfstate"
        key    = "perpick/terraform/iam/perpick-id/terraform.tfstate"
      }

      dev = {
        region = "ap-northeast-2"
        bucket = "perpick-id-apnortheast2-tfstate"
        key    = "perpick/terraform/iam/perpick-dev/terraform.tfstate"
      }

      prod = {
        region = "ap-northeast-2"
        bucket = "perpick-id-apnortheast2-tfstate"
        key    = "perpick/terraform/iam/perpick-prod/terraform.tfstate"
      }
    }


    # AWS KMS
    kms = {

      id = {
        apne2 = {
          region = "ap-northeast-2"
          bucket = "perpick-id-apnortheast2-tfstate"
          key    = "perpick/terraform/kms/perpick-id/id_apnortheast2/terraform.tfstate"
        }
      }

      dev = {
        apne2 = {
          region = "ap-northeast-2"
          bucket = "perpick-dev-apnortheast2-tfstate"
          key    = "perpick/terraform/kms/perpick-dev/dev_apnortheast2/terraform.tfstate"
        }
      }

      prod = {
        apne2 = {
          region = "ap-northeast-2"
          bucket = "perpick-prod-apnortheast2-tfstate"
          key    = "perpick/terraform/kms/perpick-prod/prod_apnortheast2/terraform.tfstate"
        }
      }

    }
  }
}
