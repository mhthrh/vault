# Enable Vault UI
ui = true

# Listeners
listener "tcp" {
  # Primary listener for API traffic
  address     = "0.0.0.0:8200"
  tls_disable = 1  # Disable TLS for testing purposes (not recommended in production)
}

listener "tcp" {
  # Secondary listener for internal communication
  address     = "0.0.0.0:8201"
  tls_disable = 1
}

# Storage Backend (in-memory, behaves like development mode)
storage "inmem" {}

# Alternatively, file storage for persistence (uncomment if needed)
# storage "file" {
#   path = "/path/to/storage"
# }



# Default Lease Configurations
default_lease_ttl = "1h"
max_lease_ttl     = "24h"

# Performance Tuning
disable_mlock = true
log_level     = "info"



# Clustering (Optional, uncomment if using clustering)
# cluster_name = "example-cluster"
# cluster_address = "192.168.1.100:8202"

