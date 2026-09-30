terraform {
    backend "s3" {
        bucket = "terraform-statefile-aniket-2026"
        key    = "terraform.tfstate"
        region = "us-east-1"
    }
}
