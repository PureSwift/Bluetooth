//
//  ATTAttributePermissions.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 11/6/24.
//

/// ATT attribute permission bitfield values. Permissions are grouped as
/// "Access", "Encryption", "Authentication", and "Authorization". A bitmask of
/// permissions is a byte that encodes a combination of these.
@frozen
public struct ATTAttributePermissions: OptionSet, Equatable, Hashable, Sendable {

    public var rawValue: UInt8

    public init(rawValue: UInt8) {
        self.rawValue = rawValue
    }
}

// MARK: - ExpressibleByIntegerLiteral

extension ATTAttributePermissions: ExpressibleByIntegerLiteral {

    public init(integerLiteral value: UInt8) {
        self.rawValue = value
    }
}

// MARK: - CustomStringConvertible

extension ATTAttributePermissions: CustomStringConvertible, CustomDebugStringConvertible {

    #if hasFeature(Embedded)
    public var description: String {
        "0x" + rawValue.toHexadecimal()
    }
    #else
    @inline(never)
    public var description: String {
        let descriptions: [(ATTAttributePermissions, StaticString)] = [
            (.read, ".read"),
            (.write, ".write"),
            (.readEncrypt, ".readEncrypt"),
            (.writeEncrypt, ".writeEncrypt"),
            (.readAuthentication, ".readAuthentication"),
            (.writeAuthentication, ".writeAuthentication"),
            (.authorized, ".authorized"),
            (.noAuthorization, ".noAuthorization")
        ]
        return buildDescription(descriptions)
    }
    #endif

    /// A textual representation of the file permissions, suitable for debugging.
    public var debugDescription: String { self.description }
}

// MARK: - Options

public extension ATTAttributePermissions {

    // Access
    static var read: ATTAttributePermissions { 0x01 }
    static var write: ATTAttributePermissions { 0x02 }

    // Encryption
    static var encrypt: ATTAttributePermissions { [.readEncrypt, .writeEncrypt] }
    static var readEncrypt: ATTAttributePermissions { 0x04 }
    static var writeEncrypt: ATTAttributePermissions { 0x08 }

    // The following have no effect on Darwin

    // Authentication
    static var authentication: ATTAttributePermissions { [.readAuthentication, .writeAuthentication] }
    static var readAuthentication: ATTAttributePermissions { 0x10 }
    static var writeAuthentication: ATTAttributePermissions { 0x20 }

    // Authorization
    static var authorized: ATTAttributePermissions { 0x40 }
    static var noAuthorization: ATTAttributePermissions { 0x80 }
}
