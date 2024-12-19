output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_sub_id" {
  value = module.vpc.public_sub_id
}

output "private_sub_id" {
  value = module.vpc.private_sub_id
}