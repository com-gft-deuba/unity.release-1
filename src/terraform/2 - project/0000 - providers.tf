// Configure the Google Cloud provider
provider "google" {
#   credentials = file("local-secrets/ger-dbagntademo-sdb-001-e843f529b233.json")
  project     = "ger-dbagntademo-sdb-001"
  region      = "europe-west3"
  zone        = "europe-west3-a"
  request_timeout = "120s"
}

provider "google-beta" {
  project     = "ger-dbagntademo-sdb-001"
  region      = "europe-west3"
  zone        = "europe-west3-a"
  request_timeout = "120s"
}
