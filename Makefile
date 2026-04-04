.PHONY: dev lint

dev:
	npx mintlify dev

lint:
	npx mintlify validate
	npx mintlify broken-links
	find . -name "*.mdx" | xargs -I{} npx markdown-link-check --config .mlc-config.json {}
