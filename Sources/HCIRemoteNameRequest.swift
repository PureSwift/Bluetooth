//
//  HCIRemoteNameRequest.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/15/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// HCI Remote Name Request
///
/// The Remote_Name_Request command is used to obtain the user-friendly name of another BR/EDR Controller. The user-friendly name is used to enable the user to distinguish one BR/EDR Controller from another. The BD_ADDR command parameter is used to identify the device for which the user-friendly name is to be obtained. The Page_Scan_Repetition_Mode parameter specifies the page scan repetition mode supported by the remote device with the BD_ADDR. This is the information that was acquired during the inquiry process. The Clock_Offset parameter is the difference between its own clock and the clock of the remote device with BD_ADDR. Only bits 2 through 16 of the difference are used and they are mapped to this parameter as bits 0 through 14 respectively. A Clock_Offset_Valid_Flag, located in bit 15 of the Clock_Offset command parameter, is used to indicate if the Clock Offset is valid or not.
///
/// When the Remote Supported Host Features Notification event is unmasked and when the Remote_Name_Request command initiates a connection, the Link Manager shall read the remote LMP features mask pages 0 and 1.
///
/// -  Note: If no connection exists between the local device and the device corre- sponding to the BD_ADDR, a temporary link layer connection will be estab- lished to obtain the LMP features and name of the remote device.
public struct HCIRemoteNameRequest: HCICommandParameter {
    
    public static let command = LinkControlCommand.remoteNameRequest
    
    internal static let length = 10
    
    public var address: Address
    
    public var pscanRepMode: PageScanRepetitionMode
    
    // Must be set to 0x00
    internal var reserved: Reserved
    
    public var clockOffset: UInt16
    
    public init(address: Address,
                pscanRepMode: PageScanRepetitionMode,
                clockOffset: UInt16) {
        
        self.address = address
        self.pscanRepMode = pscanRepMode
        self.reserved = .mandatory
        self.clockOffset = clockOffset
    }
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        self.address = Address(bytes: (data[0], data[1], data[2], data[3], data[4], data[5]))
        
        guard let pscanRepMode = PageScanRepetitionMode(rawValue: data[6])
            else { return nil }
        
        guard let reserved = Reserved(rawValue: data[7])
            else { return nil }
        
        self.reserved = reserved
        self.pscanRepMode = pscanRepMode
        self.reserved = reserved
        self.clockOffset = UInt16(littleEndian: UInt16(bytes: (data[8], data[9])))
    }
    
    public var data: Data {
        
        let addressBytes = address.littleEndian.bytes
        
        let clockOffsetBytes = clockOffset.littleEndian.bytes
        
        return Data([addressBytes.0,
                     addressBytes.1,
                     addressBytes.2,
                     addressBytes.3,
                     addressBytes.4,
                     addressBytes.5,
                     pscanRepMode.rawValue,
                     reserved.rawValue,
                     clockOffsetBytes.0,
                     clockOffsetBytes.1])
    }
}

extension HCIRemoteNameRequest {
    
    // Must be set to 0x00
    public enum Reserved: UInt8 {
        
        case mandatory = 0x00
    }
}
