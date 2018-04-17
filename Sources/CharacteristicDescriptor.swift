//
//  CharacteristicDescriptor.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 4/17/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// GATT Client Characteristic Configuration Descriptor
public struct GATTClientCharacteristicConfigurationDescriptor {
    
    public static let length = 2
    
    public var notify: Bool
    
    public var indicate: Bool
    
    public init?(byteValue: [UInt8]) {
        
        guard byteValue.count == type(of: self).length
            else { return nil }
        
        guard let notify = Bool(byteValue: byteValue[0]),
            let indicate = Bool(byteValue: byteValue[1])
            else { return nil }
        
        self.notify = notify
        self.indicate = indicate
    }
    
    public var byteValue: [UInt8] {
        
        return [notify.byteValue, indicate.byteValue]
    }
    
    public var descriptor: GATT.Descriptor {
        
        return GATT.Descriptor(uuid: .clientCharacteristicConfiguration,
                               value: Data(byteValue),
                               permissions: [.read, .write])
    }
}
