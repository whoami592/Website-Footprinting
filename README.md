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
MIT License

Copyright (c) 2026 Cyber Security Engineer Mr Sabaz Ali Khan

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.


## Credit

Coded by Cyber Security Engineer **Mr Sabaz Ali**.
