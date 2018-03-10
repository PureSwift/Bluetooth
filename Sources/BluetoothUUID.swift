//
//  UUID.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 3/4/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

import Foundation

/// Bluetooth UUID
public enum BluetoothUUID {
    
    case bit16(UInt16)
    case bit32(UInt32)
    case bit128(UInt128)
}

public extension BluetoothUUID {
    
    /// Creates a random 128 bit Bluetooth UUID.
    public init() {
        
        self.init(uuid: UUID())
    }
}

// MARK: - Equatable

extension BluetoothUUID: Equatable {
    
    public static func == (lhs: BluetoothUUID, rhs: BluetoothUUID) -> Bool {
        
        switch (lhs, rhs) {
            
        case let (.bit16(lhsValue), .bit16(rhsValue)): return lhsValue == rhsValue
            
        case let (.bit32(lhsValue), .bit32(rhsValue)): return lhsValue == rhsValue
            
        case let (.bit128(lhsValue), .bit128(rhsValue)): return lhsValue == rhsValue
            
        default: return false
        }
    }
}

// MARK: - CustomStringConvertible

extension BluetoothUUID: CustomStringConvertible {
    
    public var description: String {
        
        if let name = self.name {
            
            return "\(rawValue) (\(name))"
            
        } else {
            
            return rawValue
        }
    }
}

// MARK: - Hashable

extension BluetoothUUID: Hashable {
    
    public var hashValue: Int {
        
        return data.hashValue
    }
}

// MARK: - RawRepresentable

extension BluetoothUUID: RawRepresentable {
    
    /// Initialize from a UUID string (in big endian representation).
    ///
    /// - Example: "60F14FE2-F972-11E5-B84F-23E070D5A8C7", "000000A8", "00A8"
    public init?(rawValue: String) {
        
        switch rawValue.utf8.count {
            
        case 4:
            
            guard let value = UInt16(rawValue, radix: 16)
                else { return nil }
            
            self = .bit16(value)
            
        case 8:
            
            guard let value = UInt32(rawValue, radix: 16)
                else { return nil }
            
            self = .bit32(value)
            
        case UUID.stringLength:
            
            // UUID string is always big endian
            guard let uuid = UUID(uuidString: rawValue)
                else { return nil }
            
            self = .bit128(UInt128(uuid: uuid))
            
        default:
            
             return nil
        }
    }
    
    public var rawValue: String {
        
        switch self {
            
        case let .bit16(value):
            
            let bytes = value.bigEndian.bytes
            
            return bytes.0.toHexadecimal() + bytes.1.toHexadecimal()
            
        case let .bit32(value):
            
            let bytes = value.bigEndian.bytes
            
            return bytes.0.toHexadecimal() + bytes.1.toHexadecimal() + bytes.2.toHexadecimal() + bytes.3.toHexadecimal()
            
        case let .bit128(value):
            
            return UUID(value).uuidString
        }
    }
}

// MARK: - DataConvertible

public extension BluetoothUUID {
    
    public init?(data: Data) {
        
        let byteValue = data
        
        switch byteValue.count {
            
        // 16 bit
        case 2:
            
            let value = UInt16(bytes: (byteValue[0], byteValue[1]))
            
            self = .bit16(value)
            
        // 32 bit
        case 4:
            
            let value = UInt32(bytes: (byteValue[0], byteValue[1], byteValue[2], byteValue[3]))
            
            self = .bit32(value)
            
        // 128 bit
        case 16:
            
            let value = UInt128(data: data)!
            
            self = .bit128(value)
            
        default:
            
            return nil
        }
    }
    
    public var data: Data {
        
        switch self {
            
        case let .bit16(value):
            
            let bytes = value.bytes
            
            return Data(bytes: [bytes.0, bytes.1])
            
        case let .bit32(value):
            
            let bytes = value.bytes
            
            return Data(bytes: [bytes.0, bytes.1, bytes.2, bytes.3])
            
        case let .bit128(value):
            
            return value.data
        }
    }
}

// MARK: - Byte Swap

public extension BluetoothUUID {
    
    /// A representation of this Bluetooth UUID with the byte order swapped.
    public var byteSwapped: BluetoothUUID {
        
        switch self {
            
        case let .bit16(value):
            
            return .bit16(value.byteSwapped)
            
        case let .bit32(value):
            
            return .bit32(value.byteSwapped)
            
        case let .bit128(value):
            
            return .bit128(value.byteSwapped)
        }
    }
    
    /// Creates an UUID from its little-endian representation, changing the
    /// byte order if necessary.
    ///
    /// - Parameter value: A value to use as the little-endian representation of
    ///   the new UUID.
    public init(littleEndian value: BluetoothUUID) {
        #if _endian(little)
            self = value
        #else
            self = value.byteSwapped
        #endif
    }
    
    /// Creates an UUID from its big-endian representation, changing the byte
    /// order if necessary.
    ///
    /// - Parameter value: A value to use as the big-endian representation of the
    ///   new UUID.
    public init(bigEndian value: BluetoothUUID) {
        #if _endian(big)
            self = value
        #else
            self = value.byteSwapped
        #endif
    }
    
    /// The little-endian representation of this UUID.
    ///
    /// If necessary, the byte order of this value is reversed from the typical
    /// byte order of this UUID. On a little-endian platform, for any
    /// UUID `x`, `x == x.littleEndian`.
    public var littleEndian: BluetoothUUID {
        #if _endian(little)
            return self
        #else
            return byteSwapped
        #endif
    }
    
    /// The big-endian representation of this UUID.
    ///
    /// If necessary, the byte order of this value is reversed from the typical
    /// byte order of this UUID. On a big-endian platform, for any
    /// UUID `x`, `x == x.bigEndian`.
    public var bigEndian: BluetoothUUID {
        #if _endian(big)
            return self
        #else
            return byteSwapped
        #endif
    }
}

// MARK: - Little Endian

public extension BluetoothUUID {
    
    public init?(littleEndianData data: [UInt8]) {
        
        guard let littleEndian = BluetoothUUID(data: Data(data))
            else { return nil }
        
        self.init(littleEndian: littleEndian)
    }
    
    public var littleEndianData: [UInt8] {
        
        return [UInt8](self.littleEndian.data)
    }
}

// MARK: - NSUUID Conversion

public extension BluetoothUUID {
    
    /// Initialize from a `Foundation.UUID`.
    public init(uuid: UUID) {
        
        self.init(bigEndian: .bit128(UInt128(uuid: uuid)))
    }
    
    /// Bluetooth Base UUID (big endian)
    fileprivate static var baseUUID: UUID { return UUID(uuid: (0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00,
                                                               0x80, 0x00, 0x00, 0x80, 0x5F, 0x9B, 0x34, 0xFB)) }
}

public extension Foundation.UUID {
    
    /// Initialize and convert from a Bluetooth UUID.
    public init(bluetooth uuid: BluetoothUUID) {
        
        switch uuid {
            
        case let .bit16(value):
            
            let bytes = value.bigEndian.bytes
            
            var uuid = BluetoothUUID.baseUUID
            
            uuid.bytes.0 = bytes.0
            uuid.bytes.1 = bytes.1
            
            self = uuid
            
        case let .bit32(value):
            
            let bytes = value.bigEndian.bytes
            
            var uuid = BluetoothUUID.baseUUID
            
            uuid.bytes.0 = bytes.0
            uuid.bytes.1 = bytes.1
            uuid.bytes.2 = bytes.2
            uuid.bytes.3 = bytes.3
            
            self = uuid
            
        case let .bit128(value):
            
            self = UUID(value)
        }
    }
}

// MARK: - CoreBluetooth Support

#if os(macOS) || os(iOS) || os(tvOS) || (os(watchOS) && swift(>=3.2))
    
    import CoreBluetooth
    
    public extension BluetoothUUID {
        
        public init(coreBluetooth: CBUUID) {
                        
            guard let uuid = BluetoothUUID(data: coreBluetooth.data)
                else { fatalError("Could not create Bluetooth UUID from \(coreBluetooth)") }
            
            // CBUUID is always big endian
            self.init(bigEndian: uuid)
            
            assert(self.rawValue == coreBluetooth.uuidString)
        }
        
        public func toCoreBluetooth() -> CBUUID {
            
            let coreBluetooth = CBUUID(data: self.bigEndian.data)
            
            assert(self.rawValue == coreBluetooth.uuidString)
            
            return coreBluetooth
        }
    }
    
#endif
