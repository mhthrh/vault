package model

import (
	"encoding/json"
	"errors"
	"os"
)

type Entity struct {
	Path  string                 `json:"path"`
	Value map[string]interface{} `json:"value"`
}

func ReadConfig(path string) ([]Entity, error) {

	file, err := os.Open(path)
	if err != nil {
		return nil, errors.New("Error opening file: " + err.Error())
	}
	defer func() {
		_ = file.Close()
	}()

	var e []Entity
	decoder := json.NewDecoder(file)
	if err := decoder.Decode(&e); err != nil {
		return nil, errors.New("Error decoding JSON: " + err.Error())
	}

	return e, nil
}
