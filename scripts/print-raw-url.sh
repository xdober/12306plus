#!/usr/bin/env bash
set -euo pipefail

SCRIPT_PATH="${1:-userscripts/12306-ticket-price.user.js}"
if [[ ! -f "$SCRIPT_PATH" ]]; then
  echo "error: $SCRIPT_PATH does not exist" >&2
  exit 1
fi

remote=$(git remote get-url origin 2>/dev/null || true)
if [[ -z "$remote" ]]; then
  cat >&2 <<'MSG'
error: git remote 'origin' is not configured.
Configure it with e.g.:
  git remote add origin git@github.com:<user>/12306plus.git
MSG
  exit 1
fi

slug=""
if [[ "$remote" =~ ^git@[^:]+:(.+)$ ]]; then
  slug="${BASH_REMATCH[1]}"
elif [[ "$remote" =~ ^https?://[^/]+/(.+)$ ]]; then
  slug="${BASH_REMATCH[1]}"
fi
slug="${slug%.git}"

if [[ -z "$slug" ]]; then
  echo "error: unable to parse origin url: $remote" >&2
  exit 1
fi

branch=$(git rev-parse --abbrev-ref HEAD)

printf 'https://raw.githubusercontent.com/%s/%s/%s\n' "$slug" "$branch" "$SCRIPT_PATH"
