# staticsite-s3-cloudfront-githubactions-public
This repository contains AWS S3, CloudFront, Route53, Route53 resources configured by terraform for hosting static website and Github Actions workflow for build and deploy.

## AWS Resources
AWS resources are configured under `/aws` directory.
sensitive information is masked so when you use this repository to create resources for you, you need to replace masked value to yours.

## Github Action
Github Action workflow is defined under `/.github` directory. To use it, you have to setup github actions secrets as below on your github repository.
- AWS_ACCOUNT_ID
- CLOUDFRONT_DISTRIBUTION_ID

### HOW DEPLOY WORK
Assumptions: you created app and has package.json under root directory. Othewise build step fails.
1. App is build via Github actions
1. Github assumes IAM role for following deploy actions.
1. Deploy built app (under ./build directory as default) to S3 bucket.
1. Invalidate CloudFront chache.
