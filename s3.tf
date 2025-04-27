# create an S3 bucket - https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket

resource "aws_s3_bucket" "bar" {
  bucket_prefix = "corighose-terraform-"
  count         = 1
}
