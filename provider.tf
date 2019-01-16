provider "aws" {
  region = "${var.region}"
}

terraform {
  backend "s3" {
  bucket = "terraform-bucket-work"
  key = "myproject/key"
  region = "us-east-1"
  dynamodb_table = "project1"
  }
}
