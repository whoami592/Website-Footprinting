#!/usr/bin/env bash
set -u

# Website Footprinting Toolkit
# Coded by Cyber Security Engineer Mr Sabaz Ali
# Passive / low-impact reconnaissance for systems you own or are authorized to assess.

BANNER='⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠴⠒⠋⠉⠉⠉⠉⠉⠙⠒⠦⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⠊⠁⠀⠀⠀⣀⣀⣠⠤⠤⠤⠤⠤⣄⠙⢦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⡥⠴⠒⠊⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠈⢧⠀⢳⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡟⠀⡀⠀⠀⠀⠀⠀⠀⢀⣠⣶⣿⣷⣤⣀⠈⡆⠘⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢷⣸⣿⣿⣶⣤⡀⠀⣴⣿⡟⢉⠀⠀⠀⠉⠀⢸⡀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠁⠀⢀⣩⡛⢿⠉⡍⠛⣷⣾⣿⣷⢤⠴⠷⢄⣇⣿⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡧⢰⣿⣿⣿⠇⠀⣷⠀⠉⠉⠉⠉⠀⠀⠀⠸⢿⠥⢿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀⠀⣿⡇⠀⠀⠀⠀⠀⠀⢀⠀⢹⣦⡼⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢧⠀⠀⢀⡀⢠⡀⢛⣁⣬⠆⠉⠉⣱⡿⡍⠀⢸⠛⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣇⢺⣧⣀⣈⣿⣿⣿⣷⣤⣴⣶⡿⣻⠁⠀⣼⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⡎⢿⠛⠛⠛⣿⣾⣏⣩⠍⠀⡸⠃⠀⣰⡧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢮⡳⡌⠉⠻⣿⡿⠀⠀⠼⠁⢠⠞⡟⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⢄⠀⠀⣿⣿⠀⠀⢀⡜⠁⠚⠀⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡞⠈⠻⣗⠦⠽⠿⠤⠞⠁⠀⠀⠀⠀⣿⢷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⠞⠁⣇⠀⠀⠈⠳⢄⡀⠀⠀⠀⠀⠀⠀⢀⡟⢸⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⢀⣀⡠⠤⠖⠒⠋⠉⡇⠀⠀⢹⡀⠀⠀⠀⠀⠙⠲⢤⡀⠀⢀⡴⠋⠀⢀⡇⠉⠲⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⣠⠤⠒⠋⠉⠀⠀⠀⠀⠀⠀⢰⣧⠀⠀⠈⣧⠀⠀⠀⠀⠀⠀⠀⡹⠓⠋⠲⡄⠀⠈⣧⠀⠀⠸⡍⠙⠲⠤⣄⣀⠀⠀⠀⠀⠀
⡞⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⡿⠀⠀⠀⢻⡳⣄⠀⠀⠀⣠⠞⠀⠀⠀⠀⠘⣆⠀⣾⡄⠀⠀⠹⡄⠀⠀⠀⠈⠉⠒⢤⡀⠀
⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⡇⠀⠀⠀⠈⣇⠈⢣⡀⣰⢳⡀⠀⠀⠀⢀⡞⠉⠶⠁⢧⠀⠀⠀⢱⡀⠀⠀⠀⠀⠀⠀⢧⠀
⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣇⠀⠀⠀⠀⢸⡀⠀⠙⠇⠀⢹⠒⠒⠒⢯⠀⠀⠀⠀⢸⡀⠀⠀⢀⡇⠀⠀⠀⠀⠀⠀⠘⣆
⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠂⠀⠀⠸⠇⠀⠀⠀⠀⠟⠀⠀⠀⠈⠧⠀⠀⠀⠘⠇⠀⠀⠉⠀⠀⠀⠀⠀⠀⠀⠀⠻
⠀⠀⠀⠁⠁⠀⠁⠀⠀⠀⠀⠈⠀⠀⠀⠈⠉⠉⠋⠉⠉⠉⠉⠁⠉⠉⠀⠉⠈⠁⠉⠉⠛⠛⠋⠉⠉⠉⠉⠉⠉⠉⠉⠀⠈⠀⠀'

print_banner() {
  printf '%s\n' "$BANNER"
  printf '\n[ Website Footprinting Toolkit ]\n'
  printf '[ Coded by Cyber Security Engineer Mr Sabaz Ali ]\n'
  printf '[ Passive / Authorized Reconnaissance Only ]\n\n'
}

usage() {
  cat <<'EOF_USAGE'
Usage:
  ./footprint.sh example.com
  ./footprint.sh https://example.com

This tool performs passive/low-impact checks only:
  - DNS records
  - WHOIS information
  - HTTP response headers
  - TLS certificate metadata
  - robots.txt and security.txt
  - Homepage title / basic HTML technology hints
  - Certificate Transparency subdomains via crt.sh (best effort)

Use only on domains you own or have permission to assess.
EOF_USAGE
}

need_cmd() {
  command -v "$1" >/dev/null 2>&1 || return 1
}

section() {
  printf '\n============================================================\n'
  printf '%s\n' "$1"
  printf '============================================================\n'
}

clean_domain() {
  local input="$1"
  input="${input#http://}"
  input="${input#https://}"
  input="${input%%/*}"
  input="${input%%:*}"
  printf '%s' "$input"
}

valid_domain() {
  local d="$1"
  [[ "$d" =~ ^([A-Za-z0-9]([A-Za-z0-9-]{0,61}[A-Za-z0-9])?\.)+[A-Za-z]{2,63}$ ]]
}

save_and_show() {
  local file="$1"
  tee "$file"
}

TARGET_INPUT="${1:-}"
if [[ -z "$TARGET_INPUT" || "$TARGET_INPUT" == "-h" || "$TARGET_INPUT" == "--help" ]]; then
  print_banner
  usage
  exit 0
fi

DOMAIN="$(clean_domain "$TARGET_INPUT")"
if ! valid_domain "$DOMAIN"; then
  echo "[!] Invalid domain: $DOMAIN"
  echo "    Example: example.com"
  exit 1
fi

if [[ "$TARGET_INPUT" =~ ^https?:// ]]; then
  BASE_URL="${TARGET_INPUT%/}"
else
  BASE_URL="https://$DOMAIN"
fi

TIMESTAMP="$(date +%Y%m%d_%H%M%S)"
OUTDIR="reports/${DOMAIN}_${TIMESTAMP}"
mkdir -p "$OUTDIR"

print_banner
printf '[+] Target : %s\n' "$DOMAIN"
printf '[+] URL    : %s\n' "$BASE_URL"
printf '[+] Report : %s\n' "$OUTDIR"

{
  echo "Website Footprinting Report"
  echo "Target: $DOMAIN"
  echo "URL: $BASE_URL"
  echo "Generated: $(date -Is 2>/dev/null || date)"
  echo "Coded by Cyber Security Engineer Mr Sabaz Ali"
} > "$OUTDIR/summary.txt"

section "1. DNS RECORDS"
if need_cmd dig; then
  {
    echo "--- A ---"; dig +short A "$DOMAIN"
    echo "--- AAAA ---"; dig +short AAAA "$DOMAIN"
    echo "--- MX ---"; dig +short MX "$DOMAIN"
    echo "--- NS ---"; dig +short NS "$DOMAIN"
    echo "--- TXT ---"; dig +short TXT "$DOMAIN"
    echo "--- CNAME ---"; dig +short CNAME "$DOMAIN"
    echo "--- SOA ---"; dig +short SOA "$DOMAIN"
  } | save_and_show "$OUTDIR/dns.txt"
else
  echo "[-] 'dig' not installed. Install dnsutils/bind-utils." | tee "$OUTDIR/dns.txt"
fi

section "2. WHOIS"
if need_cmd whois; then
  whois "$DOMAIN" 2>/dev/null | sed -n '1,180p' | save_and_show "$OUTDIR/whois.txt"
else
  echo "[-] 'whois' not installed." | tee "$OUTDIR/whois.txt"
fi

section "3. HTTP RESPONSE HEADERS"
if need_cmd curl; then
  curl -L -I --max-time 12 --connect-timeout 6 -A 'WebsiteFootprinting/1.0' "$BASE_URL" 2>/dev/null \
    | sed -n '1,100p' | save_and_show "$OUTDIR/http_headers.txt"
else
  echo "[-] 'curl' not installed." | tee "$OUTDIR/http_headers.txt"
fi

section "4. TLS CERTIFICATE"
if need_cmd openssl; then
  {
    echo | openssl s_client -servername "$DOMAIN" -connect "$DOMAIN:443" 2>/dev/null \
      | openssl x509 -noout -subject -issuer -serial -dates -fingerprint -sha256 2>/dev/null
  } | save_and_show "$OUTDIR/tls.txt"
else
  echo "[-] 'openssl' not installed." | tee "$OUTDIR/tls.txt"
fi

section "5. ROBOTS.TXT"
if need_cmd curl; then
  curl -fsSL --max-time 10 -A 'WebsiteFootprinting/1.0' "https://$DOMAIN/robots.txt" 2>/dev/null \
    | sed -n '1,160p' | save_and_show "$OUTDIR/robots.txt" || true
  [[ -s "$OUTDIR/robots.txt" ]] || echo "[i] robots.txt not found or unavailable." | tee "$OUTDIR/robots.txt"
fi

section "6. SECURITY.TXT"
if need_cmd curl; then
  {
    curl -fsSL --max-time 10 -A 'WebsiteFootprinting/1.0' "https://$DOMAIN/.well-known/security.txt" 2>/dev/null \
      || curl -fsSL --max-time 10 -A 'WebsiteFootprinting/1.0' "https://$DOMAIN/security.txt" 2>/dev/null \
      || true
  } | sed -n '1,160p' | save_and_show "$OUTDIR/security.txt"
  [[ -s "$OUTDIR/security.txt" ]] || echo "[i] security.txt not found or unavailable." | tee "$OUTDIR/security.txt"
fi

section "7. HOMEPAGE METADATA / BASIC TECHNOLOGY HINTS"
if need_cmd curl; then
  TMP_HTML="$OUTDIR/homepage.html"
  curl -fsSL --max-time 15 --connect-timeout 6 -A 'Mozilla/5.0 WebsiteFootprinting/1.0' "$BASE_URL" \
    -o "$TMP_HTML" 2>/dev/null || true

  if [[ -s "$TMP_HTML" ]]; then
    {
      echo "Page title:"
      grep -ioE '<title[^>]*>[^<]{0,200}</title>' "$TMP_HTML" | head -n 1 | sed -E 's/<\/?title[^>]*>//Ig' || true
      echo
      echo "Generator meta tag:"
      grep -ioE '<meta[^>]+name=["'\'' ]*generator["'\'' ]*[^>]*>' "$TMP_HTML" | head -n 3 || true
      echo
      echo "Interesting technology strings (non-exhaustive):"
      grep -Eio 'wordpress|wp-content|drupal|joomla|shopify|wix|squarespace|next\.js|__next|react|vue|angular|cloudflare|bootstrap|jquery' "$TMP_HTML" \
        | tr '[:upper:]' '[:lower:]' | sort -u | head -n 40 || true
    } | save_and_show "$OUTDIR/technology_hints.txt"
  else
    echo "[i] Homepage could not be retrieved." | tee "$OUTDIR/technology_hints.txt"
  fi
fi

section "8. CERTIFICATE TRANSPARENCY SUBDOMAINS (PASSIVE)"
if need_cmd curl; then
  CT_FILE="$OUTDIR/ct_subdomains.txt"
  CT_JSON="$(curl -fsSL --max-time 15 "https://crt.sh/?q=%25.$DOMAIN&output=json" 2>/dev/null || true)"
  if [[ -n "$CT_JSON" ]]; then
    printf '%s' "$CT_JSON" \
      | grep -oE '"name_value":"[^"]+"' \
      | sed 's/^"name_value":"//;s/"$//' \
      | sed 's/\\n/\n/g' \
      | sed 's/^\*\.//' \
      | grep -E "(^|\.)$(printf '%s' "$DOMAIN" | sed 's/\./\\./g')$" \
      | sort -u | head -n 300 | save_and_show "$CT_FILE" || true
  fi
  [[ -s "$CT_FILE" ]] || echo "[i] No CT results returned." | tee "$CT_FILE"
fi

section "9. SUMMARY"
{
  echo "Target: $DOMAIN"
  if need_cmd dig; then
    IP="$(dig +short A "$DOMAIN" | head -n 1)"
    echo "Primary IPv4: ${IP:-N/A}"
  fi
  if [[ -s "$OUTDIR/http_headers.txt" ]]; then
    SERVER="$(grep -i '^server:' "$OUTDIR/http_headers.txt" | tail -n 1 | tr -d '\r' || true)"
    echo "${SERVER:-Server header: not disclosed}"
  fi
  echo "Output directory: $OUTDIR"
  echo "Completed: $(date -Is 2>/dev/null || date)"
} | tee -a "$OUTDIR/summary.txt"

printf '\n[+] Done. Review files inside: %s\n' "$OUTDIR"
printf '[!] Use only with authorization.\n'
