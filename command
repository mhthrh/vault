yq e '.version' config.yaml


vault server -dev
vault server -dev

export VAULT_ADDR='http://127.0.0.1:8200'
export VAULT_TOKEN='hvs.xwtvWc6eNIXiyT3eo4O5qJa9'

1- insert path in secret engine.
    vault secrets enable -path=kv/my-new-path kv
2- now we can assign the ky value to that path.
    vault kv put kv/my-new-path/one my-key=my-value
3- read data from a path
    vault kv get path(kv/my-new-path/one)
    if we want read with specific format, cnn use:
    vault kv get -format=json path(kv/my-new-path/one)
4- delete a path
    vault kv delete path


export VAULT_ADDR='http://127.0.0.1:8200'
export VAULT_TOKEN='hvs.xwtvWc6eNIXiyT3eo4O5qJa9'

1- insert path in secret engine.
    vault secrets enable -path=kv/my-new-path kv
2- now we can assign the ky value to that path.
    vault kv put kv/my-new-path/one my-key=my-value
3- read data from a path
    vault kv get path(kv/my-new-path/one)
    if we want read with specific format, cnn use:
    vault kv get -format=json path(kv/my-new-path/one)
4- delete a path
    vault kv delete path



   ******* add --cap-add=IPC_LOCK to docker RUN **************

