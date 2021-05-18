//
//  HCILESetExtendedAdvertisingParameters.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {
    
    /// LE Set Extended Advertising Parameters Command
    ///
    /// The command is used by the Host to set the advertising parameters.
    func setExtendedAdvertisingParameters(_ parameters: HCILESetExtendedAdvertisingParameters,
                                          timeout: HCICommandTimeout = .default) throws -> LowEnergyTxPower {
        
        let returnParameter = try deviceRequest(parameters, HCILESetExtendedAdvertisingParametersReturn.self, timeout: timeout)
        
        return returnParameter.selectedTxPower
    }
}

// MARK: - Command

/// LE Set Extended Advertising Parameters Command
///
/// The command is used by the Host to set the advertising parameters.
@frozen
public struct HCILESetExtendedAdvertisingParameters: HCICommandParameter { //HCI_LE_Set_ Extended_ Advertising_ Parameters
    
    public static let command = HCILowEnergyCommand.setAdvertisingSetRandomAddress //0x0036
    
    /// Used to identify an advertising set
    public let advertisingHandle: UInt8 //Advertising_Handle
    
    /// The Advertising_Event_Properties parameter describes the type of advertising event that is being configured
    /// and its basic properties.
    public let advertisingEventProperties: AdvertisingEventProperties //Advertising_Event_Properties
    
    /// The Primary_Advertising_Interval_Min parameter shall be less than or equal to the Primary_Advertising_Interval_Max parameter.
    /// The Primary_Advertising_Interval_Min and Primary_Advertising_Interval_Max parameters should not be the same value
    /// so that the Controller can choose the best advertising interval given other activities.
    ///
    /// For high duty cycle connectable directed advertising event type (ADV_DIRECT_IND),
    /// the Primary_Advertising_Interval_Min and Primary_Advertising_Interval_Max parameters are not used and shall be ignored.
    ///
    /// If the primary advertising interval range provided by the Host (Primary_Advertising_Interval_Min,
    /// Primary_Advertising_Interval_Max) is outside the advertising interval range supported by the Controller,
    //// then the Controller shall return the error code Unsupported Feature or Parameter Value (0x11).
    public let primaryAdvertising: PrimaryAdvertisingInterval
    
    /// The Primary_Advertising_Channel_Map is a bit field that indicates the advertising channels that shall be used
    /// when transmitting advertising packets. At least one channel bit shall be set in the Primary_Advertising_Channel_Map parameter.
    public let primaryAdvertisingChannelMap: PrimaryAdvertisingChannelMap
    
    /// The Own_Address_Type parameter specifies the type of address being used in the advertising packets.
    /// For random addresses, the address is specified by the LE_Set_Advertising_Set_Random_Address command.
    ///
    /// If Own_Address_Type equals 0x02 or 0x03, the Peer_Address parameter contains the peer’s Identity Address
    /// and the Peer_Address_Type parameter contains the peer’s Identity Type (i.e., 0x00 or 0x01). These parameters are
    /// used to locate the corresponding local IRK in the resolving list; this IRK is used to generate their own address
    /// used in the advertisement.
    public let ownAddressType: OwnAddressType //Own_Address_Type
    
    public let peerAddressType: PeerAddressType //Peer_Address_Type
    
    public let peerAddress: BluetoothAddress // Peer_Address
    
    public let advertisingFilterPolicy: AdvertisingFilterPolicy //Advertising_Filter_Policy
    
    public let advertisingTxPower: LowEnergyTxPower //Advertising_Tx_Power
    
    public let primaryAdvertisingPhy: PrimaryAdvertisingPhy
    
    /// The Secondary_Advertising_Max_Skip parameter is the maximum number of advertising events that
    /// can be skipped before the AUX_ADV_IND can be sent.
    public let secondaryAdvertisingMaxSkip: UInt8
    
    public let secondaryAdvertisingPhy: SecondaryAdvertisingPhy
    
    public let advertisingSid: UInt8
    
    public let scanRequestNotificationEnable: ScanRequestNotificationEnable
    
    public init(advertisingHandle: UInt8,
                advertisingEventProperties: AdvertisingEventProperties,
                primaryAdvertising: PrimaryAdvertisingInterval,
                primaryAdvertisingChannelMap: PrimaryAdvertisingChannelMap,
                ownAddressType: OwnAddressType,
                peerAddressType: PeerAddressType,
                peerAddress: BluetoothAddress,
                advertisingFilterPolicy: AdvertisingFilterPolicy,
                advertisingTxPower: LowEnergyTxPower,
                primaryAdvertisingPhy: PrimaryAdvertisingPhy,
                secondaryAdvertisingMaxSkip: UInt8,
                secondaryAdvertisingPhy: SecondaryAdvertisingPhy,
                advertisingSid: UInt8,
                scanRequestNotificationEnable: ScanRequestNotificationEnable) {
        
        self.advertisingHandle = advertisingHandle
        self.advertisingEventProperties = advertisingEventProperties
        self.primaryAdvertising = primaryAdvertising
        self.primaryAdvertisingChannelMap = primaryAdvertisingChannelMap
        self.ownAddressType = ownAddressType
        self.peerAddressType = peerAddressType
        self.peerAddress = peerAddress
        self.advertisingFilterPolicy = advertisingFilterPolicy
        self.advertisingTxPower = advertisingTxPower
        self.primaryAdvertisingPhy = primaryAdvertisingPhy
        self.secondaryAdvertisingMaxSkip = secondaryAdvertisingMaxSkip
        self.secondaryAdvertisingPhy = secondaryAdvertisingPhy
        self.advertisingSid = advertisingSid
        self.scanRequestNotificationEnable = scanRequestNotificationEnable
    }
    
    public var data: Data {
        
        let advertisingEventPropertiesBytes = advertisingEventProperties.rawValue.littleEndian.bytes
        
        let primaryAdvertisingMinimumBytes = primaryAdvertising.rawValue.lowerBound.littleEndian.bytes
        let primaryAdvertisingMaximunBytes = primaryAdvertising.rawValue.upperBound.littleEndian.bytes
        
        let addressBytes = peerAddress.littleEndian.bytes
        
        let advertisingTxPowerByte = UInt8.init(bitPattern: advertisingTxPower.rawValue)
        
        return Data([advertisingHandle,
                     advertisingEventPropertiesBytes.0,
                     advertisingEventPropertiesBytes.1,
                     primaryAdvertisingMinimumBytes.0,
                     primaryAdvertisingMinimumBytes.1,
                     primaryAdvertisingMinimumBytes.2,
                     primaryAdvertisingMaximunBytes.0,
                     primaryAdvertisingMaximunBytes.1,
                     primaryAdvertisingMaximunBytes.2,
                     primaryAdvertisingChannelMap.rawValue,
                     ownAddressType.rawValue,
                     peerAddressType.rawValue,
                     addressBytes.0,
                     addressBytes.1,
                     addressBytes.2,
                     addressBytes.3,
                     addressBytes.4,
                     addressBytes.5,
                     advertisingFilterPolicy.rawValue,
                     advertisingTxPowerByte,
                     primaryAdvertisingPhy.rawValue,
                     secondaryAdvertisingMaxSkip,
                     secondaryAdvertisingPhy.rawValue,
                     advertisingSid,
                     scanRequestNotificationEnable.rawValue
            ])
    }
    
    /// The Scan_Request_Notification_Enable parameter indicates whether the Controller shall send
    /// notifications upon the receipt of a scan request PDU that is in response to an advertisement from
    /// the specified advertising set that contains its device address and is from a scanner that is allowed
    /// by the advertising filter policy.
    ///
    /// If the Host issues this command when advertising is enabled for the specified advertising set,
    /// the Controller shall return the error code Command Disallowed (0x0C).
    ///
    /// If periodic advertising is enabled for the advertising set and the Secondary_Advertising_PHY parameter
    /// does not specify the PHY currently being used for the periodic advertising, the Controller shall
    /// return the error code Command Disallowed (0x0C).
    ///
    /// If the Advertising_Handle does not identify an existing advertising set and the Controller is unable
    /// to support a new advertising set at present, the Controller shall return the error code Memory
    /// Capacity Exceeded (0x07).
    public enum ScanRequestNotificationEnable: UInt8 {
        
        /// Scan request notifications disabled
        case disabled       = 0x00
        
        /// Scan request notifications enabled
        case enabled        = 0x01
    }
    
    /// The Secondary_Advertising_PHY parameter indicates the PHY on which
    /// the advertising packets are be transmitted on the secondary advertising channel.
    public enum SecondaryAdvertisingPhy: UInt8 {
        
        /// Secondary advertisement PHY is LE 1M
        case le1M       = 0x01
        
        /// Secondary advertisement PHY is LE 2M
        case le2M       = 0x02
        
        /// Secondary advertisement PHY is LE Coded
        case leCoded    = 0x03
    }
    
    /// The Primary_Advertising_PHY parameter indicates the PHY on which the advertising packets
    /// are transmitted on the primary advertising channel. If legacy advertising PDUs are being used,
    /// the Primary_Advertising_PHY shall indicate the LE 1M PHY.
    public enum PrimaryAdvertisingPhy: UInt8 {
        
        /// Primary advertisement PHY is LE 1M
        case le1M       = 0x01
        
        /// Primary advertisement PHY is LE Coded
        case leCoded    = 0x03
    }
    
    public enum AdvertisingFilterPolicy: UInt8 {
        
        /// Process scan and connection requests from all devices (i.e., the White List is not in use)
        case processScanFromAllDevices = 0x00
        
        /// Process connection requests from all devices and only scan requests from devices that are in the White List
        case processConnectionRequest = 0x01
        
        /// Process scan requests from all devices and only connection requests from devices that are in the White List.
        case procesScanRequest = 0x02
        
        /// Process scan and connection requests only from devices in the White List.
        case processScanFromDevicesInWhiteList = 0x03
    }
    
    public enum PeerAddressType: UInt8 {
        
        /// Public Device Address or Public Identity Address
        case publicDeviceAddress = 0x00
        
        /// Random Device Address or Random (static) Identity Address
        case randomDeviceAddress = 0x01
    }
    
    public enum OwnAddressType: UInt8 {
        
        /// Public Device Address
        case publicDeviceAddress = 0x00
        
        /// Random Device Address
        case randomDeviceAddress = 0x01
        
        /// Controller generates the Resolvable Private Address based on the local IRK from the resolving list.
        /// If the resolving list contains no matching entry, use the public address.
        case usePublicAddressIfNoMatching = 0x02
        
        /// Controller generates the Resolvable Private Address based on the local IRK from the resolving list.
        /// If the resolving list contains no matching entry, use the random address from LE_Set_Advertising_Set_Ran- dom_Address.
        case useRandomAddressIfNoMatching = 0x03
    }
    
    /// The Primary_Advertising_Channel_Map is a bit field that indicates the advertising channels that shall be used
    /// when transmitting advertising packets. At least one channel bit shall be set in the Primary_Advertising_Channel_Map parameter.
    public enum PrimaryAdvertisingChannelMap: UInt8, BitMaskOption {
        
        /// Channel 37 shall be used
        case channel37 = 0b1
        
        /// Channel 38 shall be used
        case channel38 = 0b10
        
        /// Channel 39 shall be used
        case channel39 = 0b100
        
        public static let allCases: [PrimaryAdvertisingChannelMap] = [
            .channel37,
            .channel38,
            .channel39
        ]
    }
    
    public struct PrimaryAdvertisingInterval: RawRepresentable, Equatable {
        
        public typealias RawValue = CountableClosedRange<UInt32>
        
        /// Maximum interval range.
        public static let full = PrimaryAdvertisingInterval(rawValue: .min ... .max)
        
        public let rawValue: RawValue
        
        public init(rawValue: RawValue) {
            
            self.rawValue = rawValue
        }
        
        /// Time = N * 0.625 msec.
        public var miliseconds: ClosedRange<Double> {
            
            let miliseconds = Double(0.625)
            
            let min = Double(rawValue.lowerBound) * miliseconds
            
            let max = Double(rawValue.upperBound) * miliseconds
            
            return min ... max
        }
        
        // Equatable
        public static func == (lhs: PrimaryAdvertisingInterval, rhs: PrimaryAdvertisingInterval) -> Bool {
            
            return lhs.rawValue == rhs.rawValue
        }
    }
    
    /// The Advertising_Event_Properties parameter describes the type of advertising event that is being configured
    /// and its basic properties.
    public enum AdvertisingEventProperties: UInt16, BitMaskOption {
        
        /// Connectable advertising
        case connectableAdvertising                         = 0b1
        
        /// Scannable advertising
        case scannableAdvertising                           = 0b10
        
        /// Directed advertising
        case directedAdvertising                            = 0b100
        
        /// High Duty Cycle Directed Connectable advertising (≤ 3.75 ms Advertis- ing Interval)
        case highDutyCycleDirectedConnectableAdvertising    = 0b1000
        
        /// Use legacy advertising PDUs
        case useLegacyAdvertisingPDUs                       = 0b10000
        
        /// Omit advertiser's address from all PDUs ("anonymous advertising")
        case omitAdvertisingAddress                         = 0b100000
        
        /// Include TxPower in the extended header of the advertising PDU
        case includeTxPower                                 = 0b1000000
        
        public static let allCases: [HCILESetExtendedAdvertisingParameters.AdvertisingEventProperties] = [
            .connectableAdvertising,
            .scannableAdvertising,
            .directedAdvertising,
            .highDutyCycleDirectedConnectableAdvertising,
            .useLegacyAdvertisingPDUs,
            .omitAdvertisingAddress,
            .includeTxPower
        ]
    }
}

// MARK: - Return Parameter

/// LE Set Extended Advertising Parameters Command
///
/// The command is used by the Host to set the advertising parameters.
@frozen
public struct HCILESetExtendedAdvertisingParametersReturn: HCICommandReturnParameter {
    
    public static let command = HCILowEnergyCommand.setExtendedAdvertisingParameters //0x0036
    
    public static let length: Int = 1
    
    public let selectedTxPower: LowEnergyTxPower
    
    public init?(data: Data) {
        guard data.count == type(of: self).length
            else { return nil }
        
        guard let selectedTxPower = LowEnergyTxPower(rawValue: Int8(bitPattern: data[0]))
            else { return nil }
        
        self.selectedTxPower = selectedTxPower
    }
}
