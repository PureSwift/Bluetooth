//
//  HCISimplePairingComplete.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 8/17/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// The Simple Pairing Complete event is used to indicate that the simple pairing process has completed. A Host that is displaying a numeric value can use this event to change its UI.
///
/// When the LMP simple pairing sequences fail for any reason, the Simple Pairing Complete event shall be sent to the Host. When Simple Pairing Complete event is sent in response to the IO capability exchange failing, the Status parameter shall be set to the error code received from the remote device. Oth- erwise, the Status shall be set to the error code “Authentication Failure.”
@frozen
public struct HCISimplePairingComplete: HCIEventParameter {
    
    public static let event = HCIGeneralEvent.simplePairingComplete
    
    public static let length: Int = 7
    
    public var status: HCIStatus
    
    public var address: BluetoothAddress
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        guard let status = HCIStatus(rawValue: data[0])
            else { return nil }
        
        let address = BluetoothAddress(littleEndian: BluetoothAddress(bytes: (data[1], data[2], data[3], data[4], data[5], data[6])))
        
        self.status = status
        self.address = address
    }
}
