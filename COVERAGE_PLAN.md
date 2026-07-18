# Code Coverage Plan: 70.68% → 95%

Baseline (2026-07-17): **70.68%** line coverage (14,937 / 21,134 lines), measured by
`Scripts/coverage.sh` across all targets under `Sources/`.

Reaching 95% means covering **5,141** of the 6,197 currently-uncovered lines, leaving
a budget of ~1,056 lines for genuinely unreachable code (defensive `fatalError`/
`assertionFailure` branches, impossible-state guards).

## Where the gap is

| Target            | Coverage | Uncovered lines |
|-------------------|---------:|----------------:|
| BluetoothHCI      |   54.73% |           3,201 |
| BluetoothGATT     |   82.44% |           1,538 |
| BluetoothGAP      |   71.88% |             707 |
| Bluetooth (core)  |   78.66% |             529 |
| BluetoothMacros   |    0.00% |             218 |
| BluetoothMetadata |   95.70% |               4 |

116 files are at **0%** coverage, totaling 3,305 lines — more than half the gap.
Almost all are HCI command/event definitions with `Data` init/serialization that
round-trip tests cover cheaply.

## Phase 1 — Zero-coverage HCI commands and events (~3,000 lines, → ~85%)

The bulk of the 116 untested files are `HCILE*`/`HCI*` command parameter and event
structs in `Sources/BluetoothHCI/`. Each follows the same pattern already tested
elsewhere (e.g. `HCIReadRSSI`): `init?(data:)`, `var data: Data`, and option-set /
enum raw values.

For each file, add round-trip tests to `Tests/BluetoothTests/HCITests.swift` (or a
new `HCICommandTests.swift` split by command group) using real packet bytes from the
Bluetooth Core Specification examples where available:

- Decode: `init?(data:)` with valid bytes → field assertions.
- Encode: `.data` equals the source bytes (round-trip).
- Reject: truncated/oversized data returns `nil`.

Largest zero-coverage files to start with (uncovered lines in parentheses):
`HCILEGenerateDHKey` (82), `HCILEDirectedAdvertisingReport` (79),
`HCILESetExtendedScanParameters` (74), `HCILEExtendedCreateConnection` (71),
`HCILESetExtendedScanEnable` (69), `HCILEReadMaximumDataLength` (66),
`HCILEEnhancedConnectionComplete` (65), `HCIHoldMode` (63),
`HCILEAddDeviceToResolvingList` (63), `LMPFeature` (59),
`HCILERemoteConnectionParameterRequestReply` (55).

Also in this phase, the zero-coverage GAP/GATT type files:
`GAPListOf{16,32,128}BitServiceSolicitationUUIDs`, `GAPSecurityManagerOOBFlags`,
`GAPSecurityManagerTKValue`, `GAPSimplePairingHashC`, `GAPSimplePairingRandomizerR`,
`ATTExecuteWriteResponse`, `ATTPrepareWriteResponse`, `ATTReadBlobResponse`,
`ATTSignedWriteCommand`, `GATTAlertNotificationService`, `GATTBatteryService`,
`GATTBloodPressure{Feature,Service}`, `GATTCharacteristicFormatType`.

## Phase 2 — Duplicated internal extensions (~600 lines, → ~88%)

`Extensions/Hexadecimal.swift` and `Extensions/Integer.swift` are copied into
several targets and counted per copy:

- `BluetoothGAP/Extensions/Hexadecimal.swift` (124, 0%)
- `BluetoothHCI/Extensions/Hexadecimal.swift` (124, 0%)
- `BluetoothMacros/Extensions/Hexadecimal.swift` (122, 0%)
- `BluetoothGATT/Extensions/Hexadecimal.swift` (89 uncovered)
- `BluetoothGAP`/`BluetoothHCI` `Extensions/Integer.swift` (55 each, ~25%)
- `Extensions/System.swift` in GAP/GATT/HCI (small, 0%)

Two options, in order of preference:

1. **Deduplicate**: move the shared utilities into the `Bluetooth` core target (or
   an internal utility target) so one copy exists and one set of tests covers it.
   Also shrinks the codebase.
2. If duplication is intentional (Embedded Swift / dependency isolation), cover each
   copy via `@testable import` tests, or indirectly through Phase 1 tests that
   exercise each target's `description`/hex paths.

## Phase 3 — GATT stack logic (~800 lines, → ~92%)

The four big partially-covered files need behavioral tests, not round-trips:

- `GATTClient.swift` (323 uncovered, 64.66%) and `GATTServer.swift` (261, 69.00%):
  extend the existing client/server tests over the in-memory test transport to hit
  untested procedures — long writes, prepare/execute write, signed writes, read
  blob, notifications/indications, MTU edge cases, and **error responses** (the
  uncovered lines are mostly error/edge paths).
- `GATTDatabase.swift` (100, 79.42%): attribute permission checks, handle-range
  queries, removal/modification paths.
- `ATTConnection.swift` (98, 79.28%): error handling, pending-request bookkeeping,
  malformed PDU paths.

Use the llvm-cov JSON (`swift test --enable-code-coverage --show-codecov-path`) to
target the exact uncovered regions rather than guessing.

## Phase 4 — Core types and remaining gaps (~500 lines, → ~94%)

- `UInt128.swift` (117 uncovered, 57.45%): arithmetic/bitwise operators, comparison,
  overflow paths, `StaticBigInt` literal init, hex description.
- `Extensions/UUID.swift` (62), `ClassOfDevice.swift` (54),
  `Bluetooth/Extensions/Hexadecimal.swift` (52), `AsyncIndefiniteStream.swift` (58):
  cancellation and back-pressure paths need async tests.
- `BluetoothGAP/Decoder.swift` (77, 68.44%): malformed AD-structure inputs, length
  mismatches, unknown types.
- Sweep the remaining sub-90% files with the per-file breakdown.

## Phase 5 — BluetoothMacros (218 lines, → ~95%)

The macro target has zero coverage. Add a `BluetoothMacrosTests` target using
`SwiftSyntaxMacrosTestSupport`'s `assertMacroExpansion` to test
`BluetoothAddress` (58 lines) and companions, including invalid-literal diagnostics.
Macro tests run the macro implementation in-process, so coverage attributes
normally. (If wiring swift-syntax test support proves disproportionate, exclude
`Sources/BluetoothMacros` via `COVERAGE_SOURCE_PREFIX` scoping instead and note it
in the workflow — but prefer testing.)

## Ratcheting the CI gate

Raise the threshold in `.github/workflows/coverage.yml` as each phase lands so
progress can't regress:

| After   | Threshold |
|---------|----------:|
| Baseline (now) | 70 |
| Phase 1 | 84 |
| Phase 2 | 87 |
| Phase 3 | 91 |
| Phase 4 | 93 |
| Phase 5 | 95 |

## Workflow tips

- Run the suite once, then iterate with `SKIP_TEST=1 Scripts/coverage.sh` for an
  instant re-report.
- Exact uncovered lines per file: in the llvm-cov JSON, a segment
  `[line, col, count, hasCount, ...]` with `hasCount == true && count == 0` marks
  an uncovered line.
- Prefer testing through public API (spec-derived packet bytes) — those tests double
  as regression tests against the Core Specification.
- Genuinely unreachable defensive branches are acceptable gaps; document them with
  `assertionFailure` rather than contorting tests to reach them.
