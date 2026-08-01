//
//  Error.swift
//  Bluetooth
//
//  Swift implementation of `bt_error`, bound to the declaration in the
//  vendored `bluetooth.h`.
//
//  The HCI status codes are written as literals (with their `hci.h`
//  names in comments) because `hci.h` is vendored in BluetoothLinux,
//  not here; the mapping itself is byte-for-byte the reference table.
//

import Bluetooth
import CBluetooth

/// `int bt_error(uint16_t code)`
///
/// Bluetooth HCI error codes to Unix errno mapping.
@c(bt_error)
public func bt_error(_ code: UInt16) -> Int32 {
    switch code {
    case 0:
        return 0
    case 0x01:  // HCI_UNKNOWN_COMMAND
        return EBADRQC
    case 0x02:  // HCI_NO_CONNECTION
        return ENOTCONN
    case 0x03:  // HCI_HARDWARE_FAILURE
        return EIO
    case 0x04:  // HCI_PAGE_TIMEOUT
        return EHOSTDOWN
    case 0x05:  // HCI_AUTHENTICATION_FAILURE
        return EACCES
    case 0x06:  // HCI_PIN_OR_KEY_MISSING
        return EINVAL
    case 0x07:  // HCI_MEMORY_FULL
        return ENOMEM
    case 0x08:  // HCI_CONNECTION_TIMEOUT
        return ETIMEDOUT
    case 0x09, 0x0a:  // HCI_MAX_NUMBER_OF_CONNECTIONS, HCI_MAX_NUMBER_OF_SCO_CONNECTIONS
        return EMLINK
    case 0x0b:  // HCI_ACL_CONNECTION_EXISTS
        return EALREADY
    case 0x0c, 0x2a, 0x32:  // HCI_COMMAND_DISALLOWED, HCI_TRANSACTION_COLLISION, HCI_ROLE_SWITCH_PENDING
        return EBUSY
    case 0x0d, 0x0f, 0x2d:  // HCI_REJECTED_LIMITED_RESOURCES, HCI_REJECTED_PERSONAL, HCI_QOS_REJECTED
        return ECONNREFUSED
    case 0x10:  // HCI_HOST_TIMEOUT
        return ETIMEDOUT
    case 0x11, 0x27, 0x29, 0x2e, 0x20, 0x30, 0x2c:
        // HCI_UNSUPPORTED_FEATURE, HCI_QOS_NOT_SUPPORTED,
        // HCI_PAIRING_NOT_SUPPORTED, HCI_CLASSIFICATION_NOT_SUPPORTED,
        // HCI_UNSUPPORTED_LMP_PARAMETER_VALUE, HCI_PARAMETER_OUT_OF_RANGE,
        // HCI_QOS_UNACCEPTABLE_PARAMETER
        return EOPNOTSUPP
    case 0x12, 0x34:  // HCI_INVALID_PARAMETERS, HCI_SLOT_VIOLATION
        return EINVAL
    case 0x13, 0x14, 0x15:  // HCI_OE_USER_ENDED_CONNECTION, HCI_OE_LOW_RESOURCES, HCI_OE_POWER_OFF
        return ECONNRESET
    case 0x16:  // HCI_CONNECTION_TERMINATED
        return ECONNABORTED
    case 0x17:  // HCI_REPEATED_ATTEMPTS
        return ELOOP
    case 0x0e, 0x18, 0x2f:  // HCI_REJECTED_SECURITY, HCI_PAIRING_NOT_ALLOWED, HCI_INSUFFICIENT_SECURITY
        return EACCES
    case 0x1a:  // HCI_UNSUPPORTED_REMOTE_FEATURE
        return EPROTONOSUPPORT
    case 0x1b:  // HCI_SCO_OFFSET_REJECTED
        return ECONNREFUSED
    case 0x19, 0x1e, 0x23, 0x24, 0x25:
        // HCI_UNKNOWN_LMP_PDU, HCI_INVALID_LMP_PARAMETERS,
        // HCI_LMP_ERROR_TRANSACTION_COLLISION, HCI_LMP_PDU_NOT_ALLOWED,
        // HCI_ENCRYPTION_MODE_NOT_ACCEPTED
        return EPROTO
    default:
        return ENOSYS
    }
}
