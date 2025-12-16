#!/usr/bin/env bash
set -euo pipefail
# Root-level shim so Netlify UI/build can find the script even if base dir changes.

echo "[shim] PWD=$(pwd)"
echo "[shim] Listing root" && ls -la || true

if [ -f "scripts/netlify_build_debug.sh" ]; then
  echo "[shim] Running scripts/netlify_build_debug.sh"
  exec bash scripts/netlify_build_debug.sh
fi

echo "[shim] scripts/netlify_build_debug.sh not found; searching..." >&2
find . -maxdepth 3 -type f -name "netlify_build_debug.sh" -print || true
echo "[shim] No usable build script found" >&2
exit 1
