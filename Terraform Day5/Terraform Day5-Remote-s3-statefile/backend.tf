terraform {
  backend "s3" {
    bucket = "mayseasonmangoes"
    key = "terraform.tfstate"
    region = "ap-south-1"
    
  }
}