#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5da648af8e296f001b53d1c8/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5da648af8e296f001b53d1c8
curl -s -X POST https://api.stackbit.com/project/5da648af8e296f001b53d1c8/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5da648af8e296f001b53d1c8/webhook/build/publish > /dev/null
