terraform {

  backend "s3" {
    bucket         = "perpick-prod-apnortheast2-tfstate" # Set bucket name 
    key            = "perpick/terraform/iam/perpick-prod/terraform.tfstate"
    region         = "ap-northeast-2"
    encrypt        = true
    dynamodb_table = "terraform-lock" # Set DynamoDB Table
  }
}
