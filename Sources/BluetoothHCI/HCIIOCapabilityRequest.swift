//
//  HCIIOCapabilityRequest.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 8/16/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// The IO Capability Request event is used to indicate that the IO capabilities of the Host are required for a simple pairing process. The Host shall respond with an IO_Capability_Request_Reply command. This event shall only be generated if simple pairing has been enabled with the Write_Simple_Pairing_Mode command.
@frozen
public struct HCIIOCapabilityRequest: HCIEventParameter {
    
    public static let event = HCIGeneralEvent.ioCapabilityRequest
    
    public static let length: Int = 6
    
    public let address: BluetoothAddress
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        let address = BluetoothAddress(littleEndian: BluetoothAddress(bytes: (data[0], data[1], data[2], data[3], data[4], data[5])))
        
        self.address = address
    }
}
