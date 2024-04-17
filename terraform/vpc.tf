module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.0.0"

  name = "main"
  cidr = "10.0.0.0/16"

  azs             = var.availability_zone_names
  public_subnets  = ["10.0.1.0/24","10.0.4.0/24"]


  enable_nat_gateway     = true
  single_nat_gateway     = true

  private_subnet_tags = {
    "kubernetes.io/role/internal-elb"               = 1
    "kubernetes.io/cluster/test_cluster" = "owned"
  }

  public_subnet_tags = {
    "kubernetes.io/role/elb"                        = 1
    "kubernetes.io/cluster/test_cluster" = "owned"
  }
}