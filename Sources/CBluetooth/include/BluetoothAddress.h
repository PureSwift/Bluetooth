//
//  Bluetooth.h
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 7/8/25.
//

#ifndef BLUETOOTH_ADDRESS_H
#define BLUETOOTH_ADDRESS_H

#include <stdint.h>
#include <stdbool.h>

typedef struct {
    uint8_t bytes[6];
} BTAddress;

/**
 Compare two `BTAddress` instances.
 */
bool BTAddressEqual(const BTAddress* _Nonnull lhs, const BTAddress* _Nonnull rhs);

#endif
