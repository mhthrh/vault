package main

import (
	"context"
	"github.com/mhthrh/vault/pkg/model"
	"github.com/mhthrh/vault/pkg/vault"
	"log"
	"os"
	"time"
)

var (
	address = ""
	token   = ""
	ctx     context.Context
	d       = time.Second * 10
)

func init() {
	address = os.Getenv("VAULT_ADDR")
	token = os.Getenv("VAULT_TOKEN")
	if len(address) == 0 || len(token) == 0 {
		log.Fatalln("vault address and/or token required")
	}
	ctx = context.Background()
}
func main() {
	log.Println("Start application.")

	data, err := model.ReadConfig("config/file.json")
	if err != nil {
		log.Fatalf("read config file error %v", err.Error())
	}
	c, err := vault.New(address, d)
	if err != nil {
		log.Fatalf("create vault error %v", err.Error())
	}
	err = c.SetToken(token)
	if err != nil {
		log.Fatalf("set token error %v", err.Error())
	}
	for _, v := range data {
		err = c.Write(ctx, v.Path, v.Value)
		if err != nil {
			log.Fatalf("write error %v", err.Error())
		}
	}
}
