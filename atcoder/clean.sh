#!/bin/bash
# コンパイル生成物を削除するスクリプト

echo "cleaning up..."

# .out, .o, .hi ファイルを削除
rm -f *.out *.o *.hi

echo "done!"
echo "deleted files:"
echo "  - *.out"
echo "  - *.o"
echo "  - *.hi"

