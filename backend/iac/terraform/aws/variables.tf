variable "commit" {
  type        = string
  description = "commit hash to use as cloudfront frontend origin path"
}

variable "azadata_org_s3_public_frontend_bucket_name" {
  type        = string
  description = "Cloudfront frontend origin S3 bucket name"
}
