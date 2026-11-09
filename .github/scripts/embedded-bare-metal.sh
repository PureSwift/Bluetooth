#!/bin/sh
# Compiles the library targets for a bare-metal Embedded Swift triple.
#
# SwiftPM can't target these triples without a Swift SDK, so this runs swiftc
# directly, using the sources the package's build-tool plugin generates.
#
# The Linux toolchain ships Embedded _Concurrency only for the host triple, so
# these builds prove the package compiles without the module.
# `canImport(_Concurrency)` can't detect that, because the module exists for
# other triples, so the code checks EMBEDDED_NO_CONCURRENCY instead.
#
# Usage: .github/scripts/embedded-bare-metal.sh <triple> <target>...
set -eu

TRIPLE="$1"
shift
OUT=".build/bare-metal/$TRIPLE"
mkdir -p "$OUT"

# Run the build-tool plugin.
SWIFTPM_ENABLE_MACROS=0 swift build --target Bluetooth

for TARGET in "$@"; do
    echo "Compiling $TARGET for $TRIPLE"
    GENERATED=".build/plugins/outputs/bluetooth/$TARGET/destination"
    SOURCES="Sources/$TARGET"
    [ -d "$GENERATED" ] && SOURCES="$SOURCES $GENERATED"
    # shellcheck disable=SC2086
    find $SOURCES -name '*.swift' | sort | xargs swiftc \
        -target "$TRIPLE" \
        -enable-experimental-feature Embedded \
        -wmo -parse-as-library -Osize -swift-version 6 \
        -package-name bluetooth \
        -D EMBEDDED_NO_CONCURRENCY \
        -I "$OUT" \
        -module-name "$TARGET" \
        -emit-module -emit-module-path "$OUT/$TARGET.swiftmodule" \
        -c -o "$OUT/$TARGET.o"
done
