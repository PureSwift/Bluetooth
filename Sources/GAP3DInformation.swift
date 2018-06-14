//
//  GAP3DInformation.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/**
 The 3DD shall include a section in its EIR data providing 3D Synchronization Profile
 
 • Association Notification: (Byte 2, bit 0)
 0 – Not supported
 1 – Supported
 
 • Battery Level Reporting: (Byte 2, bit 1)
 0 – Not supported
 1 – Supported
 
 • Send Battery Level Report on Start-up Synchronization: (Byte 2, bit 2)
 0 – 3DD requests 3DG to not send a 3DG Connection Announcement Message with Battery Level Report on Start-up Synchronization.
 1 – 3DD requests 3DG to send a 3DG Connection Announcement Message with Battery Level Report on Start-up Synchronization.
 
 - Note: The value shall be set to 0 if the Battery Level Reporting is set to 0.
 
 • Factory Test Mode: (Byte 2, bit 7)
 0 – normal operating mode
 1 – vendor-defined factory test mode
 
 • Path Loss Threshold
 In dB. Maximum allowable path attenuation from 3DD to 3DG.
 Greater attenuation than this number will inform the 3DG that it is too far away and to look for another 3DD.
 
 - Note: Bits 3, 4, 5 and 6 of Byte 2 are reserved for future use
 
 - Note: Future versions of this EIR data may be extended to carry additional bytes in the Profile specific 3D Information data section. Therefore, 3DG compliant with this version of the Profile specification shall ignore any additional data beyond what is specified in Table 5.2, if present.
 */
public struct GAP3DInformation: GAPData {
    
    internal static let minLength = 2
    
    public static var dataType: GAPDataType = .informationData3D
    
    public var flags: BitMaskOptionSet<GAP3DInformationFlag>
    
    public var pathLossThreshold: UInt8
    
    public init(flags: BitMaskOptionSet<GAP3DInformationFlag>, pathLossThreshold: UInt8) {
        
        self.flags = flags
        self.pathLossThreshold = pathLossThreshold
    }
    
    public init?(data: Data) {
        
        guard data.count >= type(of: self).minLength
            else { return nil }
        
        let flags = BitMaskOptionSet<GAP3DInformationFlag>(rawValue: data[0])
        let pathLossThreshold = data[1]
        
        self.init(flags: flags, pathLossThreshold: pathLossThreshold)
    }
    
    public var data: Data {
        
        return Data([flags.rawValue, pathLossThreshold])
    }
    
}

extension GAP3DInformation: Equatable {
    
    public static func == (lhs: GAP3DInformation, rhs: GAP3DInformation) -> Bool {
        
        return lhs.flags == rhs.flags && lhs.pathLossThreshold == rhs.pathLossThreshold
    }
}

extension GAP3DInformation: CustomStringConvertible {
    
    public var description: String {
        
        return flags.description + pathLossThreshold.description
    }
}

public enum GAP3DInformationFlag: UInt8, BitMaskOption {
    
    #if swift(>=3.2)
    #elseif swift(>=3.0)
    public typealias RawValue = UInt8
    #endif
    
    case associationNotification = 0b01
    
    case batteryLevelReporting = 0b10
    
    case sendBatteryLevelOnStartUp = 0b100
    
    case factoryTestMode = 0b10000000
    
    public static let all: Set<GAP3DInformationFlag> = [
        .associationNotification,
        .batteryLevelReporting,
        .sendBatteryLevelOnStartUp,
        .factoryTestMode
    ]
    
}
