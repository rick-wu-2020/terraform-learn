locals {
   hubs=["sep","test"]
}


provider "aws" {
   region ="cn-northwest-1"
}

#resource "random_id" "buck_id" {
#     byte_length= 2
#     count =2 
#}

resource "aws_s3_bucket" "test_s3" {
     #count = 2 
    for_each=toset(local.hubs)
    # bucket="terraform-${random_id.buck_id.*.dec[count.index]}"
    bucket =format("terraform-%s",each.key)
    acl = "private"
    force_destroy= true   
}


