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
 
 - Note: Future versions of this EIR data may be extended to carry additional bytes in the Profile specific 3D Information data section. Therefore, 3DG compliant with this version of the Profile specification shall ignore any additional data beyond what is specified in Table 5.2, if present.
 */
@frozen
public struct GAP3DInformation: GAPData, Equatable {
    
    public static var dataType: GAPDataType { return .informationData3D }
    
    /**
     GAP 3D Information Flags
     
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
    */
    public var flags: BitMaskOptionSet<Flag>
    
    /**
     Path Loss Threshold
     
     In dB. Maximum allowable path attenuation from 3DD to 3DG.
     Greater attenuation than this number will inform the 3DG that it is too far away and to look for another 3DD.
     */
    public var pathLossThreshold: UInt8
    
    public init(flags: BitMaskOptionSet<Flag> = 0,
                pathLossThreshold: UInt8 = 0) {
        
        self.flags = flags
        self.pathLossThreshold = pathLossThreshold
    }
}

public extension GAP3DInformation {
    
    init?(data: Data) {
        
        guard data.count == 2
            else { return nil }
        
        let flags = BitMaskOptionSet<Flag>(rawValue: data[data.startIndex])
        let pathLossThreshold = data[1]
        
        self.init(flags: flags, pathLossThreshold: pathLossThreshold)
    }
    
    func append(to data: inout Data) {
        
        data += flags.rawValue
        data += pathLossThreshold
    }
    
    var dataLength: Int {
        
        return 2
    }
}

// MARK: - Supporting Types

public extension GAP3DInformation {
    
    /// GAP 3D Information Flag
    enum Flag: UInt8, BitMaskOption {
        
        /// Association Notification
        case associationNotification = 0b01
        
        /// Battery Level Reporting
        case batteryLevelReporting = 0b10
        
        /// Send Battery Level Report on Start-up Synchronization
        case sendBatteryLevelOnStartUp = 0b100
        
        /// Factory Test Mode
        case factoryTestMode = 0b10000000
        
        public static let allCases: [Flag] = [
            .associationNotification,
            .batteryLevelReporting,
            .sendBatteryLevelOnStartUp,
            .factoryTestMode
        ]
    }
}
