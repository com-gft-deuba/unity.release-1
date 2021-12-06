resource "google_compute_network" "instance" {
  name                    = local.instance_signature_clean
  auto_create_subnetworks = "false" 
  routing_mode            = "REGIONAL"
}

resource "google_compute_subnetwork" "instance" {
  name          = local.instance_signature_clean
  ip_cidr_range = "10.10.10.0/24"
  network       = google_compute_network.instance.id

  secondary_ip_range  = [
    {
        range_name    = "gce"
        ip_cidr_range = "10.10.11.0/24"
    },
    {
        range_name    = "services"
        ip_cidr_range = "10.10.12.0/24"
    },
    {
        range_name    = "pods"
        ip_cidr_range = "10.1.0.0/20"
    }
  ]

  private_ip_google_access = true
}
