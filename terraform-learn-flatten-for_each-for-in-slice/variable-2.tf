variable "az" {
  type=list
  default=["a"]
}
variable "az-1" {
 type=list
 default=["b"]
}
variable "az-2" {
  type=list
  default=["c"]
}

variable "nx" {
   type=string
   default="cn-northwest-1"
}

variable "az-count" {
   type=number
   default=3
}
