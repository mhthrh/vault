#!/bin/bash

echo "start build shell."

if [ -z "$BUILD_ENV" ]; then
  echo "BUILD_ENV is not set!"
  exit 0
else
  echo " BUILD_ENV is set to: $BUILD_ENV"
fi

if [ "$BUILD_ENV" = "PROD" ]; then
    vault server -config=/etc/vault.d/vault-config.hcl
  else
    vault server --dev
fi

