#!/bin/bash

rm -rf ./build || true
mkdir ./build
docker run --rm -v $(pwd):/data --workdir /data alpine/helm package -d ./build . || exit 1
PACKAGE_PATH=$(find ./build -name "*.tgz")
HELM_REPOSITORY_URL=${HELM_REPOSITORY_URL:-"http://nrepo.intra.pixel.com.pl:8085"}
curl --data-binary "@$PACKAGE_PATH" $HELM_REPOSITORY_URL/api/charts
