module "cloudfront_frontend" {
  source  = "voquis/cloudfront-s3-origin-acm/aws"
  version = "0.0.5"

  bucket_id                   = module.azadata_org_s3_public_frontend.s3_bucket.id
  bucket_arn                  = module.azadata_org_s3_public_frontend.s3_bucket.arn
  bucket_regional_domain_name = module.azadata_org_s3_public_frontend.s3_bucket.bucket_regional_domain_name
  acm_certificate_arn         = module.azadata_org_useast1.acm_certificate.arn
  origin_path                 = "/${var.commit}"
  minimum_protocol_version    = "TLSv1.3_2025"
  aliases                     = [
    aws_route53_zone.azadata_org.name,
    "www.${aws_route53_zone.azadata_org.name}",
  ]
}
