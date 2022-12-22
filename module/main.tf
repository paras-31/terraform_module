module "EC2" {
    source = "../ec2"
    for_each = var.ec2
    ami = each.value["ami"]
    instance_type = each.value["instance_type"]
    name = each.value["name"]
    owner = each.value["owner"]
    purpose = each.value["purpose"]
}

module "vpc" {
  source = "../vpc"
  cidr = ["10.0.0.0/16","10.0.1.0/24",""]
  tags = {
    "name" = "paras"
    "owner" = "paras.kamboj@cloudeq.com"
  }
}

module "sg" {
  source = "../security_group"
  name = "paras_security-grp"
}