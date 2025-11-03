# Public frontend
resource "aws_route53_record" "azadata_org_public_frontend" {
  zone_id = aws_route53_zone.azadata_org.zone_id
  name    = ""
  type    = "A"

  alias {
    name                   = module.cloudfront_frontend.cloudfront_distribution.domain_name
    zone_id                = module.cloudfront_frontend.cloudfront_distribution.hosted_zone_id
    evaluate_target_health = false
  }
}
