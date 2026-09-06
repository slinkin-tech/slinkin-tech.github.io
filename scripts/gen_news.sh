#!/bin/sh
# Regenerate _data/json/news.json from assets/txt/changelog.txt
#
# Parses lines of the form:  v1.13.17 [06.08.2026]
# and emits one JSON entry per release, newest first.

set -eu

ROOT=$(CDPATH='' cd -- "$(dirname -- "$0")/.." && pwd)
CHANGELOG="$ROOT/assets/txt/changelog.txt"
OUTPUT="$ROOT/_data/json/news.json"

[ -r "$CHANGELOG" ] || { echo "cannot read $CHANGELOG" >&2; exit 1; }

mkdir -p "$(dirname -- "$OUTPUT")"

awk '
  # v1.13.17 [06.08.2026]  ->  2026-08-06<TAB>v1.13.17
  match($0, /^v[0-9]+\.[0-9]+\.[0-9]+[ \t]+\[[0-9]{1,2}\.[0-9]{1,2}\.[0-9]{4}\][ \t]*$/) {
    version = $1
    gsub(/^\[|\]$/, "", $2)
    split($2, d, ".")
    printf "%s-%02d-%02d\t%s\n", d[3], d[2], d[1], version
  }
' "$CHANGELOG" \
| sort -r \
| awk -F'\t' '
  BEGIN { print "[" }
  {
    if (n++) print "  },"
    print "  {"
    printf "    \"name\": \"release_%s\",\n", $2
    print  "    \"url\": \"/assets/txt/changelog.txt\","
    print  "    \"type\": \"release\","
    printf "    \"date\": \"%s\"\n", $1
  }
  END {
    if (n) print "  }"
    print "]"
  }
' > "$OUTPUT.tmp"

mv -- "$OUTPUT.tmp" "$OUTPUT"

printf 'wrote %s releases to %s\n' \
  "$(grep -c '"name"' "$OUTPUT")" "${OUTPUT#"$ROOT/"}"