variable "list" {
    default = ["hello", "world", "how", "are", "you" ]
}

variable "map" {
  default = {
    name = "test",
    env = "dev",
    region = "us-west-2"
  }
}

variable "string" {
}

variable "boolean" {
  default = true
}

variable "number" {
  default = 5
}

output "list" {
  value = var.list
}

output "map" {
    value = var.map
}

output "string" {
  value = var.string
}

output "boolean" {
    value = var.boolean
}

output "number" {
  value = var.number
}

#### testin github
