region= "europe-west2"

sharedvpc_project_id = "shared-vpc-123456"
sharedvpc_network="shared-network"

cluster_project_id="dev-proj-123456"
cluster_subnetwork = "cicd-gke"
cluster_service_account="kubernetes"
cluster_name="gke-private-1"
cluster_pool_name="gke-private-pool"
cluster_master_cidr="172.16.0.0/28"
cluster_master_authorized_cidrs = [
  {
    cidr_block   = "10.0.0.0/8"
    display_name = "mgmt-1"
  },
  {
    cidr_block   = "192.168.0.0/16"
    display_name = "mgmt-2"
  }
]
