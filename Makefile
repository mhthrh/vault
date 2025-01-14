build:
	docker build --no-cache --progress=plain  -t my-vault:1.0 -f ./Dockerfile .
run-bg:
	docker run -d --rm -p 8200:8200 --name my-vault-container my-vault:1.0
run-fg:
	docker run --rm -p 8200:8200 --name my-vault-container my-vault:1.0