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
    
    public static let dataType: GAPDataType = .classOfDevice
    
    public let device: Identifier
    
    public init(device: Identifier) {
        
        self.device = device
    }
}

public extension GAPClassOfDevice {
    
    init? <T: DataContainer> (data: T) {
        
        guard data.count == MemoryLayout<Identifier>.size
            else { return nil }
        
        let device = (data[data.startIndex + 0],
                      data[data.startIndex + 1],
                      data[data.startIndex + 2])
        
        self.init(device: device)
    }
    
    static func += <T: DataContainer> (data: inout T, value: Self) {
        
        data += device.0
        data += device.1
        data += device.2
    }
}

// MARK: - Equatable

extension GAPClassOfDevice: Equatable {
    
    public static func == (lhs: GAPClassOfDevice, rhs: GAPClassOfDevice) -> Bool {
        
        return lhs.device == rhs.device
    }
}
