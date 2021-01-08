//
//  ATTFindInformationResponse.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/13/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// Find Information Response
///
/// The *Find Information Response* is sent in reply to a received *Find Information Request*
/// and contains information about this server.
@frozen
public struct ATTFindInformationResponse: ATTProtocolDataUnit, Equatable {
    
    public static var attributeOpcode: ATTOpcode { return .findInformationResponse }
    
    /// The information data whose format is determined by the Format field.
    public var attributeData: AttributeData
    
    public init(attributeData: AttributeData) {
        
        self.attributeData = attributeData
    }
}

public extension ATTFindInformationResponse {
    
    /// Length ranges from 6, to the maximum MTU size.
    private static var minimumLength: Int { return 6 }
    
    init?(data: Data) {
        
        guard data.count >= type(of: self).minimumLength,
            type(of: self).validateOpcode(data)
            else { return nil }
        
        let formatByte = data[1]
        let remainderData = data.subdataNoCopy(in: 2 ..< data.count)
        
        guard let format = Format(rawValue: formatByte),
            let attributeData = AttributeData(data: remainderData, format: format)
            else { return nil }
        
        self.attributeData = attributeData
    }
    
    var data: Data {
        
        return Data(self)
    }
}

// MARK: - DataConvertible

extension ATTFindInformationResponse: DataConvertible {
    
    var dataLength: Int {
        
        return 1 + 1 + attributeData.dataLength
    }
    
    static func += <T: DataContainer> (data: inout T, value: ATTFindInformationResponse) {
        
        data += attributeOpcode.rawValue
        data += value.attributeData.format.rawValue
        data += value.attributeData
    }
}

// MARK: - Supporting Types

public extension ATTFindInformationResponse {

    enum Format: UInt8 {
        
        /// A list of 1 or more handles with their 16-bit Bluetooth UUIDs.
        case bit16      = 0x01
        
        /// A list of 1 or more handles with their 128-bit UUIDs.
        case bit128     = 0x02
        
        public init?(uuid: BluetoothUUID) {
            
            switch uuid {
            case .bit16: self = .bit16
            case .bit32: return nil
            case .bit128: self = .bit128
            }
        }
        
        internal var length: Int {
            
            switch self {
            case .bit16: return 2 + 2
            case .bit128: return 2 + 16
            }
        }
    }
}

internal protocol FindInformationResponseAttribute {
    
    associatedtype UUID
    
    /// Attribute Format
    static var format: ATTFindInformationResponse.Format { get }
    
    /// Attribute Handle
    var handle: UInt16 { get }
    
    /// Attribute UUID
    var uuid: UUID { get }
}

extension FindInformationResponseAttribute where UUID: UnsafeDataConvertible {
    
    var dataLength: Int {
        return Self.format.length
    }
}

public extension ATTFindInformationResponse {
    
    /// 16 Bit Attribute
    struct Attribute16Bit: Equatable, Hashable, FindInformationResponseAttribute {
        
        internal static var format: Format { return .bit16 }
        
        /// Attribute Handle
        public let handle: UInt16
        
        /// Attribute UUID
        public let uuid: UInt16
    }
}

extension ATTFindInformationResponse.Attribute16Bit: DataConvertible {
    
    static func += <T: DataContainer> (data: inout T, value: ATTFindInformationResponse.Attribute16Bit) {
        
        data += value.handle.littleEndian
        data += value.uuid.littleEndian
    }
}

public extension ATTFindInformationResponse {
    
    /// 128 Bit Attribute
    struct Attribute128Bit: Equatable, Hashable, FindInformationResponseAttribute {
        
        internal static var format: Format { return .bit128 }
        
        /// Attribute Handle
        public let handle: UInt16
        
        /// Attribute UUID
        public let uuid: UInt128
    }
}

extension ATTFindInformationResponse.Attribute128Bit: DataConvertible {
    
    static func += <T: DataContainer> (data: inout T, value: ATTFindInformationResponse.Attribute128Bit) {
        
        data += value.handle.littleEndian
        data += value.uuid.littleEndian
    }
}

public extension ATTFindInformationResponse {
    
    /// Found Attribute Data.
    enum AttributeData: Equatable {
        
        /// Handle and 16-bit Bluetooth UUID
        case bit16([Attribute16Bit])
        
        /// Handle and 128-bit UUIDs
        case bit128([Attribute128Bit])
        
        /// The data's format.
        public var format: Format {
            
            switch self {
            case .bit16: return .bit16
            case .bit128: return .bit128
            }
        }
        
        /// Number of items.
        public var count: Int {
            
            switch self {
            case let .bit16(value): return value.count
            case let .bit128(value): return value.count
            }
        }
        
        internal init?(data: Data, format: Format) {
            
            let pairLength = format.length
            
            guard data.count % pairLength == 0
                else { return nil }
            
            let pairCount = data.count / pairLength
            
            var bit16Pairs: [Attribute16Bit] = []
            var bit128Pairs: [Attribute128Bit] = []
            
            switch format {
            case .bit16: bit16Pairs.reserveCapacity(pairCount)
            case .bit128: bit128Pairs.reserveCapacity(pairCount)
            }
            
            for pairIndex in 0 ..< pairCount {
                
                let byteIndex = pairIndex * pairLength
                let pairBytes = data.subdataNoCopy(in: byteIndex ..< byteIndex + pairLength)
                let handle = UInt16(littleEndian: UInt16(bytes: (pairBytes[0], pairBytes[1])))
                
                switch format {
                case .bit16:
                    let uuid = UInt16(littleEndian: UInt16(bytes: (pairBytes[2], pairBytes[3])))
                    bit16Pairs.append(Attribute16Bit(handle: handle, uuid: uuid))
                case .bit128:
                    let uuidBytes = pairBytes.subdataNoCopy(in: 2 ..< 18)
                    let uuid = UInt128(littleEndian: UInt128(data: uuidBytes)!)
                    bit128Pairs.append(Attribute128Bit(handle: handle, uuid: uuid))
                }
            }
            
            switch format {
            case .bit16: self = .bit16(bit16Pairs)
            case .bit128: self = .bit128(bit128Pairs)
            }
        }
    }
}

extension ATTFindInformationResponse.AttributeData: DataConvertible {
    
    var dataLength: Int {
        
        switch self {
        case let .bit16(attributes):
            return ATTFindInformationResponse.Format.bit16.length * attributes.count
        case let .bit128(attributes):
            return ATTFindInformationResponse.Format.bit128.length * attributes.count
        }
    }
    
    static func += <T: DataContainer> (data: inout T, value: ATTFindInformationResponse.AttributeData) {
        
        switch value {
        case let .bit16(attributes):
            attributes.forEach { data += $0 }
        case let .bit128(attributes):
            attributes.forEach { data += $0 }
        }
    }
}
