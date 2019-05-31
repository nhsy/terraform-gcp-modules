# shared-vpc

Creates standard subnets, kubernetes subnets with secondary networking and enables shared vpc.

1. Requires a GCP user or ServiceAccount which has been delegated Compute Shared VPC Admin role.  

1. Authenticate to GCP using either one of the following:
   - gcloud auth application default login

   - Set GOOGLE_APPLICATION_CREDENTIALS environment variable

1. Compute API services need to be enabled for the host and service projects.  The gcloud commands below can be run in the google cloud shell:

```
gcloud services enable compute.googleapis.com [--project project_id]
gcloud services enable container.googleapis.com [--project project_id]
```
