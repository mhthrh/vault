storage "file" {
  path    = "/opt/vault/data"
  node_id="node1"
}

listener "tcp" {
  address     = "0.0.0.0:8200"
  cluster_address = "0.0.0.0:8201"
  tls_disable = true 
}

audit "file" {
  file_path = "/opt/vault/logs/vault_audit.log"
}

api_addr = "http://127.0.0.1:8200"

ui=true


# Default Lease Configurations
default_lease_ttl = "1h"
max_lease_ttl     = "24h"

# Performance Tuning
disable_mlock = true
log_level     = "info"

