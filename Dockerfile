FROM vault:1.13.3
WORKDIR app
COPY config/install.sh .
COPY config/secrets.yaml .
COPY config/config.hcl /etc/vault.d/vault-config.hcl

ENV BUILD_ENV='DEV'
ENV VAULT_ADDR='http://127.0.0.1:8200'

EXPOSE 8200
EXPOSE 8201

RUN chmod +x ./install.sh

RUN apk add --no-cache curl bash && \
    curl -L https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 -o /usr/bin/yq && \
    chmod +x /usr/bin/yq


CMD ["sh" , "./install.sh"]
#RUN vault secrets enable -path=kv/my-new-path kv

#CMD [" yq e '.secrets | to_entries[] | .key + '/' + (.value | to_entries[] | ' ' + (.key + '=' + .value))' config/secrets.yaml | xargs -L 1 vault kv put secret/data/"]
