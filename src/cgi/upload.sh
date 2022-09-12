#!/usr/bin/env bash

echo "Content-type: image/png"
echo ""

FILEPATH=/uploads/test_img

cat > $FILEPATH

FILENAME="/uploads/$(awk <$FILEPATH -F '"' 'NR==2{print $4}')"
awk <"$FILEPATH" 'NR>5 {print last} {last=$0}' > "$FILENAME"


cat "$FILENAME"
