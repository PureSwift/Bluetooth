//
//  HCILinkKeyRequest.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 8/3/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// Link Key Request Event
///
/// The Link Key Request event is used to indicate that a Link Key is required for the connection with the device specified in BD_ADDR. If the Host has the requested stored Link Key, then the Host shall pass the requested Key to the Controller using the Link_Key_Request_Reply command. If the Host does not have the requested stored Link Key, or the stored Link Key does not meet the security requirements for the requested service, then the Host shall use the Link_Key_Request_Negative_Reply command to indicate to the Controller that the Host does not have the requested key.
///
/// - Note: If the Link Key Request event is masked away, then the BR/EDR Con- troller will assume that the Host has no additional link keys.
/// If the Host uses the Link_Key_Request_Negative_Reply command when the requested service requires an authenticated Link Key and the current Link Key is unauthenticated, the Host should set the Authentication_Requirements parameter one of the MITM Protection Required options.
///
/// When the Controller generates a Link Key Request event in order for the local Link Manager to respond to the request from the remote Link Manager (as a result of a Create_Connection or Authentication_Requested command from the remote Host), the local Host must respond with either a Link_Key_Request_Reply or Link_Key_Request_Negative_Reply command before the remote Link Manager detects LMP response timeout.
@frozen
public struct HCILinkKeyRequest: HCIEventParameter {
    
    public static let event = HCIGeneralEvent.linkKeyRequest
    
    public static let length: Int = 6
    
    public let address: BluetoothAddress
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        let address = BluetoothAddress(littleEndian: BluetoothAddress(bytes: (data[0], data[1], data[2], data[3], data[4], data[5])))
        
        self.address = address
    }
}
