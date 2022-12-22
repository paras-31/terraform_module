output "ec2" {
  value = [for i in var.ec2: i["ami"]]
}

output "vpc" {
  value = module.vpc.vpcoutput
}

output "sg" {
  value = module.sg.sg
}