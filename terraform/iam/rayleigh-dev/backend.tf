terraform {

  backend "s3" {
    bucket         = "perpick-dev-apnortheast2-tfstate" # Set bucket name 
    key            = "perpick/terraform/iam/perpick-dev/terraform.tfstate"
    region         = "ap-northeast-2"
    encrypt        = true
    dynamodb_table = "terraform-lock" # Set DynamoDB Table
  }
}
