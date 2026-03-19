# vhost-cli 🚀 [>_]

A fast, lightweight, and dependency-free CLI tool written in Bash to automate Virtual Host management and SSL provisioning for **Nginx** and **Caddy**.

Whether you need to quickly expose a Node.js/Python app via a reverse proxy, host a static site, or deploy a Single Page Application (SPA) with fallback routing, `vhost` handles the boilerplate and Let's Encrypt certificates for you in seconds.

## ✨ Features

- **Auto-Detects Web Server:** Works seamlessly with Caddy or Nginx.
- **Reverse Proxy Mode:** Easily proxy traffic to local ports (e.g., Next.js, Express, Docker containers).
- **SPA Routing:** Built-in `try_files` configuration for React, Vue, or Angular apps.
- **Automated SSL:** Zero-downtime Let's Encrypt integration via Certbot (for Nginx) or native ACME (for Caddy).
- **Naked Domain Redirects:** Automatically redirects `domain.com` to `www.domain.com` (or vice versa).
- **JSON Output:** Run `list` or `inspect` with `--json` for easy integration with dashboards or automation tools.
<br>

## 📦 Installation

Run the following command to download and install `vhost` globally on your Linux server:

```bash
curl -sL https://raw.githubusercontent.com/talamantesvictor/vhost-cli/main/install.sh | bash
```

*Note: The installation requires `sudo` to place the executable in `/usr/local/bin`.*
<br><br>

## 🛠️ Usage

`vhost` requires root privileges to modify server configurations and reload services.

**Syntax:**
```bash
sudo vhost <action> [options] [domain]
```

### Actions
| Action | Description |
|---|---|
| `add` | Creates a new virtual host and attempts SSL generation. |
| `remove` | Deletes an existing virtual host and its certificates. |
| `list` | Lists all configured domains on the server. |
| `inspect` | Shows detailed info about a specific domain (target, type, SSL status/expiry). |

### Options (for `add`)
| Flag | Description |
|---|---|
| `-p <port>` | Reverse proxy target port (e.g., `3000`). |
| `-n <domain>` | Naked domain redirect (e.g., `domain.com` -> `www.domain.com`). |
| `-e <email>` | Email for Let's Encrypt notifications (Highly recommended for Nginx). |
| `-a` | Enable SPA mode (fallback routing to `/index.html`). |
| `-s` | Force HTTPS redirect (Enabled by default). |
| `--wildcard` | Enable wildcard SSL (`*.domain.com`). |

### Global Options
| Flag | Description |
|---|---|
| `--caddy` | Force Caddy server detection. |
| `--nginx` | Force Nginx server detection. |
| `--json` | Output results in JSON format (only for `list` & `inspect`). |

### Common Examples

**1. Create a Reverse Proxy (Node.js/Docker)**
Proxy a domain to a local service running on port 3000:
```bash
sudo vhost add -p 3000 api.mydomain.com
```

**2. Host a Static Website (or SPA)**
Serve static files and route 404s to `index.html` (Perfect for React/Vue):
```bash
sudo vhost add -a myapp.com
```

**3. Setup Domain + www Redirect + SSL Email**
Configure `www.domain.com`, redirect `domain.com` to it, and register Let's Encrypt with your email:
```bash
sudo vhost add -n domain.com -e me@myemail.com www.domain.com
```

**4. List all sites and Inspect a specific domain**
```bash
sudo vhost list
sudo vhost inspect myapp.com

# Use --json for API-friendly output
sudo vhost list --json
sudo vhost inspect myapp.com --json
```
<br>

## 🔒 Requirements

- A Linux environment (Debian/Ubuntu recommended)
- Root (`sudo`) access
- **Nginx** + `certbot` OR **Caddy**
- Basic DNS utilities (`dnsutils` package for `dig`, optional but recommended for pre-flight checks).
<br><br>

## 📄 License

**MIT License**
