//
//  HCILinkKeyNotification.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 8/10/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// Link Key Notification Event
///
/// The Link Key Notification event is used to indicate to the Host that a new Link Key has been created for the connection with the device specified in BD_ADDR. The Host can save this new Link Key in its own storage for future use. Also, the Host can decided to store the Link Key in the BR/EDR Control- ler’s Link Key Storage by using the Write_Stored_Link_Key command. The Key_Type event parameter informs the Host about which key type (combina- tion key, local unit key, or remote unit key, debug combination key, unauthenti- cated combination key, authenticated combination key or changed combination key) that was used during pairing. If pairing with unit key is not supported, the Host can for instance discard the key or disconnect the link.
///
/// The combination key Key_Type is used when standard pairing was used. The debug combination key Key_Type is used when Simple Pairing was used and the debug public key is sent or received. The unauthenticated combination key Key_Type is used when the Just Works Simple Pairing association model was used. The authenticated combination key Key_Type is used when Simple Pair- ing was used and the Just Works association mode was not used. The changed combination key Key_Type is used when the link key has been changed using the Change Connection Link Key procedure and Simple Pairing Mode is set to enabled. Note: It is the responsibility of the Host to remember the Key_Type (combination, debug combination, unauthenticated combination, or authenticated combination) prior to changing the link key.
@frozen
public struct HCILinkKeyNotification: HCIEventParameter {
    
    public static let event = HCIGeneralEvent.linkKeyNotification
    
    public static let length: Int = 23
    
    public let address: BluetoothAddress
    
    public var linkKey: UInt128
    
    public var keyType: KeyType
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        let address = BluetoothAddress(littleEndian: BluetoothAddress(bytes: (data[0], data[1], data[2], data[3], data[4], data[5])))
        
        let linkKey = UInt128(littleEndian: UInt128(bytes: (data[6], data[7], data[8], data[9], data[10], data[11], data[12], data[13],
                                                            data[14], data[15], data[16], data[17], data[18], data[19], data[20], data[21])))
        
        guard let keyType = KeyType(rawValue: data[22])
            else { return nil }
        
        self.address = address
        self.linkKey = linkKey
        self.keyType = keyType
    }
}

extension HCILinkKeyNotification {
    
    public enum KeyType: UInt8 {
        
        /// Combination Key
        case combination = 0x00
        
        /// Local Unit Key
        case localUnit = 0x01
        
        /// Remote Unit Key
        case remoteUnit = 0x02
        
        /// Debug Combination Key
        case debugCombination = 0x03
        
        /// Unauthenticated Combination Key
        case unauthenticatedCombination = 0x04
        
        /// Authenticated Combination Key
        case authenticatedCombination = 0x05
        
        /// Changed Combination Key
        case changedCombination = 0x06
    }
}
