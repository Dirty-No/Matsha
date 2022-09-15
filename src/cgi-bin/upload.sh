#!/usr/bin/env bash

echo "Content-type: image/png"
echo ""

FILEPATH=/tmp/$(uuid)_$(date +%s)

cat > $FILEPATH

FILENAME="/uploads/$(basename $(awk <$FILEPATH -F '"' 'NR==2{print $4}'))"
awk <"$FILEPATH" 'NR>5 {print last} {last=$0}' > "$FILENAME"

cat "$FILENAME"
