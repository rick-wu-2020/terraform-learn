provider "aws" {
   region = local.region
}

resource "random_id" "example" {
   count=3
   byte_length=3
}

locals {
   region=var.global
   hubs=var.random
}

resource "aws_s3_bucket" "example" {
    acl = "private"
    force_destroy = true
    for_each=toset(local.hubs)
    bucket=format("terraform-%s",each.value)
}
