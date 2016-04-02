//
//  LowEnergyCommand.swift
//  BluetoothLinux
//
//  Created by Alsey Coleman Miller on 1/14/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

/// Bluetooth Low Energy Command opcode
public enum LowEnergyCommand: UInt16, HCICommand {
    
    public static let opcodeGroupField = HCIOpcodeGroupField.LowEnergy
    
    case SetEventMask                   = 0x0001
    case ReadBufferSize                 = 0x0002
    case ReadLocalSupportedFeatures     = 0x0003
    case SetRandomAddress               = 0x0005
    case SetAdvertisingParameters       = 0x0006
    case ReadAdvertisingChannelTXPower  = 0x0007
    case SetAdvertisingData             = 0x0008
    case SetScanResponseData            = 0x0009
    case SetAdvertiseEnable             = 0x000A
    case SetScanParameters              = 0x000B
    case SetScanEnable                  = 0x000C
    case CreateConnection               = 0x000D
    case CreateConnectionCancel         = 0x000E
    case ReadWhiteListSize              = 0x000F
    case ClearWhiteList                 = 0x0010
    case AddDeviceToWhiteList           = 0x0011
    case RemoveDeviceFromWhiteList      = 0x0012
    case ConnectionUpdate               = 0x0013
    case SetHostChannelClassification   = 0x0014
    case ReadChannelMap                 = 0x0015
    case ReadRemoteUsedFeatures         = 0x0016
    case Encrypt                        = 0x0017
    case Random                         = 0x0018
    case StartEncryption                = 0x0019
    case LTKReply                       = 0x001A
    case LTKNegativeReply               = 0x001B
    case ReadSupportedStates            = 0x001C
    case ReceiverTest                   = 0x001D
    case TransmitterTest                = 0x001E
    case TestEnd                        = 0x001F
    case AddDeviceToResolvedList        = 0x0027
    case RemoveDeviceFromResolvedList   = 0x0028
    case ClearResolvedList              = 0x0029
    case ReadResolvedListSize           = 0x002A
    case SetAddressResolutionEnable     = 0x002D
}