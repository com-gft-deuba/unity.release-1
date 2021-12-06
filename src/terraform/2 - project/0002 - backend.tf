terraform {
  backend "gcs" {
    bucket      = "com-gft-deuba-gcp"
    prefix      = "project/terraform/com-gft-deuba-unity-release-1"
  }
}
