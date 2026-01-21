#!/bin/bash

# PDF file compression pipeline script using Ghostscript
# Script to compress PDF files from data/raw directory using Ghostscript
# Logs operations with timestamps to data/logs directory

# Procedure
# 1. Scan all files on the data/raw directory and compress PDF files
# 2. Save compressed files to data/output with timestamp-based filenames
# 3. Log all operations with timestamps to data/logs directory
# 4. Move processed files to data/archive