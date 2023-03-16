terraform {
    backend "S3" {
        bucket = "my-bucket-gulbeia"
        key = "terraform/dev"
        region = "us-east-1"
    }
}