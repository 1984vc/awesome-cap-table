#!/usr/bin/env sh
set -eu

cd "$(dirname "$0")/.."

minicap validate
minicap export ocx --output cap-table.xlsx
report=$(minicap report)
printf '%s\n' "$report" | awk '
  /^## Summary$/ {
    print "[Download the Excel cap table](cap-table.xlsx)"
    print ""
  }
  { print }
' > README.md
