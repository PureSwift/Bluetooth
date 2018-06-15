//
//  HCILEScanRequestReceived.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/15/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// LE Scan Request Received Event
///
/// The vent indicates that a SCAN_REQ PDU or an AUX_SCAN_REQ PDU has been received by the advertiser.
/// The request contains a device address from a scanner that is allowed by the advertising filter policy.
/// The advertising set is identified by Advertising_Handle.
public struct HCILEScanRequestReceived: HCIEventParameter {
    
    public static let event = LowEnergyEvent.scanRequestReceived // 0x13
    
    public static let length: Int = 8
    
    public let advertisingHandle: UInt8
    
    public let scannerAddressType: LowEnergyAddressType
    
    public let scannerAddress: Address
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        let advertisingHandle =  data[0]
        
        guard let scannerAddressType = LowEnergyAddressType(rawValue: data[1])
            else { return nil }
        
        let scannerAddress = Address(littleEndian: Address(bytes: (data[2], data[3], data[4], data[5], data[6], data[7])))
        
        self.advertisingHandle = advertisingHandle
        self.scannerAddressType = scannerAddressType
        self.scannerAddress = scannerAddress
    }
}
