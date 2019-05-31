# gke-private example

Deploys GKE private cluster.

1. Requires a GCP user or ServiceAccount.

1. Authenticate to GCP using either one of the following:

   - gcloud auth application default login

   - Set GOOGLE_APPLICATION_CREDENTIALS environment variable


1. Ammend terraform.tfvars accordingly.

1. Run the following commands:

```
    terraform init
    terrafrom plan
    terraform apply
```
