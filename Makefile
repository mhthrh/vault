build:
	docker build --no-cache --progress=plain  -t my-vault:1.0 -f ./Dockerfile .
run:
	docker run  -p 8200:8200 --name my-vault-container my-vault:1.0
