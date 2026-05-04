#!/usr/bin/env bash
# M51_001 docs-site test specification — see
# usezombie/usezombie:docs/v2/active/M51_001_*.md §Test Specification.
#
# Source-file checks. Mintlify "renders" iff the source file exists with
# required content; "404s" iff the source file is absent (or hidden via
# .mintignore). The cross-tab API drift check is wired separately in
# `make _lint-openapi-drift`.

set -euo pipefail

cd "$(dirname "$0")/.."

fail=0
pass=0

check() {
  local name="$1"
  local cmd="$2"
  if eval "$cmd" >/dev/null 2>&1; then
    printf "  ✓ %s\n" "$name"
    pass=$((pass + 1))
  else
    printf "  ✗ %s\n" "$name"
    fail=$((fail + 1))
  fi
}

echo "M51_001 docs-site spec tests"

check "test_quickstart_page_renders" \
  '[ -f quickstart.mdx ] && grep -q "platform-ops" quickstart.mdx && grep -q "usezombie-install-platform-ops" quickstart.mdx'

check "test_concepts_context_lifecycle_renders" \
  '[ -f concepts/context-lifecycle.mdx ] && grep -q "tool_window" concepts/context-lifecycle.mdx && grep -q "memory_checkpoint_every" concepts/context-lifecycle.mdx'

check "test_skills_index_renders" \
  '[ -f skills/index.mdx ] && grep -q "usezombie-install-platform-ops" skills/index.mdx'

check "test_concepts_v2_rewritten" \
  '! grep -E -i "AI-generated PRs|automated PR delivery|validated pull request" concepts.mdx'

check "test_how_it_works_deleted" \
  '[ ! -f how-it-works.mdx ]'

check "test_no_self_host_page_in_v2" \
  '[ ! -f self-host.mdx ]'

# Operator/ directory removed entirely (v1 self-host content was stale; v3 docs
# will be authored fresh from usezombie/usezombie:docs/architecture/). Source
# absent → every /operator/* URL 404s.
check "test_no_operator_pages_render" \
  '[ ! -d operator ]'

check "test_no_privacy_telemetry_page_in_v2" \
  '[ ! -f privacy/cli-telemetry.mdx ]'

check "test_homelab_pages_404" \
  '[ ! -f integrations/lead-collector.mdx ] && [ ! -f launch/homelab-zombie.mdx ]'

# Cross-tab API entry resolution. Each `<METHOD> /<path>` entry in docs.json's
# "API reference" tab must exist in the upstream openapi.json. Defers to the
# Makefile target which fetches and diffs against the live spec.
check "test_api_tab_routes_resolve_in_openapi" \
  'make _lint-openapi-drift'

echo
echo "  $pass passed, $fail failed"
[ "$fail" -eq 0 ]
