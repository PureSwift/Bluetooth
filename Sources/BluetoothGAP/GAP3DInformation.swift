//
//  GAP3DInformation.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

#if canImport(Foundation)
import Foundation
#endif
import Bluetooth

/// The 3DD shall include a section in its EIR data providing 3D Synchronization Profile
///
/// - Note: Future versions of this EIR data may be extended to carry additional bytes in the Profile specific 3D Information data section. Therefore, 3DG compliant with this version of the Profile specification shall ignore any additional data beyond what is specified in Table 5.2, if present.
@frozen
public struct GAP3DInformation: GAPData, Equatable {

    public static var dataType: GAPDataType { .informationData3D }

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
    public var flags: Flags

    /**
     Path Loss Threshold

     In dB. Maximum allowable path attenuation from 3DD to 3DG.
     Greater attenuation than this number will inform the 3DG that it is too far away and to look for another 3DD.
     */
    public var pathLossThreshold: UInt8

    public init(
        flags: Flags = [],
        pathLossThreshold: UInt8 = 0
    ) {

        self.flags = flags
        self.pathLossThreshold = pathLossThreshold
    }
}

public extension GAP3DInformation {

    init?<Data: DataContainer>(data: Data) {

        guard data.count == 2
        else { return nil }

        let flags = Flags(rawValue: data[data.startIndex])
        let pathLossThreshold = data[1]

        self.init(flags: flags, pathLossThreshold: pathLossThreshold)
    }
    
    func append<Data: DataContainer>(to data: inout Data) {
        data += flags.rawValue
        data += pathLossThreshold
    }

    var dataLength: Int {
        2
    }
}

// MARK: - Supporting Types

public extension GAP3DInformation {

    /// GAP 3D Information Flags
    struct Flags: OptionSet {

        public let rawValue: UInt8

        public init(rawValue: UInt8) {
            self.rawValue = rawValue
        }
    }
}

public extension GAP3DInformation.Flags {

    /// Association Notification: (Byte 2, bit 0)
    /// 0 – Not supported
    /// 1 – Supported
    static var associationNotification: GAP3DInformation.Flags { GAP3DInformation.Flags(rawValue: 0b00000001) }

    /// Battery Level Reporting: (Byte 2, bit 1)
    /// 0 – Not supported
    /// 1 – Supported
    static var batteryLevelReporting: GAP3DInformation.Flags { GAP3DInformation.Flags(rawValue: 0b00000010) }

    /// Send Battery Level Report on Start-up Synchronization: (Byte 2, bit 2)
    /// 0 – 3DD requests 3DG to not send a 3DG Connection Announcement Message with Battery Level Report on Start-up Synchronization.
    /// 1 – 3DD requests 3DG to send a 3DG Connection Announcement Message with Battery Level Report on Start-up Synchronization.
    ///
    /// - Note: The value shall be set to 0 if the Battery Level Reporting is set to 0.
    static var sendBatteryLevelOnStartUp: GAP3DInformation.Flags { GAP3DInformation.Flags(rawValue: 0b00000100) }

    /// Factory Test Mode: (Byte 2, bit 7)
    /// 0 – normal operating mode
    /// 1 – vendor-defined factory test mode
    static var factoryTestMode: GAP3DInformation.Flags { GAP3DInformation.Flags(rawValue: 0b10000000) }
}
