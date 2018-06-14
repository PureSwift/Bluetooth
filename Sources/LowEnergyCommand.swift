//
//  HCILowEnergyCommand.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 1/14/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

/// Bluetooth Low Energy Command opcode
public enum HCILowEnergyCommand: UInt16, HCICommand {
    
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
    
    /// LE Remote Connection Parameter Request Reply
    case remoteConnectionParameterRequestReply = 0x0020
    
    /// LE Remote Connection Parameter Request Negative Reply Command
    case remoteConnectionParameterRequestNegativeReply = 0x0021
    
    /// LE Set Data Length Command
    case setDataLengthCommand   = 0x0022
    
    /// LE Read Suggested Default Data Length Command
    case readSuggestedDefaultDataLengthCommand = 0x0023
    
    /// LE Write Suggested Default Data Length Command
    case writeSuggestedDefaultDataLengthCommand = 0x0024
    
    /// LE Read Local P-256 Public Key Command
    case readLocalP256PublicKeyCommand  = 0x0025
    
    /// LE Generate DHKey Command
    case generateDHKeyCommand           = 0x0026
    
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
    case readMaximumAdvertisingDataLength       = 0x003A
    
    /// LE Read Number of Supported Advertising Sets Command
    case readNumberOfSupportedAdvertisingSets   = 0x003B
    
    /// LE Remove Advertising Set Command
    case removeAdvertisingSet                   = 0x003C
    
    /// LE Clear Advertising Sets Command
    case clearAdvertisingSets                   = 0x003D
    
    /// LE Set Periodic Advertising Parameters Command
    case setPeriodicAdvertisingParameters       = 0x003E
    
    /// LE Set Periodic Advertising Data Command
    case setPeriodicAdvertisingData             = 0x003F
    
    /// LE Set Extended Advertising Enable Command
    case setExtendedAdvertisingEnable           = 0x0039
    
    /// LE Set Periodic Advertising Enable Command
    case setPeriodicAdvertisingEnable           = 0x0040
    
    /// LE Set Extended Scan Parameters Command
    case setExtendedScanParameters              = 0x0041
    
    /// LE Set Extended Scan Enable Command
    case setExtendedScanEnable                  = 0x0042
    
    /// LE Extended Create Connection Command
    case extendedCreateConnection               = 0x0043
    
    /// LE Periodic Advertising Create Sync Command
    case periodicAdvertisingCreateSync          = 0x0044
    
    /// LE Periodic Advertising Create Sync Cancel Command
    case periodicAdvertisingCreateSyncCancel    = 0x0045
    
    /// LE Periodic Advertising Terminate Sync Command
    case periodicAdvertisingTerminateSync       = 0x0046
    
    /// LE Add Device To Periodic Advertiser List Command
    case addDeviceToPeriodicAdvertiserList      = 0x0047
    
    /// LE Remove Device From Periodic Advertiser List Command
    case removeDeviceFromPeriodicAdvertiserList = 0x0048
    
    /// LE Clear Periodic Advertiser List Command
    case clearPeriodicAdvertiserList            = 0x0049
    
    /// LE Read Periodic Advertiser List Size Command
    case readPeriodicAdvertiserListSize         = 0x004A
    
    /// LE Read Transmit Power Command
    case readTransmitPower                      = 0x004B
    
    /// LE Read RF Path Compensation Command
    case readRFPathCompensation                 = 0x004C
    
    /// LE Write RF Path Compensation Command
    case writeRFPathCompensation                = 0x004D
    
    /// LE Set Privacy Mode Command
    case setPrivacyMode                         = 0x004E
}

// MARK: - Name

public extension HCILowEnergyCommand {
    
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
        case .setExtendedAdvertisingEnable: return "LE Set Extended Advertising Enable Command"
        case .setPeriodicAdvertisingParameters: return "LE Set Periodic Advertising Parameters Command"
        case .setPeriodicAdvertisingData: return "LE Set Periodic Advertising Data Command"
        case .setPeriodicAdvertisingEnable: return "LE Set Periodic Advertising Enable Command"
        case .setExtendedScanParameters: return "LE Set Extended Scan Parameters Command"
        case .setExtendedScanEnable: return "LE Set Extended Scan Enable Command"
        case .extendedCreateConnection: return "LE Extended Create Connection Command"
        case .periodicAdvertisingCreateSync: return "LE Periodic Advertising Create Sync Command"
        case .periodicAdvertisingCreateSyncCancel: return "LE Periodic Advertising Create Sync Cancel Command"
        case .periodicAdvertisingTerminateSync: return "LE Periodic Advertising Terminate Sync Command"
        case .addDeviceToPeriodicAdvertiserList: return "LE Add Device To Periodic Advertiser List Command"
        case .removeDeviceFromPeriodicAdvertiserList: return "LE Remove Device From Periodic Advertiser List Command"
        case .clearPeriodicAdvertiserList: return "LE Clear Periodic Advertiser List Command"
        case .readPeriodicAdvertiserListSize: return "LE Read Periodic Advertiser List Size Command"
        case .readTransmitPower: return "LE Read Transmit Power Command"
        case .readRFPathCompensation: return "LE Read RF Path Compensation Command"
        case .writeRFPathCompensation: return "LE Write RF Path Compensation Command"
        case .setPrivacyMode: return "LE Set Privacy Mode Command"
        case .remoteConnectionParameterRequestReply: return "LE Remote Connection Parameter Request Reply"
        case .remoteConnectionParameterRequestNegativeReply: return "LE Remote Connection Parameter Request Negative Reply Command"
        case .setDataLengthCommand: return "LE Set Data Length Command"
        case .readSuggestedDefaultDataLengthCommand: return "LE Read Suggested Default Data Length Command"
        case .readLocalP256PublicKeyCommand: return "LE Read Local P-256 Public Key Command"
        case .writeSuggestedDefaultDataLengthCommand: return "LE Write Suggested Default Data Length Command"
        case .generateDHKeyCommand : return "LE Generate DHKey Command"
        }
    }
}
