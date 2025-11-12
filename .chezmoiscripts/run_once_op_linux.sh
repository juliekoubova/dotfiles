#!/bin/sh

has() {
  command -v "$1" >/dev/null
}

if has op; then
  exec op update
fi

test_command() {
  if ! has "$1"; then
    echo "Could not update 1Password; $1 not available" >&2
    return 1
  fi
}

test_command curl || exit 1
test_command jq || exit 1
test_command unzip || exit 1

ARCH="amd64"
OP_VERSION="$(curl https://app-updates.agilebits.com/check/1/0/CLI2/en/2.0.0/N -s | jq -r .version)"

echo "Downloading 1Password $OP_VERSION"
curl -sSfo op.zip \
  https://cache.agilebits.com/dist/1P/op2/pkg/v"$OP_VERSION"/op_linux_"$ARCH"_v"$OP_VERSION".zip \
  && unzip -o op.zip -x op.sig >/dev/null \
  && rm op.zip

