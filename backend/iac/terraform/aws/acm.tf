# Public frontend certificate
module "azadata_org_useast1" {
  source  = "voquis/acm-dns-validation/aws"
  version = "1.0.0"

  providers = {
    aws = aws.useast1
  }

  subject_alternative_names = [
    "www.${aws_route53_zone.azadata_org.name}"
   ]

  zone_id     = aws_route53_zone.azadata_org.id
  domain_name = aws_route53_zone.azadata_org.name
}
