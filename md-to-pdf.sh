#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: $0 <path_to_md_directory>"
  echo "Example: $0 ~/Documents/Notes"
  exit 1
fi

TARGET_DIR="$1"

if [ ! -d "$TARGET_DIR" ]; then
  echo "Error: Directory '$TARGET_DIR' does not exist."
  exit 1
fi

for file in "$TARGET_DIR"/*.md; do

  [ -e "$file" ] || {
    echo "No Markdown files found in '$TARGET_DIR'."
    break
  }

  outfile="${file%.md}.pdf"

  echo "Converting: $file -> $outfile ..."

  pandoc "$file" -o "$outfile" \
    --pdf-engine=xelatex \
    -V geometry:margin=1in \
    -V papersize:letter \
    --toc \
    -V colorlinks=true

  echo "✅ Successfully converted to: $outfile"
  echo "----------------------------------------"
done

echo "🎉 All conversions finished!"
