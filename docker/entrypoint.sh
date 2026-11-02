#!/usr/bin/env bash
set -eu

# Run the setup script as the odysseus user to set up data directory permissions
/usr/sbin/gosu 1000 python /app/setup.py || true

# Set PYTHONPATH so pip-installed packages are visible
export PYTHONPATH="/usr/local/lib/python3.14/site-packages:/app/.local/lib/python3.14/site-packages:${PYTHONPATH:-}"

# Run the application  
/usr/sbin/gosu 1000 uvicorn app:app --host 0.0.0.0 --port 7000
