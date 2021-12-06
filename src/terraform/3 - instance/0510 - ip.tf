resource "google_compute_address" "instance" {
  provider                 = google-beta

  name    = local.instance_signature_clean
  address_type = "EXTERNAL"
  # purpose = "GCE_ENDPOINT"
  network_tier = "STANDARD"
  prefix_length = 0

  labels = local.instance_tags
}

# resource "google_compute_router" "instance" {
#   name    = local.instance_signature_clean
# #  region  = data.google_storage_bucket.master.region
#   network = google_compute_network.instance.id
# }

# resource "google_compute_router_nat" "instance" {
#   name                               = local.instance_signature_clean
#   router                             = google_compute_router.instance.name
#   nat_ip_allocate_option             = "MANUAL_ONLY"
#   nat_ips                            = [ google_compute_address.instance.self_link ]
#   source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS" 
#   subnetwork {
#     name                    = google_compute_subnetwork.instance.id
#     source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
#   }
#   depends_on                         = [ google_compute_address.instance ]
# }
