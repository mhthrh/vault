package vault

import (
	"context"
	"encoding/json"
	"fmt"
	"github.com/hashicorp/vault-client-go"
	"time"
)

type Client struct {
	VaultClient *vault.Client
}

func New(address string, duration time.Duration) (Client, error) {
	client, err := vault.New(
		vault.WithAddress(address),
		vault.WithRequestTimeout(duration),
	)
	if err != nil {
		return Client{}, err
	}
	return Client{VaultClient: client}, nil
}
func (c *Client) SetToken(token string) error {
	if err := c.VaultClient.SetToken(token); err != nil {
		return err
	}
	return nil
}

func (c *Client) Write(ctx context.Context, path string, value map[string]any) error {
	valueJSON, err := json.Marshal(value)
	fmt.Println(valueJSON)
	_, err = c.VaultClient.Write(ctx, path, map[string]interface{}{
		"data": value,
	})
	if err != nil {
		return err
	}
	return nil
}
