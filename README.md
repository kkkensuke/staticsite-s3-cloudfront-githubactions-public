# staticsite-s3-cloudfront-githubactions-public
This repository contains AWS S3, CloudFront, Route53, Route53 resources configured by terraform for hosting static website and Github Actions workflow for build and deploy.

## AWS Resources
AWS resources are configured under `/aws` directory.
sensitive information is masked so when you use this repository to create resources for you, you need to replace masked value to yours.

## Github Action
Github Action workflow is defined under `/.github` directory. To use it, you have to setup github actions secrets as below on your github repository.
- AWS_ACCOUNT_ID
- CLOUDFRONT_DISTRIBUTION_ID
