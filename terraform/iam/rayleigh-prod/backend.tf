terraform {

  backend "s3" {
    bucket         = "rayleigh-prod-apnortheast2-tfstate" # Set bucket name 
    key            = "rayleigh/terraform/iam/rayleigh-prod/terraform.tfstate"
    region         = "ap-northeast-2"
    encrypt        = true
    dynamodb_table = "terraform-lock" # Set DynamoDB Table
  }
}
