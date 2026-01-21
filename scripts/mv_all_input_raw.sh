#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
INPUT_DIR="$PROJECT_ROOT/input"
RAW_DIR="$PROJECT_ROOT/data/raw"

# Move all files from input to data/raw
#mv "$INPUT_DIR"/*.pdf "$RAW_DIR"/ 2>/dev/null

# Move all files, regardless of extension
mv "$INPUT_DIR"/* "$RAW_DIR"/ 2>/dev/null