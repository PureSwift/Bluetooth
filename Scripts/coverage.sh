#!/usr/bin/env bash
#
# coverage.sh — run a SwiftPM test suite with code coverage, export LCOV and
# Cobertura reports, and enforce a minimum line-coverage threshold.
#
# Coverage is measured against the package's OWN sources only (everything under
# the repo's `Sources/` directory). Dependencies (checked out under `.build`),
# generated sources, and the test target are excluded, so the number reflects
# the coverage of this package's code rather than being diluted by third-party
# code that the tests happen to exercise.
#
# The Cobertura XML (coverage.xml) is the format GitHub Code Quality consumes via
# `actions/upload-code-coverage`; the LCOV report (coverage.lcov) is kept for
# other tools (Codecov, Coveralls, editors) that prefer it.
#
# Usage:
#   Scripts/coverage.sh [threshold]
#
# Environment variables:
#   COVERAGE_THRESHOLD       Minimum line coverage percentage (default: 80).
#                            Overridden by the optional [threshold] argument.
#   COVERAGE_SOURCE_PREFIX   Absolute path prefix selecting the sources that count
#                            toward coverage (default: "$PWD/Sources/"). Narrow it
#                            to a single target, e.g. "$PWD/Sources/MyLibrary/", to
#                            gate on one target instead of every source file.
#   COVERAGE_OUTPUT          LCOV output file (default: .build/coverage/coverage.lcov).
#   COBERTURA_OUTPUT         Cobertura XML output file (default: .build/coverage/coverage.xml).
#   SKIP_TEST                If set to 1, reuse existing coverage data instead of
#                            re-running `swift test` (useful while iterating).

set -euo pipefail

THRESHOLD="${1:-${COVERAGE_THRESHOLD:-80}}"
SOURCE_PREFIX="${COVERAGE_SOURCE_PREFIX:-$PWD/Sources/}"
OUTPUT="${COVERAGE_OUTPUT:-.build/coverage/coverage.lcov}"
COBERTURA_OUTPUT="${COBERTURA_OUTPUT:-.build/coverage/coverage.xml}"

# Resolve the correct llvm-cov (xcrun on Apple platforms, plain llvm-cov elsewhere).
if command -v xcrun >/dev/null 2>&1; then
    LLVM_COV="xcrun llvm-cov"
else
    LLVM_COV="llvm-cov"
fi

# 1. Run the tests with coverage instrumentation.
if [ "${SKIP_TEST:-0}" != "1" ]; then
    echo "==> Running tests with code coverage"
    swift test --enable-code-coverage --no-parallel
fi

# 2. Locate the coverage artifacts SwiftPM produced.
CODECOV_JSON="$(swift test --enable-code-coverage --show-codecov-path)"
COV_DIR="$(dirname "$CODECOV_JSON")"
PROFDATA="$COV_DIR/default.profdata"

if [ ! -f "$CODECOV_JSON" ]; then
    echo "error: coverage report not found at $CODECOV_JSON" >&2
    exit 1
fi

# 3. Locate the instrumented test binary (differs by platform: on macOS it lives
#    inside the .xctest bundle, on Linux the .xctest file is the binary itself).
BIN_PATH="$(swift build --show-bin-path)"
TEST_BINARY=""
for candidate in \
    "$BIN_PATH"/*PackageTests.xctest/Contents/MacOS/*PackageTests \
    "$BIN_PATH"/*PackageTests.xctest \
    "$BIN_PATH"/*Tests.xctest/Contents/MacOS/*Tests \
    "$BIN_PATH"/*Tests.xctest; do
    if [ -f "$candidate" ]; then
        TEST_BINARY="$candidate"
        break
    fi
done

# 4. Export an LCOV report (for Codecov / Coveralls / editors).
mkdir -p "$(dirname "$OUTPUT")"
if [ -n "$TEST_BINARY" ] && [ -f "$PROFDATA" ]; then
    echo "==> Exporting LCOV report to $OUTPUT"
    $LLVM_COV export \
        -format=lcov \
        -instr-profile "$PROFDATA" \
        "$TEST_BINARY" \
        -ignore-filename-regex='.build/(checkouts|.*\.build)/|Tests/|\.derived/|DerivedSources/' \
        > "$OUTPUT"
else
    echo "warning: could not locate test binary or profdata; skipping LCOV export" >&2
fi

# 5. Generate a Cobertura XML report (for GitHub Code Quality / upload-code-coverage).
echo "==> Writing Cobertura report to $COBERTURA_OUTPUT"
mkdir -p "$(dirname "$COBERTURA_OUTPUT")"
python3 - "$CODECOV_JSON" "$SOURCE_PREFIX" "$PWD" "$COBERTURA_OUTPUT" <<'PY'
import json, os, sys, time
from xml.sax.saxutils import escape, quoteattr

report_path, source_prefix, repo_root, output = sys.argv[1:5]

with open(report_path) as f:
    report = json.load(f)

files = []
total_covered = total_lines = 0
for file in report["data"][0]["files"]:
    name = file["filename"]
    if not name.startswith(source_prefix):
        continue
    # Per-line hit count: the greatest region count starting on each line (a line
    # is covered if any region on it executed, so branch sub-regions don't hide it).
    line_hits = {}
    for seg in file["segments"]:
        line, count, has_count = seg[0], seg[2], seg[3]
        if has_count:
            line_hits[line] = max(line_hits.get(line, 0), count)
    covered = sum(1 for h in line_hits.values() if h > 0)
    total_covered += covered
    total_lines += len(line_hits)
    files.append((os.path.relpath(name, repo_root), line_hits, covered, len(line_hits)))

def rate(c, t):
    return c / t if t else 0.0

overall = rate(total_covered, total_lines)
timestamp = int(time.time())

out = [
    '<?xml version="1.0" ?>',
    '<!DOCTYPE coverage SYSTEM "http://cobertura.sourceforge.net/xml/coverage-04.dtd">',
    '<coverage line-rate="%.4f" branch-rate="0" lines-covered="%d" lines-valid="%d" '
    'branches-covered="0" branches-valid="0" complexity="0" version="llvm-cov" timestamp="%d">'
    % (overall, total_covered, total_lines, timestamp),
    "  <sources>",
    "    <source>%s</source>" % escape(repo_root),
    "  </sources>",
    "  <packages>",
    '    <package name="%s" line-rate="%.4f" branch-rate="0" complexity="0">'
    % (escape(os.path.basename(repo_root)), overall),
    "      <classes>",
]
for rel, line_hits, covered, total in sorted(files):
    out.append(
        '        <class name=%s filename=%s line-rate="%.4f" branch-rate="0" complexity="0">'
        % (quoteattr(os.path.basename(rel)), quoteattr(rel), rate(covered, total))
    )
    out.append("          <methods/>")
    out.append("          <lines>")
    for line in sorted(line_hits):
        out.append('            <line number="%d" hits="%d"/>' % (line, line_hits[line]))
    out.append("          </lines>")
    out.append("        </class>")
out += ["      </classes>", "    </package>", "  </packages>", "</coverage>"]

with open(output, "w") as f:
    f.write("\n".join(out) + "\n")

print("    %d/%d lines (%.2f%%)" % (total_covered, total_lines, 100 * overall))
PY

# 6. Compute line coverage for the package sources and enforce the threshold.
echo "==> Computing coverage for ${SOURCE_PREFIX}"
python3 - "$CODECOV_JSON" "$SOURCE_PREFIX" "$THRESHOLD" "$PWD" <<'PY'
import json, os, sys

report_path, source_prefix, threshold, repo_root = sys.argv[1], sys.argv[2], float(sys.argv[3]), sys.argv[4]

with open(report_path) as f:
    report = json.load(f)

covered = total = 0
rows = []
for file in report["data"][0]["files"]:
    name = file["filename"]
    if not name.startswith(source_prefix):
        continue
    lines = file["summary"]["lines"]
    covered += lines["covered"]
    total += lines["count"]
    rows.append((lines["percent"], os.path.relpath(name, repo_root)))

if total == 0:
    print("error: no source files matched prefix %r" % source_prefix, file=sys.stderr)
    print("       (set COVERAGE_SOURCE_PREFIX to your package's Sources path)", file=sys.stderr)
    sys.exit(1)

percent = 100.0 * covered / total

for pct, name in sorted(rows):
    print("  %6.2f%%  %s" % (pct, name))

print("-" * 48)
print("Total line coverage: %.2f%% (%d/%d lines)" % (percent, covered, total))
print("Required threshold:  %.2f%%" % threshold)

if percent < threshold:
    print("FAILED: coverage %.2f%% is below the %.2f%% threshold" % (percent, threshold), file=sys.stderr)
    sys.exit(1)

print("PASSED: coverage meets the threshold")
PY
