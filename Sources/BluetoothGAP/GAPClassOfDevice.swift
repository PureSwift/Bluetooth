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
@frozen
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
    
    public func hash(into hasher: inout Hasher) {
        withUnsafeBytes(of: device) { hasher.combine(bytes: $0) }
    }
}
