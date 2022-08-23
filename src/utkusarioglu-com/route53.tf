resource "aws_route53_zone" "domain" {
  provider = aws.us_west_2
  name     = local.domain_name
  tags     = local.default_tags
}

resource "aws_route53_record" "cert_validation" {
  provider = aws.us_west_2
  for_each = {
    for dvo in aws_acm_certificate.domain.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = aws_route53_zone.domain.zone_id
}

resource "aws_route53_record" "main_static_content_a" {
  provider = aws.us_west_2
  zone_id  = aws_route53_zone.domain.zone_id
  name     = "www.${local.domain_name}"
  type     = "A"
  alias {
    name                   = aws_cloudfront_distribution.main_static_content.domain_name
    zone_id                = aws_cloudfront_distribution.main_static_content.hosted_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "bare_domain" {
  provider = aws.us_west_2
  zone_id  = aws_route53_zone.domain.zone_id
  name     = local.domain_name
  type     = "A"
  alias {
    name                   = aws_cloudfront_distribution.bare_domain.domain_name
    zone_id                = aws_cloudfront_distribution.bare_domain.hosted_zone_id
    evaluate_target_health = false
  }
}
