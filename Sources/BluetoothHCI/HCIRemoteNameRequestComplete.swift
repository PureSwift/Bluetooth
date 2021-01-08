//
//  HCIRemoteNameRequestComplete.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// HCI Remote Name Request Complete Event
@frozen
public struct HCIRemoteNameRequestComplete: HCIEventParameter {
    
    public static let event = HCIGeneralEvent.remoteNameRequestComplete
    public static let length = 255
    
    public var status: HCIStatus
    public var address: BluetoothAddress
    public var name: String
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        let statusByte = data[0]
        
        guard let status = HCIStatus(rawValue: statusByte)
            else { return nil }
        
        self.status = status
        self.address = BluetoothAddress(littleEndian: BluetoothAddress(bytes: (data[1], data[2], data[3], data[4], data[5], data[6])))
        
        guard let name = String(data: data.subdataNoCopy(in: 7 ..< type(of: self).length), encoding: .utf8)
            else { return nil }
        
        self.name = name
    }
}
