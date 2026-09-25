# Server Init

One-click Linux server initialization script.

This project combines several common server initialization tasks into a single script.

## Features

The script performs the following tasks in order:

1. Update APT package lists
2. Install `curl`
3. Install Docker
4. Run BBR optimization
5. Run host audit

## Supported Systems

Designed primarily for Debian and Ubuntu based systems.

Recommended:

- Debian 11
- Debian 12
- Ubuntu 22.04
- Ubuntu 24.04

Root privileges are required.

## Quick Start

Run the following command as `root`:

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/kkkm0/server-init/main/install.sh)
