locals {
  node_pool_names = [
    "first-node-pool",
    "second-node-pool",
    "third-node-pool",
  ]

  node_counts = {
    "first-node-pool"  = 1,
    "second-node-pool" = 2,
    "third-node-pool"  = 3,
  }

  machine_types = {
    "first-node-pool"  = "e2-medium",
    "second-node-pool" = "n1-standard-2",
    "third-node-pool"  = "n1-standard-4",
  }

  node_pool_location = {
    "first-node-pool"  = "e2-medium",
    "second-node-pool" = "n1-standard-2",
    "third-node-pool"  = "n1-standard-4",
  }
}
