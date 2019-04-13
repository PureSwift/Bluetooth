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
    
    init?(data: Data) {
        
        guard data.count == MemoryLayout<Identifier>.size
            else { return nil }
        
        let device = (data[0],
                      data[1],
                      data[2])
        
        self.init(device: device)
    }
    
    func append(to data: inout Data) {
        
        data += device.0
        data += device.1
        data += device.2
    }
    
    var dataLength: Int {
        
        return MemoryLayout<Identifier>.size
    }
}

// MARK: - Equatable

extension GAPClassOfDevice: Equatable {
    
    public static func == (lhs: GAPClassOfDevice, rhs: GAPClassOfDevice) -> Bool {
        
        return lhs.device == rhs.device
    }
}


// MARK: - Hashable

extension GAPClassOfDevice: Hashable {
    
    #if swift(>=4.2)
    public func hash(into hasher: inout Hasher) {
        
        device.0.hash(into: &hasher)
        device.1.hash(into: &hasher)
        device.2.hash(into: &hasher)
    }
    #else
    public var hashValue: Int {
        
        return unsafeBitCast((UInt8(0), device.0, device.1, device.2), to: UInt32.self).hashValue
    }
    #endif
}
