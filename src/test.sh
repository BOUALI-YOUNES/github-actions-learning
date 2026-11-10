#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

fail() { echo "FAIL: $1"; exit 1; }

# Test 1: greets by name
out=$(node greet.js Younes)
[ "$out" = "Hello, Younes!" ] || fail "expected 'Hello, Younes!', got '$out'"

# Test 2: default when no argument
out=$(node greet.js)
[ "$out" = "Hello, World!" ] || fail "expected 'Hello, World!', got '$out'"

# Test 3: function rejects an invalid name
node -e "
const { greet } = require('./greet');
try { greet(''); process.exit(1); } catch (e) { if (!(e instanceof TypeError)) process.exit(1); }
" || fail "greet('') should throw a TypeError"

echo "All tests passed"