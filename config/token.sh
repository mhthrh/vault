#!/bin/bash

VAULT_ADDR='http://127.0.0.1:8200'

# Initialize Vault
init_output=$(vault operator init -format=json -root-token="my-custom-root-token")

# Save unseal keys and root token
echo "$init_output" > vault-init.json

# Extract unseal keys and unseal Vault
for key in $(echo "$init_output" | jq -r '.unseal_keys_b64[]'); do
  vault operator unseal "$key"
done

# Log in with root token
vault login "my-custom-root-token"

echo "Vault initialized and unsealed. Root token: my-custom-root-token"
