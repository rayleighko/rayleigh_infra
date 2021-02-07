terraform {

  backend "s3" {
    bucket         = "rayleigh-dev-apnortheast2-tfstate"
    key            = "rayleigh/terraform/vpc/rayleighd_apnortheast2/terraform.tfstate"
    region         = "ap-northeast-2"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}
