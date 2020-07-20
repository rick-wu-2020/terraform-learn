provider "aws" {
   region= local.region
}


locals {
 azs=["a","b","c"]
 region=var.global
 availability_zones={for az in slice(local.azs,0,3):az => format("%s%s",local.region,az)}
}

resource "aws_ebs_volume" "example" {
   for_each=local.availability_zones
   availability_zone= format("%s",each.value)
   size=8
}
