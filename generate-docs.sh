#!/bin/bash
set -eu
mkdir -p "./docs"
echo "Build"
swift build

echo "Generate DocC"
swift package --allow-writing-to-directory "./docs" \
    generate-documentation \
    --target Bluetooth --disable-indexing \
    --output-path "./docs"

echo "Generate HTML"
swift package --allow-writing-to-directory "./docs" \
    generate-documentation \
    --target Bluetooth --disable-indexing \
    --output-path "./docs" \
    --transform-for-static-hosting \
    --hosting-base-path ./
