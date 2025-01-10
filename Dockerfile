FROM ubuntu:latest
ENV GO_VERSION=1.22.0
ENV PATH=/usr/local/go/bin:$PATH
ENV BUILD_ENV='PROD'
ENV VAULT_ADDR='http://127.0.0.1:8200'
ENV VAULT_API_ADDR='http://127.0.0.1:8200'
ENV VAULT_TOKEN='~!root@token!~'
ENV VAULT_VERSION=1.15.3
ENV VAULT_DEV_LISTENER="tcp://0.0.0.0:8200"

RUN apt-get update && apt-get install -y \
    wget \
    tar \
    unzip \
    gnupg \
    && wget -q https://go.dev/dl/go${GO_VERSION}.linux-amd64.tar.gz \
    && tar -C /usr/local -xzf go${GO_VERSION}.linux-amd64.tar.gz \
    && rm go${GO_VERSION}.linux-amd64.tar.gz \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN wget -q https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip \
    && unzip vault_${VAULT_VERSION}_linux_amd64.zip -d /usr/local/bin/ \
    && rm vault_${VAULT_VERSION}_linux_amd64.zip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR app
COPY config/install.sh .
COPY go.mod go.sum ./
RUN go mod download
COPY . /app/
RUN go build -o vaultInitializer cmd/main.go

EXPOSE 8200 8201

RUN chmod +x /app/config/*.sh


CMD ["/app/config/install.sh"]
#CMD ["/app/config/token.sh"]
#CMD ["./vaultInitializer"]

