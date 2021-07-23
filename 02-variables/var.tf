variable "sample" {
  default="Hello World"
}

output "sample" {
  value = var.sample
}

//variable combined with some other string then we have to use ${} called interpolation for accessing variable

output "sample1" {
  value = "${var.sample} - from terraform"
}

variable "sample2" {}

output "sample2" {
  value = var.sample2
}

output "string" {
  value = "Hello"
}

output "numbers" {
  value = 3
}

output "Bulean" {
  value = true
}