//
//  HCILEReadLocalP256PublicKeyComplete.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/15/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// LE Read Local P-256 Public Key Complete Event
///
/// This event is generated when local P-256 key generation is complete.
public struct HCILEReadLocalP256PublicKeyComplete: HCIEventParameter {
    
    public static let event = LowEnergyEvent.readLocalP256PublicKeyComplete // 0x08
    
    public static let length: Int = 65
    
    public let status: HCIStatus
    
    public let localP256PublicKey: UInt512
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        let statusByte = data[0]
        
        guard let status = HCIStatus(rawValue: statusByte)
            else { return nil }
        
        let localP256PublicKey = UInt512(littleEndian: UInt512(bytes: ((data[1], data[2], data[3], data[4], data[5], data[6], data[7], data[8], data[9], data[10], data[11], data[12], data[13], data[14], data[15], data[16], data[17], data[18], data[19], data[20], data[21], data[22], data[23], data[24], data[25], data[26], data[27], data[28], data[29], data[30], data[31], data[32], data[33], data[34], data[35], data[36], data[37], data[38], data[39], data[40], data[41], data[42], data[43], data[44], data[45], data[46], data[47], data[48], data[49], data[50], data[51], data[52], data[53], data[54], data[55], data[56], data[57], data[58], data[59], data[60], data[61], data[62], data[63], data[64]))))
        
        self.status = status
        self.localP256PublicKey = localP256PublicKey
    }
}
