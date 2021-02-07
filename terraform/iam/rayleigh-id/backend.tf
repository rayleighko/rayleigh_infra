terraform {

  backend "s3" {
    bucket  = "rayleigh-id-apnortheast2-tfstate" # Set bucket name 
    key     = "rayleigh/terraform/iam/rayleigh-id/terraform.tfstate"
    region  = "ap-northeast-2"
    encrypt = true
    # dynamodb_table = "terraform-lock" # Set DynamoDB Table  
  }
}
