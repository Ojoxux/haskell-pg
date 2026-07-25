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
