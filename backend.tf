terraform {
  backend "s3" {
    key = "terraform.tfstate"
    bucket = "mytfbucketproject"
    encrypt = "true"
    region = "us-east-1"
  }
}