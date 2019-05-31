region= "europe-west2"

project_id = "dev-proj-123456"

name = "bastion"
machine_type="g1-small"
metadata_startup_script = "files/bastion_bootstrap.sh"
service_account="bastion"
network = "default"
source_cidr = ["1.1.1.1", "2.2.2.2"]
scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
  ]
