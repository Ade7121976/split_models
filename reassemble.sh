#!/usr/bin/env bash
# Reassemble split shards back into their original safetensors files.
# Run this once after cloning, before loading the model.
# Usage: bash reassemble.sh

set -e
cd "$(dirname "$0")"

for base in $(ls *.part_aa 2>/dev/null | sed 's/\.part_aa$//'); do
    echo "Reassembling ${base}..."
    cat "${base}".part_* > "${base}"
    rm "${base}".part_*
    echo "  Done: ${base}"
done

echo "All shards reassembled."
