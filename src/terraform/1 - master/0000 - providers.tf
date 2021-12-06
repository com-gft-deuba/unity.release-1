// Configure the Google Cloud provider
provider "google" {
#   credentials = file("local-secrets/ger-dbagntademo-sdb-001-e843f529b233.json")
  project     = "ger-dbagntademo-sdb-001"
#   project     = "dbagnta-demo"
  region      = "europe-west3"
  zone        = "europe-west3-a"
  request_timeout = "600s"
}
