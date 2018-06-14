//
//  LowEnergyPeerIdentifyAddressType.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

/// Bluetooth LE Peer Identify Address Type
public enum LowEnergyPeerIdentifyAddressType: UInt8 { //Peer_Identity_Address_Type
    
    case `public` = 0x00
    case `random` = 0x01
}
