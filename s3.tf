provider "aws" {
  region = "us-east-2"
}

terraform {
  backend "s3" {
    bucket = "rtg-gatsby-terraform-bucket"
    key    = "gatsby-bucket-rtg.tfstate"
    region = "us-east-2"
  }
}

resource "aws_s3_bucket" "buckettzz" {
  bucket = "gatsby-bucket-rtg"
  acl    = "public-read"

  policy = <<POLICY
    {
      "Version": "2012-10-17",
      "Statement": [
        {
          "Sid": "PublicReadGetObject",
          "Effect": "Allow",
          "Principal": "*",
          "Action": "s3:GetObject",
          "Resource": "arn:aws:s3:::jkrsp.com/*"
        }
      ]
    }
  POLICY

  website {
    index_document = "index.html"
  }
}
