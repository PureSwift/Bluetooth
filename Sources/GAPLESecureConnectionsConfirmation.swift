//
//  GAPLESecureConnectionsConfirmation.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/13/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// Specifies the LE Secure Connections Confirmation Value
/// Size: 16 octets
/// Format defined in [Vol 3], Part H, Section 2.3.5.6.4
public struct GAPLESecureConnectionsConfirmation: GAPData {
    
    internal static let length = MemoryLayout<UInt16>.size
    
    public static let dataType: GAPDataType = .lowEnergySecureConnectionsConfirmation
    
    public let confirmation: UInt16
    
    public init(confirmation: UInt16) {
        
        self.confirmation = confirmation
    }
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        let confirmation = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
        
        self.init(confirmation: confirmation)
    }
    
    public var data: Data {
        
        let value = confirmation.littleEndian
        return Data(bytes: [value.bytes.0, value.bytes.1])
    }
}

extension GAPLESecureConnectionsConfirmation: Equatable {
    
    public static func == (lhs: GAPLESecureConnectionsConfirmation, rhs: GAPLESecureConnectionsConfirmation) -> Bool {
        
        return lhs.confirmation == rhs.confirmation
    }
}

extension GAPLESecureConnectionsConfirmation: CustomStringConvertible {
    
    public var description: String {
        
        return confirmation.description
    }
}
