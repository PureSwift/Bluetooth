//
//  StatusParametersCommand.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 3/23/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

@frozen
public enum StatusParametersCommand: UInt16, HCICommand {

    public static let opcodeGroupField = HCIOpcodeGroupField.statusParameters

    /// Read Failed Contact Counter Command
    ///
    /// This command reads the value for the Failed_Contact_Counter parameter for a particular connection to another device.
    case readFailedContactCounter = 0x01

    /// Reset Failed Contact Counter Command
    ///
    /// This command resets the value for the Failed_Contact_Counter parameter for a particular connection to another device.
    case resetFailedContactCounter = 0x02

    /// Read Link Quality Command
    ///
    /// This command returns the value for the Link_Quality for the specified Handle
    case readLinkQuality = 0x03

    /// Read RSSI Command
    ///
    /// This command reads the Received Signal Strength Indication (RSSI) value from a Controller.
    ///
    /// - Note: OCF 0x0004 is unused/reserved by the specification; Read RSSI is 0x0005.
    case readRSSI = 0x05

    /// Read AFH Channel Map Command
    ///
    /// This command returns the values for the AFH_Mode and AFH_Channel_Map for the specified Connection_Handle
    case readAFHChannelMap = 0x06

    /// Read Clock Command
    ///
    /// This command reads the estimate of the value of the Bluetooth Clock from the BR/EDR Controller.
    case readClock = 0x07

    /// Read Encryption Key Size Command
    ///
    /// This command reads the current encryption key size associated with the Connection_Handle
    case readEncryptionKeySize = 0x08

    /// Read Local AMP Info Command
    ///
    /// This command returns information about the AMP Controller.
    case readLocalAMPInfo = 0x09

    /// Read Local AMP ASSOC Command
    ///
    /// This command returns a fragment of the AMP_ASSOC structure
    case readLocalAMPASSOC = 0x0A

    /// Write Remote AMP ASSOC Command
    ///
    /// This command writes an AMP_ASSOC fragment to the AMP Controller
    case writeRemoteAMPASSOC = 0x0B
}

// MARK: - Name

public extension StatusParametersCommand {

    var name: String {

        return Self.names[Int(rawValue)]
    }

    private static let names = [
        "Unknown",
        "Read Failed Contact Counter",
        "Reset Failed Contact Counter",
        "Read Link Quality",
        "Unknown",
        "Read RSSI",
        "Read AFH Channel Map",
        "Read Clock",
        "Read Encryption Key Size",
        "Read Local AMP Info",
        "Read Local AMP ASSOC",
        "Write Remote AMP ASSOC"
    ]
}
