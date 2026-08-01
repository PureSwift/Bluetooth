#!/usr/bin/env bash
#
# Assert a library's exported symbols against an expected list.
#
# Both directions fail: a symbol in the list but not in the library
# (something was never implemented, or the version script does not
# match), and a symbol in the library but not in the list (an internal
# detail leaked into the ABI surface).
#
# Usage: Scripts/check-exports.sh <library> [symbols.txt]
#
set -euo pipefail

LIBRARY="${1:?usage: check-exports.sh <library> [symbols.txt]}"
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
EXPECTED_FILE="${2:-${ROOT}/cmake/symbols.txt}"

if [[ ! -f "${LIBRARY}" ]]; then
    echo "error: ${LIBRARY} not found" >&2
    exit 1
fi

if [[ ! -f "${EXPECTED_FILE}" ]]; then
    echo "error: ${EXPECTED_FILE} not found" >&2
    exit 1
fi

work="$(mktemp -d)"
trap 'rm -rf "${work}"' EXIT

# Defined, exported functions and data — not undefined imports.
nm --dynamic --defined-only --format=posix "${LIBRARY}" \
    | awk '$2 ~ /^[TDBRWi]$/ { print $1 }' \
    | sed 's/@.*//' \
    | sort -u > "${work}/actual"

grep -vE '^\s*(#|$)' "${EXPECTED_FILE}" | sort -u > "${work}/expected"

comm -13 "${work}/actual" "${work}/expected" > "${work}/missing"
comm -23 "${work}/actual" "${work}/expected" > "${work}/extra"

status=0

if [[ -s "${work}/missing" ]]; then
    echo "error: $(wc -l < "${work}/missing") expected symbol(s) not exported by ${LIBRARY}:" >&2
    sed 's/^/  - /' "${work}/missing" >&2
    status=1
fi

if [[ -s "${work}/extra" ]]; then
    echo "error: $(wc -l < "${work}/extra") unexpected symbol(s) exported by ${LIBRARY}:" >&2
    sed 's/^/  + /' "${work}/extra" >&2
    status=1
fi

if [[ "${status}" -eq 0 ]]; then
    echo "exports: $(wc -l < "${work}/expected") symbols match $(basename "${EXPECTED_FILE}")"
fi

exit "${status}"
