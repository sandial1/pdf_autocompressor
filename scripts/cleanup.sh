#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
RAW_DIR="$PROJECT_ROOT/data/raw"
ARCHIVE_DIR="$PROJECT_ROOT/data/archive"

mv "$RAW_DIR"/*.pdf "$ARCHIVE_DIR"/ 2>/dev/null