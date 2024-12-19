module "vpc" {
  source     = "./modules/vpc"
  cidr_block = var.cidr_block
  vpc_name   = var.vpc_name
}


module "ec2" {
  source        = "./modules/ec2"
  instance_name = var.instance_name
  instance_type = var.instance_type
  subnet_id = module.vpc.public_sub_id
}

module "s3" {
  source      = "./modules/s3"
  bucket_name = var.bucket_name
}