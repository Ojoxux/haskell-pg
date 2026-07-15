#!/bin/bash
# インタラクティブ問題で使うやつで、.inにNとジャッジ応答(Yes,No)を並べる

if [ $# -lt 1 ]; then
  echo "ex: ./interactive.sh problem.hs input.in"
  exit 1
fi

HSFILE=$1
INFILE=$2
BASENAME=$(basename "$HSFILE" .hs)
OUTPUT="${BASENAME}.out"

if [ ! -f "$HSFILE" ]; then
  echo "err: $HSFILE not found"
  exit 1
fi

if [ -z "$INFILE" ]; then
  echo "err: input file is not set"
  echo "ex: ./interactive.sh problem.hs input.in"
  exit 1
fi

if [ ! -f "$INFILE" ]; then
  echo "err: $INFILE not found"
  exit 1
fi

ghc -O2 -o "$OUTPUT" "$HSFILE" 2>&1 | grep -v "Loaded package" || true
if [ ! -f "$OUTPUT" ]; then
  echo "compile error"
  exit 1
fi

echo "=== input ==="
cat "$INFILE"
echo "=== output ==="
./"$OUTPUT" < "$INFILE"
