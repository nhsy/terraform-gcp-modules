host_project_id = "shared-vpc-123456"

service_project_ids = ["infra-services-123456", "dev-proj-123456"]

standard_network_subnets = [
    {
        name = "development" 
        cidr = "10.0.3.0/24"
    },
    {
        name = "operations"
        cidr = "10.0.1.0/24"
    },
    {
        name = "production"
        cidr = "10.0.4.0/24"
    },
    {
        name = "security"
        cidr = "10.0.2.0/24"
    },
    {
        name = "transit"
        cidr = "10.0.0.0/24"
    },
    {
        name = "x-transit"
        cidr = "10.0.5.0/24"
    }
]

gke_pod_network_name = "gke-pod-network"
gke_service_network_name = "gke-service-network"

gke_network_subnets = [
    {
        name = "cicd-gke"
        cidr = "10.0.10.0/24"
        pod_cidr = "10.10.0.0/17"
        service_cidr = "10.10.128.0/20"
    },
    {
        name = "development-gke"
        cidr = "10.0.11.0/24"
        pod_cidr = "10.11.0.0/17"
        service_cidr = "10.11.128.0/20"
    }

]

create_nat_gateway = false

tags = {
    owner = "example owner"
    environment = "dev"
    terraform = "true"
}