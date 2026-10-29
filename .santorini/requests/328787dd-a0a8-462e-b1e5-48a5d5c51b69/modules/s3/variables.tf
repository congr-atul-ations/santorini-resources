variable "bucket_name" { type = string }
variable "versioning" {
  type    = bool
  default = true
}
variable "lifecycle_days" {
  type    = number
  default = 0
  validation {
    condition     = var.lifecycle_days >= 0 && floor(var.lifecycle_days) == var.lifecycle_days
    error_message = "Lifecycle days must be a nonnegative integer."
  }
}
variable "tags" { type = map(string) }
