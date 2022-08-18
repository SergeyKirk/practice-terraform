locals {

  allow_rule = [
    {
      protocol = "tcp"
      ports    = ["443"]
    },
    {
      protocol = "tcp"
      ports    = ["80", "8080"]
    }
  ]
}
