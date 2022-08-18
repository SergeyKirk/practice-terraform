region     = "us-central1"
project_id = "eng-cell-351818"

vpc_name = "default"

firewall_rules_names = [
  "rule-ingress"
]

instance_names = ["test-instance"]
zone           = "us-central1-a"
instance_type  = "e2-medium"
image          = "debian-10-buster-v20220719"