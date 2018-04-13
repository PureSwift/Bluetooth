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
    
    /// LE Set Event Mask
    case setEventMask                   = 0x0001
    
    /// LE Read Buffer Size
    case readBufferSize                 = 0x0002
    
    /// LE Read Local Supported Features
    case readLocalSupportedFeatures     = 0x0003
    
    /// LE Set Random Address
    case setRandomAddress               = 0x0005
    
    /// LE Set Advertising Parameters
    case setAdvertisingParameters       = 0x0006
    
    /// LE Read Advertising Channel Tx Power
    case readAdvertisingChannelTXPower  = 0x0007
    
    /// LE Set Advertising Data
    case setAdvertisingData             = 0x0008
    
    /// LE Set Scan Response Data
    case setScanResponseData            = 0x0009
    
    /// LE Set Advertise Enable
    case setAdvertiseEnable             = 0x000A
    
    /// LE Set Scan Parameters
    case setScanParameters              = 0x000B
    
    /// LE Set Scan Enable
    case setScanEnable                  = 0x000C
    
    /// LE Create Connection
    case createConnection               = 0x000D
    
    /// LE Create Connection Cancel
    case createConnectionCancel         = 0x000E
    
    /// LE Read White List Size
    case readWhiteListSize              = 0x000F
    
    /// LE Clear White List
    case clearWhiteList                 = 0x0010
    
    /// LE Add Device To White List
    case addDeviceToWhiteList           = 0x0011
    
    /// LE Remove Device From White List
    case removeDeviceFromWhiteList      = 0x0012
    
    /// LE Connection Update
    case connectionUpdate               = 0x0013
    
    /// LE Set Host Channel Classification
    case setHostChannelClassification   = 0x0014
    
    /// LE Read Channel Map
    case readChannelMap                 = 0x0015
    
    /// LE Read Remote Used Features
    case readRemoteUsedFeatures         = 0x0016
    
    /// LE Encrypt
    case encrypt                        = 0x0017
    
    /// LE Rand
    case random                         = 0x0018
    
    /// LE Start Encryption
    case startEncryption                = 0x0019
    
    /// LE Long Term Key Request Reply
    case longTermKeyReply               = 0x001A
    
    /// LE Long Term Key Request Negative Reply
    case longTermKeyNegativeReply       = 0x001B
    
    /// LE Read Supported States
    case readSupportedStates            = 0x001C
    
    /// LE Receiver Test
    case receiverTest                   = 0x001D
    
    /// LE Transmitter Test
    case transmitterTest                = 0x001E
    
    /// LE Test End
    case testEnd                        = 0x001F
    
    /// LE Add Device To Resolved List
    case addDeviceToResolvedList        = 0x0027
    
    /// LE Remove Device From Resolved List
    case removeDeviceFromResolvedList   = 0x0028
    
    /// LE Clear Resolved List
    case clearResolvedList              = 0x0029
    
    /// LE Read Resolved List Size
    case readResolvedListSize           = 0x002A
    
    /// LE Read Peer Resolvable Address
    case readPeerResolvableAddress      = 0x002B
    
    /// LE Read Local Resolvable Address
    case readLocalResolvableAddress     = 0x002C
    
    /// LE Set Address Resolution Enable
    case setAddressResolutionEnable     = 0x002D
    
    /// LE Set Resolvable Private Address Timeout
    case setResolvablePrivateAddressTimeout = 0x002E
    
    /// LE Read Maximum Data Length
    case readMaximumDataLength          = 0x002F
    
    /// LE Read PHY
    case readPhy                        = 0x0030
    
    /// LE Set Default PHY
    case setDefaultPhy                  = 0x0031
    
    /// LE Set Phy
    case setPhy                         = 0x0032
    
    /// LE Enhanced Receiver Test
    case enhancedReceiverTest           = 0x0033
    
    /// LE Enhanced Transmitter Test
    case enhancedTransmitterTest           = 0x0034
    
    /// LE Set Advertising Set Random Address
    case setAdvertisingSetRandomAddress    = 0x0035
    
    /// LE Set Extended Advertising Parameters
    case setExtendedAdvertisingParameters  = 0x0036
    
    /// LE Set Extended Advertising Data
    case setExtendedAdvertisingData        = 0x0037
    
    /// LE Set Extended Scan Response Data
    case setExtendedScanResponseData       = 0x0038
    
    /// LE Read Maximum Advertising Data Length Command
    case readMaximumAdvertisingDataLength  = 0x003A
    
    /// LE Read Number of Supported Advertising Sets Command
    case readNumberOfSupportedAdvertisingSets  = 0x003B
    
    /// LE Remove Advertising Set Command
    case removeAdvertisingSet  = 0x003C
    
    /// LE Clear Advertising Sets Command
    case clearAdvertisingSets  = 0x003D
    
    /// LE Set Periodic Advertising Parameters Command
    case setPeriodicAdvertisingParameters = 0x003E
    
    /// LE Set Periodic Advertising Data Command
    case setPeriodicAdvertisingDataCommand = 0x003F
}

// MARK: - Name

public extension LowEnergyCommand {
    
    public var name: String {
        
        switch self {
            
        case .setEventMask: return "LE Set Event Mask"
        case .readBufferSize: return "LE Read Buffer Size"
        case .readLocalSupportedFeatures: return "LE Read Local Supported Features"
        case .setRandomAddress: return "LE Set Random Address"
        case .setAdvertisingParameters: return "LE Set Advertising Parameters"
        case .readAdvertisingChannelTXPower: return "LE Read Advertising Channel Tx Power"
        case .setAdvertisingData: return "LE Set Advertising Data"
        case .setScanResponseData: return "LE Set Scan Response Data"
        case .setAdvertiseEnable: return "LE Set Advertise Enable"
        case .setScanParameters: return "LE Set Scan Parameters"
        case .setScanEnable: return "LE Set Scan Enable"
        case .createConnection: return "LE Create Connection"
        case .createConnectionCancel: return "LE Create Connection Cancel"
        case .readWhiteListSize: return "LE Read White List Size"
        case .clearWhiteList: return "LE Clear White List"
        case .addDeviceToWhiteList: return "LE Add Device To White List"
        case .removeDeviceFromWhiteList: return "LE Remove Device From White List"
        case .connectionUpdate: return "LE Connection Update"
        case .setHostChannelClassification: return "LE Set Host Channel Classification"
        case .readChannelMap: return "LE Read Channel Map"
        case .readRemoteUsedFeatures: return "LE Read Remote Used Features"
        case .encrypt: return "LE Encrypt"
        case .random: return "LE Rand"
        case .startEncryption: return "LE Start Encryption"
        case .longTermKeyReply: return "LE Long Term Key Request Reply"
        case .longTermKeyNegativeReply: return "LE Long Term Key Request Negative Reply"
        case .readSupportedStates: return "LE Read Supported States"
        case .receiverTest: return "LE Receiver Test"
        case .transmitterTest: return "LE Transmitter Test"
        case .testEnd: return "LE Test End"
        case .addDeviceToResolvedList: return "LE Add Device To Resolved List"
        case .removeDeviceFromResolvedList: return "LE Remove Device From Resolved List"
        case .clearResolvedList: return "LE Clear Resolved List"
        case .readResolvedListSize: return "LE Read Resolved List Size"
        case .readPeerResolvableAddress: return "LE Read Peer Resolvable Address"
        case .readLocalResolvableAddress: return "LE Read Local Resolvable Address"
        case .setAddressResolutionEnable: return "LE Set Address Resolution Enable"
        case .setResolvablePrivateAddressTimeout: return "LE Set Resolvable Private Address Timeout"
        case .readMaximumDataLength: return "LE Read Maximum Data Length"
        case .readPhy: return "LE Read PHY"
        case .setDefaultPhy: return "LE Set Default PHY"
        case .setPhy: return "LE Set Phy"
        case .enhancedReceiverTest: return "LE Enhanced Receiver Test"
        case .enhancedTransmitterTest: return "LE Enhanced Transmitter Test"
        case .setAdvertisingSetRandomAddress: return "LE Set Advertising Set Random Address"
        case .setExtendedAdvertisingParameters: return "LE Set Extended Advertising Parameters"
        case .setExtendedAdvertisingData: return "LE Set Extended Advertising Data"
        case .setExtendedScanResponseData: return "LE Set Extended Scan Response Data"
        case .readMaximumAdvertisingDataLength: return "LE Read Maximum Advertising Data Length Command"
        case .readNumberOfSupportedAdvertisingSets: return "LE Read Number of Supported Advertising Sets Command"
        case .removeAdvertisingSet: return "LE Remove Advertising Set Command"
        case .clearAdvertisingSets: return "LE Clear Advertising Sets Command"
        case .setPeriodicAdvertisingParameters: return "LE Set Periodic Advertising Parameters Command"
        case .setPeriodicAdvertisingDataCommand: return "LE Set Periodic Advertising Data Command"
        }
    }
}
