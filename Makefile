.PHONY: dev lint validate broken-links

dev:
	npx mintlify dev

lint: validate broken-links

validate:
	npx mintlify validate

broken-links:
	npx mintlify broken-links
