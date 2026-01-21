#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
RAW_DIR="$PROJECT_ROOT/data/raw"
ARCHIVE_DIR="$PROJECT_ROOT/data/archive"

# Move all files from data/raw to data/archive
#mv "$RAW_DIR"/*.pdf "$ARCHIVE_DIR"/ 2>/dev/null

# Move all files, regardless of extension
mv "$RAW_DIR"/* "$ARCHIVE_DIR"/ 2>/dev/null