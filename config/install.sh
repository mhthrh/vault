#!/bin/bash

env="$IS_PROD"
echo "start build shell."

if [ -z "$env" ]; then
  echo "BUILD_ENV is not set!"
  exit 1
else
  echo " BUILD_ENV is set to: $env"
fi

if [ "$env" = "0" ]; then
    vault server  -config=/app/config/dev-config.hcl &
  else
    vault server -config=/app/config/prod-config.hcl &
    echo "start token, please wait"
    sh /app/config/token.sh
    echo "token done"
fi



echo "start vaultInitializer"
/app/vaultInitializer
echo "vaultInitializer done"