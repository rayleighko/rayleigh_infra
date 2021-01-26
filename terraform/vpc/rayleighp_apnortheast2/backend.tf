terraform {

  backend "s3" {
    bucket         = "perpick-prod-apnortheast2-tfstate"
    key            = "perpick/terraform/vpc/perpickp_apnortheast2/terraform.tfstate"
    region         = "ap-northeast-2"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}
