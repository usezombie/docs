.PHONY: dev lint

dev:
	npx mintlify dev

lint:
	npx mintlify validate
	npx mintlify broken-links
