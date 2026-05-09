//
//  ATTError.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 4/12/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

#if canImport(Foundation)
import Foundation
#endif

/// The possible errors returned by a GATT server (a remote peripheral) during Bluetooth low energy ATT transactions.
///
/// These error constants are based on the Bluetooth ATT error codes, defined in the Bluetooth 4.0 specification.
/// For more information about these errors, see the Bluetooth 4.0 specification, Volume 3, Part F, Section 3.4.1.1.

public struct ATTError: RawRepresentable, Equatable, Hashable, Error {
    public typealias RawValue = UInt8

    public var rawValue: UInt8

    public init(rawValue: UInt8) {
        self.rawValue = rawValue
    }


    /// Invalid Handle
    ///
    /// The attribute handle given was not valid on this server.
    public static var invalidHandle: ATTError { ATTError(rawValue: 0x01) }

    /// Read Not Permitted
    ///
    /// The attribute cannot be read.
    public static var readNotPermitted: ATTError { ATTError(rawValue: 0x02) }

    /// Write Not Permitted
    ///
    /// The attribute cannot be written.
    public static var writeNotPermitted: ATTError { ATTError(rawValue: 0x03) }

    /// Invalid PDU
    ///
    /// The attribute PDU was invalid.
    public static var invalidPDU: ATTError { ATTError(rawValue: 0x04) }

    /// Insufficient Authentication
    ///
    /// The attribute requires authentication before it can be read or written.
    public static var insufficientAuthentication: ATTError { ATTError(rawValue: 0x05) }

    /// Request Not Supported
    ///
    /// Attribute server does not support the request received from the client.
    public static var requestNotSupported: ATTError { ATTError(rawValue: 0x06) }

    /// Invalid Offset
    ///
    /// Offset specified was past the end of the attribute.
    public static var invalidOffset: ATTError { ATTError(rawValue: 0x07) }

    /// Insufficient Authorization
    ///
    /// The attribute requires authorization before it can be read or written.
    public static var insufficientAuthorization: ATTError { ATTError(rawValue: 0x08) }

    /// Prepare Queue Full
    ///
    /// Too many prepare writes have been queued.
    public static var prepareQueueFull: ATTError { ATTError(rawValue: 0x09) }

    /// Attribute Not Found
    ///
    /// No attribute found within the given attribute handle range.
    public static var attributeNotFound: ATTError { ATTError(rawValue: 0x0A) }

    /// Attribute Not Long
    ///
    /// The attribute cannot be read or written using the *Read Blob Request*.
    public static var attributeNotLong: ATTError { ATTError(rawValue: 0x0B) }

    /// Insufficient Encryption Key Size
    ///
    /// The *Encryption Key Size* used for encrypting this link is insufficient.
    public static var insufficientEncryptionKeySize: ATTError { ATTError(rawValue: 0x0C) }

    /// Invalid Attribute Value Length
    ///
    /// The attribute value length is invalid for the operation.
    public static var invalidAttributeValueLength: ATTError { ATTError(rawValue: 0x0D) }

    /// Unlikely Error
    ///
    /// The attribute request that was requested has encountered an error that was unlikely,
    /// and therefore could not be completed as requested.
    public static var unlikelyError: ATTError { ATTError(rawValue: 0x0E) }

    /// Insufficient Encryption
    ///
    /// The attribute requires encryption before it can be read or written.
    public static var insufficientEncryption: ATTError { ATTError(rawValue: 0x0F) }

    /// Unsupported Group Type
    ///
    /// The attribute type is not a supported grouping attribute as defined by a higher layer specification.
    public static var unsupportedGroupType: ATTError { ATTError(rawValue: 0x10) }

    /// Insufficient Resources
    ///
    /// Insufficient Resources to complete the request.
    public static var insufficientResources: ATTError { ATTError(rawValue: 0x11) }


    // Common Profile and Service Error Code Descriptions

    /// Write Request Rejected
    ///
    /// The requested write operation cannot be fulfilled for reasons other than permissions.
    public static var writeRequestRejected: ATTError { ATTError(rawValue: 0xFC) }

    /// Client Characteristic Configuration Descriptor Improperly Configured
    ///
    /// Client Characteristic Configuration descriptor is not configured according to the requirements of the profile or service.
    public static var cccdImproperlyConfigured: ATTError { ATTError(rawValue: 0xFD) }

    /// Procedure Already in Progress
    ///
    /// The profile or service request cannot be serviced because an operation that has been previously triggered is still in progress.
    public static var procedureAlreadyInProgress: ATTError { ATTError(rawValue: 0xFE) }

    /// Out of Range
    ///
    /// The attribute value is out of range as defined by a profile or service specification.
    public static var outOfRange: ATTError { ATTError(rawValue: 0xFF) }
}

// MARK: - CustomStringConvertible

extension ATTError: CustomStringConvertible {

    public var description: String {
        return name
    }
}

// MARK: - Description Values

public extension ATTError {

    var name: String {

        switch self {
        case .invalidHandle:
            return "Invalid Handle"
        case .readNotPermitted:
            return "Read Not Permitted"
        case .writeNotPermitted:
            return "Write Not Permitted"
        case .invalidPDU:
            return "Invalid PDU"
        case .insufficientAuthentication:
            return "Insufficient Authentication"
        case .requestNotSupported:
            return "Request Not Supported"
        case .invalidOffset:
            return "Invalid Offset"
        case .insufficientAuthorization:
            return "Insufficient Authorization"
        case .prepareQueueFull:
            return "Prepare Queue Full"
        case .attributeNotFound:
            return "Attribute Not Found"
        case .attributeNotLong:
            return "Attribute Not Long"
        case .insufficientEncryptionKeySize:
            return "Insufficient Encryption Key Size"
        case .invalidAttributeValueLength:
            return "Invalid Attribute Value Length"
        case .unlikelyError:
            return "Unlikely Error"
        case .insufficientEncryption:
            return "Insufficient Encryption"
        case .unsupportedGroupType:
            return "Unsupported Group Type"
        case .insufficientResources:
            return "Insufficient Resources"
        case .writeRequestRejected:
            return "Write Request Rejected"
        case .cccdImproperlyConfigured:
            return "Client Characteristic Configuration Descriptor Improperly Configured"
        case .procedureAlreadyInProgress:
            return "Procedure Already in Progress"
        case .outOfRange:
            return "Out of Range"
        default:
            return "ATTError 0x\(String(self.rawValue, radix: 16))"
        }
    }

    #if !hasFeature(Embedded)
    var errorDescription: String {

        switch self {
        case .invalidHandle:
            return "The attribute handle given was not valid on this server."
        case .readNotPermitted:
            return "The attribute cannot be read."
        case .writeNotPermitted:
            return "The attribute cannot be written."
        case .invalidPDU:
            return "The attribute PDU was invalid."
        case .insufficientAuthentication:
            return "The attribute requires authentication before it can be read or written."
        case .requestNotSupported:
            return "Attribute server does not support the request received from the client."
        case .invalidOffset:
            return "Offset specified was past the end of the attribute."
        case .insufficientAuthorization:
            return "The attribute requires authorization before it can be read or written."
        case .prepareQueueFull:
            return "Too many prepare writes have been queued."
        case .attributeNotFound:
            return "No attribute found within the given attri- bute handle range."
        case .attributeNotLong:
            return "The attribute cannot be read using the Read Blob Request."
        case .insufficientEncryptionKeySize:
            return "The Encryption Key Size used for encrypting this link is insufficient."
        case .invalidAttributeValueLength:
            return "The attribute value length is invalid for the operation."
        case .unlikelyError:
            return "The attribute request that was requested has encountered an error that was unlikely, and therefore could not be completed as requested."
        case .insufficientEncryption:
            return "The attribute requires encryption before it can be read or written."
        case .unsupportedGroupType:
            return "The attribute type is not a supported grouping attribute as defined by a higher layer specification."
        case .insufficientResources:
            return "Insufficient Resources to complete the request."
        case .writeRequestRejected:
            return "The requested write operation could not be completed."
        case .cccdImproperlyConfigured:
            return "The Client Characteristic Configuration Descriptor is not configured correctly."
        case .procedureAlreadyInProgress:
            return "An operation is already in progress."
        case .outOfRange:
            return "The attribute value is out of range."
        default:
            return "ATTError error code \(String(self.rawValue, radix: 16))"
        }
    }
    #endif
}

// MARK: - CustomNSError

#if canImport(Foundation)
extension ATTError: CustomNSError {

    public static var errorDomain: String {
        return "org.pureswift.Bluetooth.ATTError"
    }

    public var errorCode: Int {
        return Int(rawValue)
    }

    public var errorUserInfo: [String: Any] {

        return [
            NSLocalizedDescriptionKey: name,
            NSLocalizedFailureReasonErrorKey: errorDescription
        ]
    }
}
#endif
