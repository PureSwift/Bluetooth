#!/usr/bin/env bash
#
# Differential conformance: build each driver twice — once against the
# reference implementation, once against ours — and diff the output.
#
# Two drivers, because the two symbol families have different references:
#
#   conformance_address.c   the `bluetooth.c` symbols, which the system
#                           `libbluetooth.so.3` exports; linked directly
#                           against it.
#   conformance_uuid.c      the `bt_uuid_*` family, which the shared
#                           library does NOT export (upstream keeps them
#                           in `libbluetooth-internal.a` only). The
#                           reference is built from the upstream UUID source,
#                           so this driver is skipped unless BLUEZ_SOURCE
#                           points at an extracted BlueZ source tree.
#
# Both sides of each comparison compile against the *same* (vendored)
# headers, so the only variable is which implementation is linked.
#
# Accepted deltas are recorded in `known-differences.txt` and subtracted
# from the diff before it is judged. Anything else fails.
#
# Usage:
#     SWIFTPM_BLUETOOTH_CABI=1 swift build
#     Conformance/compare.sh [path-to-our-shared-library]
#
# Environment:
#     BT_REFERENCE_LIB   path to the reference libbluetooth.so.3
#     BLUEZ_SOURCE       path to a BlueZ source tree (enables the UUID driver)
#
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
BUILD="${ROOT}/.build/conformance"
TRIPLE="$(swift -print-target-info | sed -n 's/.*"unversionedTriple": "\([^"]*\)".*/\1/p' | head -1)"
OURS="${1:-${ROOT}/.build/${TRIPLE}/debug/libBluetoothABI.so}"

find_reference() {
    local found
    found="$(/sbin/ldconfig -p 2>/dev/null \
        | sed -n 's/.*libbluetooth\.so\.3 (libc6[^)]*) => \(.*\)/\1/p' | head -1)"
    if [[ -n "${found}" ]]; then
        echo "${found}"
        return
    fi
    local dir
    for dir in /usr/lib/"$(uname -m)"-linux-gnu /usr/lib64 /usr/lib /lib; do
        if [[ -f "${dir}/libbluetooth.so.3" ]]; then
            echo "${dir}/libbluetooth.so.3"
            return
        fi
    done
}

REFERENCE="${BT_REFERENCE_LIB:-$(find_reference)}"

if [[ ! -f "${OURS}" ]]; then
    echo "error: ${OURS} not found; run 'SWIFTPM_BLUETOOTH_CABI=1 swift build' first" >&2
    exit 1
fi

if [[ -z "${REFERENCE}" || ! -f "${REFERENCE}" ]]; then
    echo "error: reference libbluetooth.so.3 not found; install libbluetooth3 or set BT_REFERENCE_LIB" >&2
    exit 1
fi

mkdir -p "${BUILD}"

# The drivers include <bluetooth/...>, so stage the vendored headers
# under that prefix and use them for every build.
mkdir -p "${BUILD}/include/bluetooth"
cp "${ROOT}/Sources/CBluetooth/include/bluetooth.h" \
   "${ROOT}/Sources/CBluetooth/include/uuid.h" \
   "${BUILD}/include/bluetooth/"

CFLAGS=(-O0 -g -I "${BUILD}/include")
status=0

# Compares one driver's two outputs. $1 = name, $2 = reference binary,
# $3 = our binary.
compare() {
    local name="$1" reference="$2" ours="$3"

    "${reference}" > "${BUILD}/${name}.reference.txt" 2>&1 || true
    "${ours}" > "${BUILD}/${name}.ours.txt" 2>&1 || true

    if diff -u "${BUILD}/${name}.reference.txt" "${BUILD}/${name}.ours.txt" \
            > "${BUILD}/${name}.diff.txt"; then
        echo "conformance/${name}: identical output ($(wc -l < "${BUILD}/${name}.reference.txt") lines)"
        return 0
    fi

    # Every differing line must be listed in known-differences.txt.
    grep -E '^[+-]' "${BUILD}/${name}.diff.txt" | grep -vE '^(\+\+\+|---)' | sed 's/^[+-]//' \
        | sort -u > "${BUILD}/${name}.changed.txt"

    if [[ -f "${ROOT}/Conformance/known-differences.txt" ]]; then
        grep -vE '^\s*(#|$)' "${ROOT}/Conformance/known-differences.txt" | sort -u \
            > "${BUILD}/known.txt"
    else
        : > "${BUILD}/known.txt"
    fi

    comm -23 "${BUILD}/${name}.changed.txt" "${BUILD}/known.txt" \
        > "${BUILD}/${name}.unexpected.txt"

    if [[ -s "${BUILD}/${name}.unexpected.txt" ]]; then
        echo "conformance/${name}: $(wc -l < "${BUILD}/${name}.unexpected.txt") unexpected differing line(s):" >&2
        head -50 "${BUILD}/${name}.unexpected.txt" >&2
        echo "(full diff: ${BUILD}/${name}.diff.txt)" >&2
        return 1
    fi

    echo "conformance/${name}: all $(wc -l < "${BUILD}/${name}.changed.txt") differing lines are known-accepted"
}

# --- bluetooth.c symbols -----------------------------------------------

cc "${CFLAGS[@]}" -o "${BUILD}/address.reference" \
    "${ROOT}/Conformance/conformance_address.c" "${REFERENCE}"
cc "${CFLAGS[@]}" -o "${BUILD}/address.ours" \
    "${ROOT}/Conformance/conformance_address.c" "${OURS}" \
    -Wl,-rpath,"$(dirname "${OURS}")"

compare address "${BUILD}/address.reference" "${BUILD}/address.ours" || status=1

# --- bt_uuid_* family ---------------------------------------------------

if [[ -n "${BLUEZ_SOURCE:-}" && -f "${BLUEZ_SOURCE}/lib/bluetooth/uuid.c" ]]; then
    # The reference build compiles uuid.c itself; it also needs bt_malloc
    # and friends, which come from the reference shared library.
    cc "${CFLAGS[@]}" -I "${BLUEZ_SOURCE}/lib" -o "${BUILD}/uuid.reference" \
        "${ROOT}/Conformance/conformance_uuid.c" \
        "${BLUEZ_SOURCE}/lib/bluetooth/uuid.c" "${REFERENCE}"
    cc "${CFLAGS[@]}" -o "${BUILD}/uuid.ours" \
        "${ROOT}/Conformance/conformance_uuid.c" "${OURS}" \
        -Wl,-rpath,"$(dirname "${OURS}")"

    compare uuid "${BUILD}/uuid.reference" "${BUILD}/uuid.ours" || status=1
else
    echo "conformance/uuid: skipped (set BLUEZ_SOURCE to a BlueZ source tree to enable)"
fi

exit "${status}"
