.PHONY: new clean help

new:
	@if [ -z "$(CONTEST)" ]; then \
		echo "err: CONTEST is not set"; \
		echo "ex: make new CONTEST=abc123"; \
		exit 1; \
	fi
	./new.sh $(CONTEST)

clean:
	./clean.sh
