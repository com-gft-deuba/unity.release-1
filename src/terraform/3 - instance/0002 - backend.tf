terraform {
  backend "gcs" {
    bucket      = "com-gft-deuba-unity-release-1"
    prefix      = "project/terraform/com-gft-deuba-unity-release-1/demo"
  }
}
