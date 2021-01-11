//
//  HCIPINCodeRequest.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 8/10/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// The PIN Code Request event is used to indicate that a PIN code is required to create a new link key. The Host shall respond using either the PIN_Code_Request_Reply or the PIN_Code_Request_Negative_Reply command, depending on whether the Host can provide the Controller with a PIN code or not.
///
/// - Note: If the PIN Code Request event is masked away, then the BR/EDR Controller will assume that the Host has no PIN Code.
/// When the BR/EDR Controller generates a PIN Code Request event in order for the local Link Manager to respond to the request from the remote Link Manager (as a result of a Create_Connection or Authentication_Requested com- mand from the remote Host), the local Host must respond with either a PIN_Code_Request_Reply or PIN_Code_Request_Negative_Reply com- mand before the remote Link Manager detects LMP response timeout
@frozen
public struct HCIPINCodeRequest: HCIEventParameter {
    
    public static let event = HCIGeneralEvent.pinCodeRequest
    
    public static let length: Int = 6
    
    public let address: BluetoothAddress
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        let address = BluetoothAddress(littleEndian: BluetoothAddress(bytes: (data[0], data[1], data[2], data[3], data[4], data[5])))
        
        self.address = address
    }
}
