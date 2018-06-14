//
//  GAPClassOfDevice.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/13/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// Specifies the class of the device
/// Size: 3 octets
public struct GAPClassOfDevice: GAPData {
    
    public typealias Identifier = (UInt8, UInt8, UInt8)
    
    internal static let length = MemoryLayout<Identifier>.size
    
    public static let dataType: GAPDataType = .classOfDevice
    
    public let device: Identifier
    
    public init(device: Identifier) {
        
        self.device = device
    }
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        let device = (data[0], data[1], data[2])
        
        self.init(device: device)
    }
    
    public var data: Data {
        
        return Data([device.0, device.1, device.2])
    }
}

extension GAPClassOfDevice: Equatable {
    
    public static func == (lhs: GAPClassOfDevice, rhs: GAPClassOfDevice) -> Bool {
        
        return lhs.device == rhs.device
    }
}

extension GAPClassOfDevice: CustomStringConvertible {
    
    public var description: String {
        
        return "\(device.0) \(device.1) \(device.2)"
    }
}
