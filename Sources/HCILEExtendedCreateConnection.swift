//
//  HCILEExtendedCreateConnection.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {
    
    /// LE Extended Create Connection Command
    ///
    /// The command is used to create a Link Layer connection to a connectable advertiser.
    func lowEnergyExtendedCreateConnection(initialingFilterPolicy: HCILEExtendedCreateConnection.InitialingFilterPolicy,
                                           ownAddressType: HCILEExtendedCreateConnection.OwnAddressType,
                                           peerAddressType: LowEnergyPeerIdentifyAddressType,
                                           peerAddress: Address,
                                           initialingPHY: HCILEExtendedCreateConnection.InitialingPHY,
                                           timeout: HCICommandTimeout = .default) throws -> HCILEEnhancedConnectionComplete {
        
        let parameters = HCILEExtendedCreateConnection(initialingFilterPolicy: initialingFilterPolicy,
                                                                           ownAddressType: ownAddressType,
                                                                           peerAddressType: peerAddressType,
                                                                           peerAddress: peerAddress,
                                                                           initialingPHY: initialingPHY)
        
        let event =  try deviceRequest(parameters,
                                       HCILEEnhancedConnectionComplete.self,
                                       timeout: timeout)
        
        switch event.status {
            
        case let .error(error):
            throw error
            
        case .success:
            
            return event
        }
    }
}

// MARK: - Command

/// LE Extended Create Connection Command
///
/// The command is used to create a Link Layer connection to a connectable advertiser.
public struct HCILEExtendedCreateConnection: HCICommandParameter {
    
    public static let command = HCILowEnergyCommand.extendedCreateConnection // 0x0043
    
    public let initialingFilterPolicy: InitialingFilterPolicy
    public let ownAddressType: OwnAddressType
    public let peerAddressType: LowEnergyPeerIdentifyAddressType
    public let peerAddress: Address
    public let initialingPHY: InitialingPHY
    
    public init(initialingFilterPolicy: InitialingFilterPolicy,
                ownAddressType: OwnAddressType,
                peerAddressType: LowEnergyPeerIdentifyAddressType,
                peerAddress: Address,
                initialingPHY: InitialingPHY) {
        self.initialingFilterPolicy = initialingFilterPolicy
        self.ownAddressType = ownAddressType
        self.peerAddressType = peerAddressType
        self.peerAddress = peerAddress
        self.initialingPHY = initialingPHY
    }
    
    public var data: Data {
        
        let addressBytes = peerAddress.littleEndian.bytes
        
        return Data([initialingFilterPolicy.rawValue,
                     ownAddressType.rawValue,
                     peerAddressType.rawValue,
                     addressBytes.0,
                     addressBytes.1,
                     addressBytes.2,
                     addressBytes.3,
                     addressBytes.4,
                     addressBytes.5
            ])
    }
    
    public enum InitialingFilterPolicy: UInt8 { // Initiating_Filter_Policy
        
        /// White List is not used to determine which advertiser to connect to. Peer_Address_Type and Peer_Address shall be used.
        case whiteListIsNotUsed = 0x00
        
        /// White List is used to determine which advertiser to connect to. Peer_Address_Type and Peer_Address shall be ignored.
        case whiteListIsUsed    = 0x001
    }
    
    public enum OwnAddressType: UInt8 { // Own_Address_Type
        
        /// Public Device Address
        case publicDeviceAddress    = 0x00
        
        /// Random Device Address
        case randomDeviceAddress    = 0x01
        
        /// Controller generates the Resolvable Private Address based on the local IRK from
        // the resolving list. If the resolving list contains no matching entry, then use the public address.
        case resolvablePrivateAddressOrPublicAddress = 0x02
        
        /// Controller generates the Resolvable Private Address based on the local IRK from the resolving list.
        /// If the resolving list contains no matching entry, then use the random address from
        /// the most recent successful LE_Set_Random_Address Command.
        case resolvablePrivateAddressOrRandomAddress = 0x03
    }
    
    public enum InitialingPHYType: UInt8 { // Initiating_PHYs
        
        /// Scan connectable advertisements on the LE 1M PHY. Connection parameters for the LE 1M PHY are provided.
        case le1m  = 0b00
        
        /// Connection parameters for the LE 2M PHY are provided.
        case le2m  = 0b01
        
        /// Scan connectable advertisements on the LE Coded PHY. Connection parameters for the LE Coded PHY are provided.
        case coded = 0b10
    }
    
    public enum InitialingPHY {
        
        case le1m
        
        case le2m(scanInterval: LowEnergyScanInterval,
            scanWindow: LowEnergyScanInterval,
            connIntervalMin: LowEnergyConnectionIntervalRange,
            connLatency: LowEnergyConnectionLatency,
            supervisionTimeout: LowEnergySupervisionTimeout,
            ceLength: CELength)
        
        case coded(scanInterval: (LowEnergyScanInterval, LowEnergyScanInterval),
            scanWindow: (LowEnergyScanInterval, LowEnergyScanInterval),
            connIntervalMin: (LowEnergyConnectionIntervalRange, LowEnergyConnectionIntervalRange),
            connLatency: (LowEnergyConnectionLatency, LowEnergyConnectionLatency),
            supervisionTimeout: (LowEnergySupervisionTimeout, LowEnergySupervisionTimeout),
            ceLength: (CELength, CELength))
        
        public var type: InitialingPHYType {
            
            switch self {
            case .le1m: return .le1m
            case .le2m: return .le2m
            case .coded: return .coded
            }
        }
    }
    
    /// Informative parameter recommending the minimum length of connection event needed for this LE connection.
    ///
    /// Range: 0x0000 – 0xFFFF
    public struct CELength: RawRepresentable, Equatable, Hashable, Comparable {
        
        public static var zero: CELength { return CELength() }
        
        public let rawValue: UInt16
        
        public init() {
            
            self.rawValue = 0
        }
        
        public init?(rawValue: UInt16) {
            
            guard rawValue <= 0xFFFF
                else { return nil }
            
            self.rawValue = rawValue
        }
        
        // Equatable
        public static func == (lhs: CELength, rhs: CELength) -> Bool {
            
            return lhs.rawValue == rhs.rawValue
        }
        
        // Hashable
        public var hashValue: Int {
            
            return Int(rawValue)
        }
        
        // Comparable
        public static func < (lhs: CELength, rhs: CELength) -> Bool {
            
            return lhs.rawValue < rhs.rawValue
        }
    }
}
