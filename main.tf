module "vpc1" {
  source = "./modules"

  isPrivateSubnetNeeded = true
  vpc_cidr             = "172.31.0.0/16"
  vpc_instance_tenency = "default"
  public_subnet_az     = "us-east-2a"
  public_subnet_cidr   = "172.31.0.0/24"
  private_subnet_az    = "us-east-2b"
  private_subnet_cidr  = "172.31.1.0/24"
  batch_code           = "tg-devops-0930"
  batch_mode           = "weekday"
  batch_month          = "july"
  provisioned_by       = "Nishant"

  ec2_attributes = {
    instance1 = {
      ami = "ami-037774efca2da0726"
    instance_type = "t2.micro"
    key_name = "tg-devops-0930-wd-july"
    tags = {
      Name = "tg-devops-0930-wd-july-1"
      Environment = "Prod"
      CreatedBy = "Dipanshu"
    }

    },
    instance2 = {
    ami = "ami-085f9c64a9b75eed5"
    instance_type = "t2.small"
    key_name = "tg-devops-0930-wd-july"

    tags = {
      Name = "tg-devops-0930-wd-july-2"
      Environment = "Dev"
    }
    }
  }

  sg_ingress = [{
      from_port = 22
      to_port   = 22
      protocol  = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port = 80
      to_port   = 80
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }]
    sg_egress  = [{
      from_port = 0
      to_port  = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }]

}

