resource "aws_route53_zone" "site_host_zone" {
  comment           = "HostedZone created by Route53 Registrar"
  delegation_set_id = null
  force_destroy     = null
  name              = "<YOUR HOSTZONE NAME>"
  tags              = {}
  tags_all          = {}
}

resource "aws_route53_record" "a_record" {
  allow_overwrite                  = null
  health_check_id                  = null
  name                             = "<YOUR HOSTZONE NAME>"
  set_identifier                   = null
  type                             = "A"
  zone_id                          = aws_route53_zone.site_host_zone.id
  alias {
    evaluate_target_health = false
    name                   = "<VALUE>.cloudfront.net"
    zone_id                = "<YOUR HOSTZONE ID>"
  }
}

resource "aws_route53_record" "ns_record" {
  allow_overwrite                  = null
  health_check_id                  = null
  name                             = "<YOUR RECORD NAME>"
  records                          = ["ns-xxxx.awsdns-63.net.", "ns-xxxx.awsdns-xx.org.", "ns-xxxx.awsdns-29.co.uk.", "ns-xxxx.awsdns-56.com."]
  set_identifier                   = null
  ttl                              = 172800
  type                             = "NS"
  zone_id                          = aws_route53_zone.site_host_zone.id
}

resource "aws_route53_record" "soa_record" {
  allow_overwrite                  = null
  health_check_id                  = null
  name                             = "<YOUR RECORD NAME>"
  records                          = ["ns-xxxx.awsdns-xx.org. awsdns-hostmaster.amazon.com. 1 XXXX XXX XXXXXX XXXXX"]
  set_identifier                   = null
  ttl                              = 900
  type                             = "SOA"
  zone_id                          = aws_route53_zone.site_host_zone.id
}

resource "aws_route53_record" "cname_record" {
  allow_overwrite                  = null
  health_check_id                  = null
  name                             = "<YOUR RECORD NAME>"
  records                          = ["VALUE"]
  set_identifier                   = null
  ttl                              = 300
  type                             = "CNAME"
  zone_id                          = aws_route53_zone.site_host_zone.id
}
