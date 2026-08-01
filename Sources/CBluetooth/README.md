# CBluetooth

The C surface of the `libbluetooth` ABI replacement.

## Licensing

This directory is licensed differently from the rest of this repository.

- `include/bluetooth/*.h` are **vendored verbatim from
  [BlueZ](https://github.com/bluez/bluez) 5.85** (`bluetooth.h`, `uuid.h`,
  `sdp.h`, `sdp_lib.h`, and `hci.h` — the last only because `sdp_lib.h`
  includes it) and are licensed **GPL-2.0-or-later** — see
  `include/bluetooth/LICENSE`. They are kept byte-identical so that the
  Swift implementations in `BluetoothABI` are compiled against the exact
  declarations the reference library exports. Do not edit them; to update,
  re-vendor from a newer BlueZ tag and record the tag here.
- Everything else in this directory (`cbt_internal.h`, `cbt_printf.c`,
  `cbt_alloc.c`, `cbt_scan.c`, `module.modulemap`) is original work under
  this repository's MIT license.

The Swift engine (`Sources/Bluetooth` and the rest of this package) has no
knowledge of, and no dependency on, these headers. Only the opt-in
`BluetoothABI` target (disabled by default, see `Package.swift`) links this
module. Binaries produced from the combination of this directory and the
Swift targets are subject to the GPL-2.0-or-later terms of the vendored
headers; resolving the exact licensing of the final `libbluetooth.so.3`
artifact is tracked as an open question in the port plan.

## Contents

| File | Purpose |
|---|---|
| `include/bluetooth/bluetooth.h` | Vendored BlueZ public header (`bdaddr_t`, `ba*`/`bt_*` declarations) |
| `include/bluetooth/uuid.h` | Vendored BlueZ public header (`bt_uuid_t`, `bt_uuid_*` declarations) |
| `include/bluetooth/sdp.h` | Vendored BlueZ public header (`sdp_data_t`, `sdp_list_t`, `sdp_record_t`, `uuid_t`, DTD/PDU constants) |
| `include/bluetooth/sdp_lib.h` | Vendored BlueZ public header (all `sdp_*` function declarations, including the socket-dependent ones this repository does not implement) |
| `include/bluetooth/hci.h` | Vendored only because `sdp_lib.h` includes it (for `inquiry_info`); no declaration from it is used here |
| `include/cbt_internal.h` | Our private declarations shared with Swift |
| `cbt_printf.c` | `baprintf`, `bafprintf`, `basprintf`, `basnprintf` — C variadics that cannot be written in Swift |
| `cbt_alloc.c` | `bt_malloc`, `bt_malloc0`, `bt_free` — keeps the ownership contract on the system allocator |
| `cbt_scan.c` | `sscanf` trampolines for the UUID string parser |

All other exported symbols are implemented in Swift in
`Sources/BluetoothABI`, bound to these declarations via `@c`.

`sdp_data_t`, `sdp_list_t` and `sdp_record_t` are transparent structs —
every consumer reads and walks their fields directly, unlike the socket
handles elsewhere in `libbluetooth` — so their layout, not an opaque
pointer, is the ABI contract. The `@c` functions in `BluetoothABI` operate
on these imported C types directly (the same pattern already used for
`bdaddr_t` and `bt_uuid_t`), converting to and from the idiomatic types in
`BluetoothSDP` where a conversion is meaningful.
