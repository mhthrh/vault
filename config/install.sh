#!/bin/bash

echo "start build shell."

if [ -z "$BUILD_ENV" ]; then
  echo "BUILD_ENV is not set!"
  exit 1
else
  echo " BUILD_ENV is set to: $BUILD_ENV"
fi

if [ "$BUILD_ENV" = "PROD" ]; then
    vault server -config=/app/config/prod-config.hcl
  else
    vault server  -config=/app/config/dev-config.hcl
fi

./token.sh
/app/vaultInitializer