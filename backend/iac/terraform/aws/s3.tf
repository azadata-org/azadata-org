module "azadata_org_s3_public_frontend" {
  source  = "voquis/s3-encrypted/aws"
  version = "0.0.5"
  bucket  = var.azadata_org_s3_public_frontend_bucket_name
}
