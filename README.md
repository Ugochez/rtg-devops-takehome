# Devops Take Home Test

This project is setup to allow devops candidates so show their skills and ability to deploy a static site to the cloud

## Requirements
- Fork the repository into your own account
- Build and deploy the gatsby site to the cloud
- Use Terraform to standup your cloud infrastructure
- Use github actions to deploy infrastructure changes and publish the site

## Things to remember
- Make use of free tier services to deploy the site
- Make sure any api keys are stored in secrets. A bot will scrape it if its public

## Resources
- [Gatsby](https://www.gatsbyjs.com/docs/)
- [AWS Free Tier](https://aws.amazon.com/free/?all-free-tier.sort-by=item.additionalFields.SortRank&all-free-tier.sort-order=asc&awsf.Free%20Tier%20Categories=categories%23storage)
- [Terraform](https://www.terraform.io/docs/index.html)
- [Github Actions](https://docs.github.com/en/free-pro-team@latest/actions
)

## SUMMARY SOLUTION
- Successfully built and deployed the gatsby static website to AWS using GitHub actions and Terraform infrastructure config.
- website = http://gatsby-bucket-rtg.s3-website.us-east-2.amazonaws.com

## STEPS
- Terraform configuration s3.tf 
  - created AWS s3 bucket + Bucket policy for hosting static website
  - Defined Terraform backend state. in order to run terraform apply
  - aws region

- Manually
  - created IAM Users (access and secret keys) in AWS
  - encryption of access and secret keys in github

- GitHub Actions s3-deploy.yml
  - This workflow will run anytime you push code change to the master branch
  - installed dependencies to run a build using yarn.
  - Terraform init - plan - apply
  - sync repo to s3 bucket to upload our build.
  - pulled public aws cli image from dockerhub to sync our aws s3 bucket

- Problems
  - struggled to connect s3 bucket to github repo using gitHub actions. did not install awscli. instead pulled open source image from docker hub to enable me run command to sync both
  - many errors due to formating s3.tf file
  - yarn vs npm for builds
  - My current employers do not use GitHub actions as it is still a new concept. Took me a short while to figure out the configuration especially with terraform in the mix. 

  Overall was able to leverage resources stackoverflow, Google, Youtube and reddit helped.
  I learnt a lot from this project and i am excited to learn more with Rooms to go if given the opportunity.

