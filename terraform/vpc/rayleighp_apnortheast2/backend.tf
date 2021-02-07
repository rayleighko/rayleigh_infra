terraform {

  backend "s3" {
    bucket         = "rayleigh-prod-apnortheast2-tfstate"
    key            = "rayleigh/terraform/vpc/rayleighp_apnortheast2/terraform.tfstate"
    region         = "ap-northeast-2"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}
