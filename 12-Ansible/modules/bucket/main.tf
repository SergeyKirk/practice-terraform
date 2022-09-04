resource "google_storage_bucket" "ansible" {
  name          = var.bucket_name
  location      = "US"
  force_destroy = true

  provisioner "local-exec" {
    command = "chmod +x ${var.files_path}/modules/bucket/bucket.sh && ${var.files_path}/modules/bucket/bucket.sh"
    environment = {
      DIR = var.files_path
    }
  }
}