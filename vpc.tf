module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.7.0"

  name = "terraform-eks"
  cidr = "10.123.0.0/16"

  azs             = ["eu-north-1", "eu-west-2"]
  private_subnets = ["10.123.3.0/24", "10.123.4.0/24"]
  public_subnets  = ["10.123.1.0/24", "10.123.2.0/24"]
  intra_subnets   = ["10.123.5.0/24", "10.123.6.0/24"]

  enable_nat_gateway = true

  public_subnet_tags = {
    "kubernetes.io/role/elb" = 1
  }

  private_subnet_tags = {
    "kubernetes.io/role/internal-elb" = 1
  }
}
