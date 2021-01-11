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
@frozen
public enum GAPLERole: UInt8, GAPData {
    
    public static var dataType: GAPDataType { return .lowEnergyRole }
    
    /// Only Peripheral Role supported.
    case onlyPeripheralRoleSupported = 0x00
    
    /// Only Central Role supported.
    case onlyCentralRoleSupported = 0x01
    
    /// Peripheral and Central Role supported, Peripheral Role preferred for connection establishment.
    case bothSupportedPeripheralPreferred = 0x02
    
    /// Peripheral and Central Role supported, Central Role preferred for connection establishment.
    case bothSupportedCentralPreferred = 0x03
}

public extension GAPLERole {
    
    init?(data: Data) {
        
        guard data.count == 1
            else { return nil }
        
        self.init(rawValue: data[0])
    }
    
    func append(to data: inout Data) {
        data += rawValue
    }
    
    var dataLength: Int {
        return 1
    }
}

// MARK: - Supporting Types

public extension GAPLERole {
    
    /// Bluetooth LE Role (e.g. Central or peripheral).
    enum Role: UInt8, BitMaskOption, CaseIterable { // not part of BT spec
        
        case central = 0b01
        case peripheral = 0b10
    }
}

public extension GAPLERole {
    
    var supported: BitMaskOptionSet<Role> {
        
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
    
    var preferred: Role {
        
        switch self {
        case .onlyPeripheralRoleSupported,
             .bothSupportedPeripheralPreferred:
            return .peripheral
        case .onlyCentralRoleSupported,
             .bothSupportedCentralPreferred:
            return .central
        }
    }
}
