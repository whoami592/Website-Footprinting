# Website Footprinting Toolkit (Bash)

**Coded by Cyber Security Engineer Mr Sabaz Ali**

A passive / low-impact website reconnaissance project for domains you own or are explicitly authorized to assess.

## Features

- DNS records: A, AAAA, MX, NS, TXT, CNAME, SOA
- WHOIS lookup
- HTTP response headers
- TLS certificate metadata
- `robots.txt`
- `security.txt`
- Homepage title and basic technology clues
- Passive Certificate Transparency subdomain discovery via `crt.sh`
- Timestamped reports saved in `reports/`

## Safety scope

This project intentionally does **not** perform:

- Port scanning
- Vulnerability exploitation
- Password attacks
- Login brute force
- Directory brute forcing
- Subdomain brute forcing
- Denial-of-service testing

Use it only on assets you own or have permission to test.

## Kali / Debian / Ubuntu

```bash
chmod +x install.sh footprint.sh
./install.sh
./footprint.sh example.com
```

You can also pass a URL:

```bash
./footprint.sh https://example.com
```

## Manual dependencies

- bash
- curl
- dig (`dnsutils` / `bind-utils`)
- whois
- openssl
- standard Unix tools: `grep`, `sed`, `awk`, `sort`, `head`, `tee`

## Output

Each run creates a directory such as:

```text
reports/example.com_20260928_120000/
├── summary.txt
├── dns.txt
├── whois.txt
├── http_headers.txt
├── tls.txt
├── robots.txt
├── security.txt
├── homepage.html
├── technology_hints.txt
└── ct_subdomains.txt
```

## Example

```bash
./footprint.sh example.com
```

## Credit

Coded by Cyber Security Engineer **Mr Sabaz Ali**.
