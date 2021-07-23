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

variable "string" {
  default = "Hello"
}

variable "numbers" {
  default = 3
}

variable "Bulean" {
  default = true
}
output "Data-types" {
  value = "String = ${var.string} , number = ${var.numbers} , Bulean = ${var.Bulean}"
}

variable "Training" {
  default = "DevOps"
}

variable "Trainings" {
  default = [ "DevOps","AWS" ]
}

variable "Training-Details" {
  default = {
    AWS="6AM-IST"
    DevOps="9AM-IST"
  }
}

output "Training" {
  value = var.Training
}

output "First-training" {
  value = var.Trainings[0]
}
output "Second-training" {
  value = var.Trainings[1]
}

output "Training-Details" {
  value = "AWS Timing is ${var.Training-Details["AWS"]}"
}