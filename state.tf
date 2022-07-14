terraform {
    backend "s3" {
        bucket = "com.demo.terraform.state"
        encrypt = true
        key = "terraform.tfstate"
        region = "eu-west-2"
    }
}