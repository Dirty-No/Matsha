#!/usr/bin/env bash

echo "Content-type: image/png"
echo ""

FILEPATH=/uploads/test_img

cat > $FILEPATH

FILENAME=$(awk <$FILEPATH -F '"' 'NR==2{print $4}')
awk <"$FILEPATH" 'NR>5 {print last} {last=$0}' > "$FILEPATH"_done


cat "$FILEPATH"_done

# printf "%s" "$CONTENT"
