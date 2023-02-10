locals {
  node_pool_names = [
    "first-node-pool",
    "second-node-pool",
  ]

  node_counts = {
    "first-node-pool"  = 1,
    "second-node-pool" = 2,
  }

  machine_types = {
    "first-node-pool"  = "e2-medium",
    "second-node-pool" = "n1-standard-2",
  }

  location = {
    "first-node-pool"  = "us-west1",
    "second-node-pool" = "us-west1",
  }
}
