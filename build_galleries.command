#!/usr/bin/env bash
# Rebuild _data/galleries.yml from photos/photography/<gallery>/ subfolders.
# Creates ./venv if missing and ensures pyyaml + Pillow are installed.

set -euo pipefail
cd "$(dirname "$0")"

if [ ! -d venv ]; then
  echo "creating venv..."
  python3 -m venv venv
fi

# shellcheck disable=SC1091
source venv/bin/activate

python -c "import yaml, PIL" 2>/dev/null || {
  echo "installing dependencies..."
  pip install --quiet pyyaml Pillow
}

python scripts/build_galleries.py
