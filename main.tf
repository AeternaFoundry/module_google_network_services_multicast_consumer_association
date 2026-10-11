resource "google_network_services_multicast_consumer_association" "network_services_multicast_consumer_associations" {
  for_each = var.network_services_multicast_consumer_associations

  location                          = each.value.location
  multicast_consumer_association_id = each.value.multicast_consumer_association_id
  multicast_domain_activation       = each.value.multicast_domain_activation
  network                           = each.value.network
  deletion_policy                   = each.value.deletion_policy
  description                       = each.value.description
  labels                            = each.value.labels
  project                           = each.value.project

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

