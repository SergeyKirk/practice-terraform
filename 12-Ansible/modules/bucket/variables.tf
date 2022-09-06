variable "bucket_name" {
  type        = string
  description = "The name of the bucket"
}

variable "files_path" {
  type        = string
  description = "The path to the files directory"
}

variable "bucket_region" {
  type        = string
  description = "The region of the bucket to deploy to"
}