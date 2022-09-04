region     = "us-central1"
project_id = "vahan-dev"

#vm_names = ["vm1", "vm2", "vm3"]
#tags     = ["tag1", "tag2", "tag3"]

vms_tags = {
  "vm1" = {
    name = "name1-vm"
    tags = ["tag1", "tag1-a"]
  }
  "vm2" = {
    name = "name2-vm"
    tags = ["tag2"]
  }
}
