//
//  GATTCentralAddressResolution.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/19/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/**
 Central Address Resolution
 
 The information contained on this web page is informative.
 Informative means that the text may provide background or context to the authoritative text contained in the adopted Bluetooth specification. Informative text is not considered when determining compliance to the Bluetooth specification. Please refer to the adopted Bluetooth specification for the normative (i.e. authoritative) text used to establish compliance. Compliance issues due to errors on this web page are not the responsibility of the Bluetooth SIG and rest solely with the member.
 
The Peripheral checks if the peer device supports address resolution by reading the Central Address Resolution characteristic before using directed advertisement where the initiator address is set to a Resolvable Private Address (RPA).
 
 [Central Address Resolution](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.gap.central_address_resolution.xml)
 
 - Note:
 A device has only one instance of the Central Address Resolution characteristic. If the Central Address Resolution characteristic is not present, then it is assumed that Central Address Resolution is not supported.
 */
public struct GATTCentralAddressResolution: GATTCharacteristic {
    
    public static var uuid: BluetoothUUID { return .centralAddressResolution }
    
    internal static let length = MemoryLayout<UInt8>.size
    
    /// Whether address resolution is supported in this device.
    public var isSupported: Bool
    
    public init(isSupported: Bool) {
        
        self.isSupported = isSupported
    }
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        guard let booleanValue = Bool(byteValue: data[0])
            else { return nil }
        
        self.init(isSupported: booleanValue)
    }
    
    public var data: Data {
        
        return Data([isSupported.byteValue])
    }
}

// MARK: - Equatable

extension GATTCentralAddressResolution: Equatable {
    
    public static func == (lhs: GATTCentralAddressResolution, rhs: GATTCentralAddressResolution) -> Bool {
        
        return lhs.isSupported == rhs.isSupported
    }
}

// MARK: - CustomStringConvertible

extension GATTCentralAddressResolution: CustomStringConvertible {
    
    public var description: String {
        
        return isSupported.description
    }
}

// MARK: - ExpressibleByBooleanLiteral

extension GATTCentralAddressResolution: ExpressibleByBooleanLiteral {
    
    public init(booleanLiteral value: Bool) {
        
        self.init(isSupported: value)
    }
}
