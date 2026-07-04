#!/bin/bash
# テスト用のスクリプト

if [ $# -lt 1 ]; then
    echo "ex: ./test.sh <haskell file>"
    exit 1
fi

HSFILE=$1
BASENAME=$(basename "$HSFILE" .hs)
OUTPUT="${BASENAME}.out"

if [ ! -f "$HSFILE" ]; then
    echo "err: $HSFILE not found"
    exit 1
fi

echo "compiling..."
ghc -O2 -o "$OUTPUT" "$HSFILE" 2>&1 | grep -v "Loaded package" || true

if [ ! -f "$OUTPUT" ]; then
    echo "compile error"
    exit 1
fi

echo "ready to test"
echo ""

while true; do
    ./"$OUTPUT"
    echo ""
done

