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
    case setAddressResolutionEnable     = 0x002D
}
