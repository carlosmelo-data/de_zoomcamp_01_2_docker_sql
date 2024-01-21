variable "credentials" {
    description = "My Credentials"
    default = "../../../terrademo/keys/my-creds.json"
}

variable "project" {
    description = "Project"
    default = "terraform-demo-411500"
}

variable "region" {
    description = "Region"
    default = "us-central1"
}

variable "location" {
    description = "Project Location"
    default = "US"
}

variable "bq_dataset_name" {
    description = "My BiqQuery Dataset Name"
    default = "demo_dataset_terraform_demo_411500"
}

variable "gcs_bucket_name" {
    description = "My Storage Bucket Name"
    default = "my_bucket-terraform-demo-411500"
}

variable "gcs_storage_class" {
    description = "Bucket Storage Class"
    default = "STANDARD"
}
 