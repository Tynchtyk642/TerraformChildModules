locals { 
  node_pool_names = [ 
    "first-nl", 
    "second-nl", 
  ] 
 
  node_counts = { 
    "first-nl" = 1, 
    "second-nl" = 2, 
  } 
 
  machine_types = { 
    "first-nl" = "e2-micro", 
    "second-nl" = "n1-standard-2", 
  } 

  location = {
    "first-nl" = "us-east1", 
    "second-nl" = "us-east1",
  }

} 