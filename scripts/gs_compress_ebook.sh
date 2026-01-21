#!/bin/bash

# Script to compress PDF files from data/raw directory using Ghostscript
# Logs operations with timestamps to data/logs directory

# Get the script's directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
RAW_DIR="$PROJECT_ROOT/data/raw"
OUTPUT_DIR="$PROJECT_ROOT/data/output"
LOGS_DIR="$PROJECT_ROOT/data/logs"

# Process each PDF file in the data/raw directory
for pdf_file in "$RAW_DIR"/*.pdf; do
    # Skip if no PDF files found
    if [ ! -f "$pdf_file" ]; then
        echo "No PDF files found in $RAW_DIR"
        exit 0
    fi
    
    # Get filename without path
    filename=$(basename "$pdf_file")
    filename_no_ext="${filename%.pdf}"
    
    # Create timestamp-based output filename
    timestamp=$(date +"%Y%m%d_%H%M%S")
    output_file="$OUTPUT_DIR/${filename_no_ext}_compressed_${timestamp}.pdf"
    
    # Create log file
    log_file="$LOGS_DIR/${timestamp}_${filename}.log"
    
    # Run Ghostscript compression and log
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Processing: $filename" | tee -a "$log_file"
    
    if gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH -sOutputFile="$output_file" "$pdf_file" >> "$log_file" 2>&1; then
        echo "[$(date '+%Y-%m-%d %H:%M:%S')] Successfully compressed: $filename" | tee -a "$log_file"
        echo "[$(date '+%Y-%m-%d %H:%M:%S')] Output: $output_file" | tee -a "$log_file"
    else
        echo "[$(date '+%Y-%m-%d %H:%M:%S')] Error compressing: $filename" | tee -a "$log_file"
    fi
    
    echo "" | tee -a "$log_file"
done

echo "All PDF files processed. Check $LOGS_DIR for details."
