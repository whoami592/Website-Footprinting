#!/usr/bin/env bash
set -e

printf '[*] Installing dependencies for Website Footprinting Toolkit...\n'

if command -v apt-get >/dev/null 2>&1; then
  sudo apt-get update
  sudo apt-get install -y curl dnsutils whois openssl ca-certificates
elif command -v dnf >/dev/null 2>&1; then
  sudo dnf install -y curl bind-utils whois openssl ca-certificates
elif command -v yum >/dev/null 2>&1; then
  sudo yum install -y curl bind-utils whois openssl ca-certificates
elif command -v pacman >/dev/null 2>&1; then
  sudo pacman -Sy --needed curl bind whois openssl ca-certificates
else
  echo '[!] Unsupported package manager.'
  echo '    Install manually: curl, dig/bind-utils, whois, openssl, ca-certificates'
  exit 1
fi

chmod +x footprint.sh
printf '[+] Installation complete. Run: ./footprint.sh example.com\n'
