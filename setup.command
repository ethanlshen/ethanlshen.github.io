#!/usr/bin/env bash

SCRIPT_PATH=$(dirname "$0")
cd "$SCRIPT_PATH"

python3 -m venv venv
source venv/bin/activate
pip install pyyaml
pip install Pillow
echo $VIRTUAL_ENV

python scripts/main.py
python scripts/build_galleries.py
