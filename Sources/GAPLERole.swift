//
//  GAPLERole.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// The LE Role data type defines the LE role capabilities of the device.
/// The LE Role data type size is 1 octet.
public enum GAPLERole: UInt8, GAPData {
    
    internal static let length = MemoryLayout<UInt8>.size
    
    public static let dataType: GAPDataType = .lowEnergyRole
    
    /// Only Peripheral Role supported.
    case onlyPeripheralRoleSupported = 0x00
    
    /// Only Central Role supported.
    case onlyCentralRoleSupported = 0x01
    
    /// Peripheral and Central Role supported, Peripheral Role preferred for connection establishment.
    case bothSupportedPeripheralPreferred = 0x02
    
    /// Peripheral and Central Role supported, Central Role preferred for connection establishment.
    case bothSupportedCentralPreferred = 0x03
    
    /// Bluetooth LE Role (e.g. Central or peripheral).
    public enum Role: UInt8, BitMaskOption { // not part of BT spec
        
        #if swift(>=3.2)
        #elseif swift(>=3.0)
        public typealias RawValue = UInt8
        #endif
        
        case central = 0b01
        case peripheral = 0b10
        
        public static var all: Set<Role> = [.central, .peripheral]
    }
    
    public var supported: BitMaskOptionSet<Role> {
        
        switch self {
        case .onlyPeripheralRoleSupported:
            return [.peripheral]
        case .onlyCentralRoleSupported:
            return [.central]
        case .bothSupportedPeripheralPreferred,
             .bothSupportedCentralPreferred:
            return [.central, .peripheral]
        }
    }
    
    public var preferred: Role {
        
        switch self {
        case .onlyPeripheralRoleSupported,
             .bothSupportedPeripheralPreferred:
            return .peripheral
        case .onlyCentralRoleSupported,
             .bothSupportedCentralPreferred:
            return .central
        }
    }
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        self.init(rawValue: data[0])
    }
    
    public var data: Data {
        
        return Data([rawValue])
    }
}
