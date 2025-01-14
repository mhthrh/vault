#!/bin/bash

token="${VAULT_TOKEN}"

init_output=$(vault operator init -format=json -root-token="$token")

echo "$init_output" > vault-init.json

for key in $(echo "$init_output" | jq -r '.unseal_keys_b64[]'); do
  vault operator unseal "$key"
done

# Log in with root token
vault login "$token"

echo "Vault initialized and unsealed. Root token: $token"
