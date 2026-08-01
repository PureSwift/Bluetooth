//
//  CBluetooth.h
//  Bluetooth
//
//  Umbrella header for the CBluetooth module.
//
//  Everything under `bluetooth/` is vendored verbatim from BlueZ 5.85
//  (GPL-2.0-or-later, see bluetooth/LICENSE). `hci.h` is vendored
//  alongside `sdp_lib.h` only because the latter includes it (for
//  `inquiry_info`, used by the socket-dependent `sdp_general_inquiry`,
//  which this repository does not implement); none of its declarations
//  are otherwise used here. The Swift ABI implementations in
//  `BluetoothABI` are type-checked against these declarations.
//

#ifndef CBLUETOOTH_H
#define CBLUETOOTH_H

#include <bluetooth/bluetooth.h>
#include <bluetooth/uuid.h>
#include <bluetooth/sdp.h>
#include <bluetooth/sdp_lib.h>
#include "cbt_internal.h"

#endif /* CBLUETOOTH_H */
