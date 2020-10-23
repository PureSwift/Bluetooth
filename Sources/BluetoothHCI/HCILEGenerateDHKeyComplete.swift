//
//  HCILEGenerateDHKeyComplete.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/15/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// LE Generate DHKey Complete Event
///
/// This event indicates that LE Diffie Hellman key generation has been completed by the Controller.
public struct HCILEGenerateDHKeyComplete: HCIEventParameter {
    
    public static let event = LowEnergyEvent.generateDHKeyComplete // 0x09
    
    public static let length: Int = 33
    
    public let status: HCIStatus
    
    public let dhKey: UInt256
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        let statusByte = data[0]
        
        guard let status = HCIStatus(rawValue: statusByte)
            else { return nil }
        
        let dhKey = UInt256(littleEndian: UInt256(bytes: ((data[1], data[2], data[3], data[4], data[5], data[6], data[7], data[8], data[9], data[10], data[11], data[12], data[13], data[14], data[15], data[16], data[17], data[18], data[19], data[20], data[21], data[22], data[23], data[24], data[25], data[26], data[27], data[28], data[29], data[30], data[31], data[32]))))
        
        self.status = status
        self.dhKey = dhKey
    }
}
