#!/usr/bin/env sh
set -eu

cd "$(dirname "$0")/.."

if [ -x .bin/minicap ]; then
  minicap=./.bin/minicap
elif [ -x .bin/minicap.exe ]; then
  minicap=./.bin/minicap.exe
else
  minicap=minicap
fi

"$minicap" validate
"$minicap" report > cap-table.md
"$minicap" export ocx --output cap-table.xlsx

for request in scenarios/*/request.json; do
  [ -f "$request" ] || continue
  "$minicap" report --round-request "$request" > "$(dirname "$request")/README.md"
done
