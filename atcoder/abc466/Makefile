.PHONY: test clean test-c

PROBLEM ?= a

test:
	@../test.sh $(PROBLEM).hs

test-c:
	@bash ../test-interactive.sh c.hs test/c/sample-1.in

clean:
	@rm -rf .build a b c d e f
	@echo "cleaned up"
