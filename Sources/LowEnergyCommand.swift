//
//  LowEnergyCommand.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 1/14/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

/// Bluetooth Low Energy Command opcode
public enum LowEnergyCommand: UInt16, HCICommand {
    
    public static let opcodeGroupField = HCIOpcodeGroupField.lowEnergy
    
    case setEventMask                   = 0x0001
    case readBufferSize                 = 0x0002
    case readLocalSupportedFeatures     = 0x0003
    case setRandomAddress               = 0x0005
    case setAdvertisingParameters       = 0x0006
    case readAdvertisingChannelTXPower  = 0x0007
    case setAdvertisingData             = 0x0008
    case setScanResponseData            = 0x0009
    case setAdvertiseEnable             = 0x000A
    case setScanParameters              = 0x000B
    case setScanEnable                  = 0x000C
    case createConnection               = 0x000D
    case createConnectionCancel         = 0x000E
    case readWhiteListSize              = 0x000F
    case clearWhiteList                 = 0x0010
    case addDeviceToWhiteList           = 0x0011
    case removeDeviceFromWhiteList      = 0x0012
    case connectionUpdate               = 0x0013
    case setHostChannelClassification   = 0x0014
    case readChannelMap                 = 0x0015
    case readRemoteUsedFeatures         = 0x0016
    case encrypt                        = 0x0017
    case random                         = 0x0018
    case startEncryption                = 0x0019
    case ltkReply                       = 0x001A
    case ltkNegativeReply               = 0x001B
    case readSupportedStates            = 0x001C
    case receiverTest                   = 0x001D
    case transmitterTest                = 0x001E
    case testEnd                        = 0x001F
    case addDeviceToResolvedList        = 0x0027
    case removeDeviceFromResolvedList   = 0x0028
    case clearResolvedList              = 0x0029
    case readResolvedListSize           = 0x002A
    case readPeerResolvableAddress      = 0x002B
    case readLocalResolvableAddress     = 0x002C
    case setAddressResolutionEnable     = 0x002D
    case setResolvablePrivateAddressTimeout  = 0x002E
    case readMaximumDataLength          = 0x002F
    case readPhy                        = 0x0030
    case setDefaultPhy                  = 0x0031
    case setPhy                         = 0x0032
    case enhancedReceiverTest           = 0x0033
    case enhancedTransmitterTest           = 0x0034
    case setAdvertisingSetRandomAddress    = 0x0035
}

// MARK: - Name

public extension LowEnergyCommand {
    
    public var name: String {
        
        return type(of: self).names[Int(rawValue)]
    }
    
    private static let names = [
        "Unknown",
        "LE Set Event Mask",
        "LE Read Buffer Size",
        "LE Read Local Supported Features",
        "Unknown",
        "LE Set Random Address",
        "LE Set Advertising Parameters",
        "LE Read Advertising Channel Tx Power",
        "LE Set Advertising Data",
        "LE Set Scan Response Data",
        "LE Set Advertise Enable",
        "LE Set Scan Parameters",
        "LE Set Scan Enable",
        "LE Create Connection",
        "LE Create Connection Cancel",
        "LE Read White List Size",
        "LE Clear White List",
        "LE Add Device To White List",
        "LE Remove Device From White List",
        "LE Connection Update",
        "LE Set Host Channel Classification",
        "LE Read Channel Map",
        "LE Read Remote Used Features",
        "LE Encrypt",
        "LE Rand",
        "LE Start Encryption",
        "LE Long Term Key Request Reply",
        "LE Long Term Key Request Negative Reply",
        "LE Read Supported States",
        "LE Receiver Test",
        "LE Transmitter Test",
        "LE Test End",
        "LE Add Device To Resolved List",
        "LE Remove Device From Resolved List",
        "LE Clear Resolved List",
        "LE Read Resolved List Size",
        "LE Read Peer Resolvable Address",
        "LE Read Local Resolvable Address",
        "LE Set Address Resolution Enable",
        "LE Set Resolvable Private Address Timeout",
        "LE Read Maximum Data Length",
        "LE Read PHY",
        "LE Set Default PHY",
        "LE Set Phy",
        "LE Enhanced Receiver Test",
        "LE Enhanced Transmitter Test",
        "LE Set Advertising Set Random Address Command"
    ]
}
