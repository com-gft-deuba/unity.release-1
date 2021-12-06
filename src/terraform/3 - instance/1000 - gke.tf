resource "google_service_account" "instance" {
  account_id   = local.instance_signature_clean_28
  display_name = "Service Account"
}


resource "google_container_node_pool" "instance" {
  name       = local.instance_signature_clean
  location   = lower(data.google_storage_bucket.project.location)
  cluster    = google_container_cluster.instance.name
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = "e2-medium"

    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = google_service_account.instance.email
    oauth_scopes    = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}


resource "google_container_cluster" "instance" {
  provider                 = google-beta

  name                     = local.instance_signature_clean
  location                 = lower(data.google_storage_bucket.project.location)

  network                  = google_compute_network.instance.name
  subnetwork               = google_compute_subnetwork.instance.id

  # Enable Autopilot for this cluster
  # enable_autopilot = false

  initial_node_count = 1
  remove_default_node_pool = true

  private_cluster_config {
    enable_private_endpoint = false
    enable_private_nodes    = true
    master_ipv4_cidr_block  = "172.23.0.0/28"
  }

  master_authorized_networks_config {
    dynamic "cidr_blocks" {
        for_each = local.authorized_source_ranges
        content {
            cidr_block = cidr_blocks.value
        }
    }
   }

#   maintenance_policy {
#     recurring_window {
#       start_time = "2021-06-18T00:00:00Z"
#       end_time   = "2050-01-01T04:00:00Z"
#       recurrence = "FREQ=WEEKLY"
#     }
#   }

  # Configuration of cluster IP allocation for VPC-native clusters
  ip_allocation_policy {
    cluster_secondary_range_name  = "pods"
    services_secondary_range_name = "services"
  }

  # Configuration options for the Release channel feature, which provide more control over automatic upgrades of your GKE clusters.
  release_channel {
    channel = "REGULAR"
  }

  addons_config {
    horizontal_pod_autoscaling {
      disabled = true
    }
    http_load_balancing  {
      disabled = true
    }
    network_policy_config {
      disabled = true
    }
    istio_config {
      disabled = false
    }
  }
  resource_labels = local.instance_tags
}
