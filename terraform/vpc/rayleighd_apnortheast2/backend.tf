terraform {

  backend "s3" {
    bucket         = "perpick-dev-apnortheast2-tfstate"
    key            = "perpick/terraform/vpc/perpickd_apnortheast2/terraform.tfstate"
    region         = "ap-northeast-2"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}
