provider "aws" {
  region = local.region
}

locals {
 region=var.nx
 azs=flatten([var.az,var.az-1,var.az-2])
 az={for az in slice(local.azs,0,3):az => format("%s%s",local.region,az)} 
}

resource "random_id" "example" {
    byte_length=3
    count=3
}
resource "aws_ebs_volume" "example" {
     for_each=local.az
    availability_zone=format("%s",each.value)
     size=8
    tags={
   Name=format("%s",each.value)
}
}
