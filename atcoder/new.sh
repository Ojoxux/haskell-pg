#!/bin/bash
# 新しいコンテスト用のディレクトリを作るスクリプト

if [ $# -lt 1 ]; then
    echo "ex: ./new.sh <contest name>"
    echo "ex: ./new.sh abc123"
    exit 1
fi

CONTEST=$1

if [ -d "$CONTEST" ]; then
    echo "err: $CONTEST already exists"
    exit 1
fi

mkdir -p "$CONTEST"

# 各問題ファイルを作成(a.hs~f.hs)
for problem in a b c d e f; do
    cat > "$CONTEST/${problem}.hs" << 'TEMPLATE'
main :: IO ()
main = do
    n <- readLn :: IO Int
    print n
TEMPLATE
done

cat > "$CONTEST/Makefile" << 'EOF'
.PHONY: test clean test-i

PROBLEM ?= a

test:
	@../test.sh $(PROBLEM).hs

test-i:
	@if [ -z "$(INFILE)" ]; then \
		echo "err: INFILE is not set"; \
		echo "ex: make test-i PROBLEM=c INFILE=test/c/sample-1.in"; \
		exit 1; \
	fi
	@bash ../interactive.sh $(PROBLEM).hs $(INFILE)

clean:
	@rm -rf .build a b c d e f
	@echo "cleaned up"
EOF

echo "done! $CONTEST dir created, happy coding! λ"
echo ""
echo "next steps:"
echo "  cd $CONTEST"
echo "  make test PROBLEM=a"
echo "  make test-i PROBLEM=c INFILE=test/c/sample-1.in"
