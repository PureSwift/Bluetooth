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
public struct ATTFindInformationResponse: ATTProtocolDataUnit {
    
    public static let attributeOpcode = ATTOpcode.findInformationResponse
    
    /// Length ranges from 6, to the maximum MTU size.
    public static let length = 6
    
    /// The information data whose format is determined by the Format field.
    public var data: AttributeData
    
    public init(data: AttributeData) {
        
        self.data = data
    }
    
    public init?(byteValue: [UInt8]) {
        
        guard byteValue.count >= ATTFindInformationResponse.length else { return nil }
        
        let attributeOpcodeByte = byteValue[0]
        let formatByte = byteValue[1]
        let remainderData = Array(byteValue.suffix(from: 2))
        
        guard attributeOpcodeByte == type(of: self).attributeOpcode.rawValue,
            let format = Format(rawValue: formatByte),
            let data = AttributeData(byteValue: remainderData, format: format)
            else { return nil }
        
        self.data = data
    }
    
    public var byteValue: [UInt8] {
        
        // first 2 bytes are opcode and format
        return [type(of: self).attributeOpcode.rawValue, data.format.rawValue] + data.byteValue
    }
}

// MARK: - Supporting Types

public extension ATTFindInformationResponse {

    public enum Format: UInt8 {
        
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
        
        public var length: Int {
            
            switch self {
            case .bit16: return 2 + 2
            case .bit128: return 2 + 16
            }
        }
    }
}

public extension ATTFindInformationResponse {
    
    /// Found Attribute Data.
    public enum AttributeData {
        
        /// Handle and 16-bit Bluetooth UUID
        case bit16([(UInt16, UInt16)])
        
        /// Handle and 128-bit UUIDs
        case bit128([(UInt16, UInt128)])
        
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
        
        /*
         public static func == (lhs: Data, rhs: Data) -> Bool {
         
         switch (lhs, rhs) {
         
         case let (.bit16(lhsValue), .bit16(rhsValue)):
         return lhsValue == rhsValue
         
         case let (.bit128(lhsValue), .bit128(rhsValue)):
         return lhsValue == rhsValue
         
         default:
         return false
         }
         }*/
        
        public init?(byteValue: [UInt8], format: Format) {
            
            let pairLength = format.length
            
            guard byteValue.count % pairLength == 0 else { return nil }
            
            let pairCount = byteValue.count / pairLength
            
            var bit16Pairs: [(UInt16, UInt16)] = []
            
            var bit128Pairs: [(UInt16, UInt128)] = []
            
            for pairIndex in 0 ..< pairCount {
                
                let byteIndex = pairIndex * pairLength
                
                let pairBytes = Array(byteValue[byteIndex ..< byteIndex + pairLength])
                
                let handle = UInt16(littleEndian: UInt16(bytes: (pairBytes[0], pairBytes[1])))
                
                switch format {
                    
                case .bit16:
                    
                    let uuid = UInt16(littleEndian: UInt16(bytes: (pairBytes[2], pairBytes[3])))
                    
                    bit16Pairs.append((handle, uuid))
                    
                case .bit128:
                    
                    let uuidBytes = Foundation.Data((pairBytes[2 ... 17]))
                    
                    assert(uuidBytes.count == UInt128.length)
                    
                    let uuid = UInt128(littleEndian: UInt128(data: uuidBytes)!)
                    
                    bit128Pairs.append((handle, uuid))
                }
            }
            
            switch format {
                
            case .bit16: self = .bit16(bit16Pairs)
                
            case .bit128: self = .bit128(bit128Pairs)
            }
        }
        
        public var byteValue: [UInt8] {
            
            var data = [UInt8]()
            
            switch self {
                
            case let .bit16(value):
                
                for pair in value {
                    
                    let handleBytes = pair.0.littleEndian.bytes
                    
                    let uuidBytes = pair.1.littleEndian.bytes
                    
                    data += [handleBytes.0, handleBytes.1, uuidBytes.0, uuidBytes.1]
                }
                
            case let .bit128(value):
                
                for pair in value {
                    
                    let handleBytes = pair.0.littleEndian.bytes
                    
                    let uuidBytes = pair.1.littleEndian.bytes
                    
                    data += [handleBytes.0, handleBytes.1, uuidBytes.0, uuidBytes.1, uuidBytes.2, uuidBytes.3, uuidBytes.4, uuidBytes.5, uuidBytes.6, uuidBytes.7, uuidBytes.8, uuidBytes.9, uuidBytes.10, uuidBytes.11, uuidBytes.12, uuidBytes.13, uuidBytes.14, uuidBytes.15]
                }
            }
            
            return data
        }
    }
}
