//
//  cbt_internal.h
//  Bluetooth
//
//  Private declarations shared between the C shims and the Swift ABI layer.
//  Unlike the headers under `bluetooth/`, this header is ours (MIT).
//

#ifndef CBT_INTERNAL_H
#define CBT_INTERNAL_H

#include <stdlib.h>
#include <errno.h>
#include <stdint.h>
#include <stddef.h>

#include <bluetooth/bluetooth.h>
#include <bluetooth/uuid.h>
#include <bluetooth/sdp.h>
#include <bluetooth/sdp_lib.h>

#ifdef __cplusplus
extern "C" {
#endif

/// `sscanf` trampoline for `bt_string_to_uuid128`.
///
/// Scans `string` with `"%08x-%04hx-%04hx-%04hx-%08x%04hx"` and writes the
/// 16 big-endian bytes to `out`. Returns 1 on success, 0 on failure.
/// Variadic `sscanf` cannot be called from Swift, and the accepted-input
/// contract is literally C stdlib scanning behavior, so it stays in C.
int cbt_scan_uuid128(const char *string, uint8_t out[16]);

/// `sscanf` trampoline for BlueZ's `is_base_uuid128` check:
/// `"0000%04hx-0000-1000-8000-00805%1[fF]9%1[bB]34%1[fF]%1[bB]"`.
/// Returns 1 if `string` is a Bluetooth base UUID, 0 otherwise.
int cbt_scan_base_uuid128(const char *string);

#ifdef __cplusplus
}
#endif

#endif /* CBT_INTERNAL_H */
