resource "aws_s3_bucket" "static_resource_bucket" {
  bucket              = "<YOUR BUCKET NAME>"
  bucket_prefix       = null
  force_destroy       = null
  object_lock_enabled = false
  timeouts {
    create = null
    delete = null
    read   = null
    update = null
  }
}

resource "aws_s3_bucket_policy" "static_resource_bucket" {
  bucket = "<YOUR BUCKET NAME>"
  policy = jsonencode({
    Id = "PolicyForCloudFrontPrivateContent"
    Statement = [{
      Action = "s3:GetObject"
      Condition = {
        StringEquals = {
          "AWS:SourceArn" = "arn:aws:cloudfront::<YOUR AWS ACCOUNT>:distribution/<CLOUDFRONT DISTRIBUTION ID>"
        }
      }
      Effect = "Allow"
      Principal = {
        Service = "cloudfront.amazonaws.com"
      }
      Resource = "arn:aws:s3:::<YOUR BUCKET NAME>/*"
      Sid      = "AllowCloudFrontServicePrincipal"
    }]
    Version = "2008-10-17"
  })
}
