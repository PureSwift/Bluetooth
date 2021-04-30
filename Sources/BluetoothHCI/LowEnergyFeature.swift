//
//  LowEnergyFeature.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 3/29/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

/**
 LE Feature Support
 
 The set of features supported by a Link Layer is represented by a bit mask called FeatureSet. The value of FeatureSet shall not change while the Controller has a connection to another device. A peer device may cache information about features that the device supports. The Link Layer may cache information about features that a peer supports during a connection.
 Within FeatureSet, a bit set to 0 indicates that the Link Layer Feature is not supported in this Controller; a bit set to 1 indicates that the Link Layer Feature is supported in this Controller.
 
 A Link Layer shall not use a procedure that is not supported by the peer’s Link Layer. A Link Layer shall not transmit a PDU listed in the following subsections unless it supports at least one of the features that requires support for that PDU.

 The bit positions for each Link Layer Feature shall be as shown in Table 4.4. This table also shows if these bits are valid between Controllers. If a bit is shown as not valid, using ‘N’, then this bit shall be ignored upon receipt by the peer Controller.
 */
@frozen
public enum LowEnergyFeature: UInt64, BitMaskOption {
    
    /// LE Encryption
    case encryption                                     = 0b0000000000000001
    
    /// Connection Parameters Request Procedure
    case connectionParametersRequestProcedure           = 0b0000000000000010
    
    /// Extended Reject Indication
    case extendedRejectIndication                       = 0b0000000000000100
    
    /// Slave-initiated Features Exchange
    case slaveInitiatedFeaturesExchange                 = 0b0000000000001000
    
    /// LE Ping
    case ping                                           = 0b0000000000010000
    
    /// LE Data Packet Length Extension
    case dataPacketLengthExtension                      = 0b0000000000100000
    
    /// LE Privacy
    case privacy                                        = 0b0000000001000000
    
    /// Extended Scanner Filter Policies
    case extendedScannerFilterPolicies                  = 0b0000000010000000
    
    /// LE 2M PHY
    case le2mPhy                                        = 0b0000000100000000
    
    /// Stable Modulation Index - Transmitter
    case stableModulationIndexTransmitter               = 0b0000001000000000
    
    /// Stable Modulation Index - Receiver
    case stableModulationIndexReceiver                  = 0b0000010000000000
    
    /// LE Coded PHY
    case codedPhy                                       = 0b0000100000000000
    
    /// LE Extended Advertising
    case extendedAdvertising                            = 0b0001000000000000
    
    /// LE Periodic Advertising
    case periodicAdvertising                            = 0b0010000000000000
    
    /// Channel Selection Algorithm #2
    case channelSelectionAlgorithm2                     = 0b0100000000000000
    
    /// LE Power Class 1
    case powerClass1                                    = 0b1000000000000000
    
    /// Minimum Number of Used Channels Procedure
    case minimumNumberofUsedChannelsProcedure           = 0b10000000000000000
    
    public static let allCases: [LowEnergyFeature] = [
        .encryption,
        .connectionParametersRequestProcedure,
        .extendedRejectIndication,
        .slaveInitiatedFeaturesExchange,
        .ping,
        .dataPacketLengthExtension,
        .privacy,
        .extendedScannerFilterPolicies,
        .le2mPhy,
        .stableModulationIndexTransmitter,
        .stableModulationIndexReceiver,
        .codedPhy,
        .extendedAdvertising,
        .periodicAdvertising,
        .channelSelectionAlgorithm2,
        .powerClass1,
        .minimumNumberofUsedChannelsProcedure
    ]
}

// MARK: - CustomStringConvertible

extension LowEnergyFeature: CustomStringConvertible {
    
    public var description: String {
        
        return name
    }
}

// MARK: - Values

public extension LowEnergyFeature {
    
    /// FeatureSet field’s bit mapping to Controller features
    internal var values: (isValid: Bool, name: String) {
        
        @inline(__always)
        get {
            
            guard let value = featureSet[self]
                else { fatalError("Invalid enum \(self)" ) }
            
            return value
        }
    }
    
    /// Whether the feaure is valid from Controller to Controller.
    var isValidControllerToController: Bool {
        
        return values.isValid
    }
    
    /// Name of LE feature.
    var name: String {
        
        return values.name
    }
}

/// FeatureSet field’s bit mapping to Controller features
internal let featureSet: [LowEnergyFeature: (isValid: Bool, name: String)] = [
    
    // swiftlint:disable colon
    .encryption:                                (true, "LE Encryption"),
    .connectionParametersRequestProcedure:      (true, "Connection Parameters Request Procedure"),
    .extendedRejectIndication:                  (true, "Extended Reject Indication"),
    .slaveInitiatedFeaturesExchange:            (true, "Slave-initiated Features Exchange"),
    .ping:                                      (false, "LE Ping"),
    .dataPacketLengthExtension:                 (true, "LE Data Packet Length Extension"),
    .privacy:                                   (false, "LL Privacy"),
    .extendedScannerFilterPolicies:             (true, "Extended Scanner Filter Policies"),
    .le2mPhy:                                   (true, "LE 2M PHY"),
    .stableModulationIndexTransmitter:          (true, "Stable Modulation Index - Transmitter"),
    .stableModulationIndexReceiver:             (true, "Stable Modulation Index - Receiver"),
    .codedPhy:                                  (true, "LE Coded PHY"),
    .extendedAdvertising:                       (false, "LE Extended Advertising"),
    .periodicAdvertising:                       (false, "LE Periodic Advertising"),
    .channelSelectionAlgorithm2:                (true, "Channel Selection Algorithm #2"),
    .powerClass1:                               (true, "LE Power Class 1"),
    .minimumNumberofUsedChannelsProcedure:      (false, "Minimum Number of Used Channels Procedure")
]
// swiftlint:enable colon

// MARK: - Supporting Types

public typealias LowEnergyFeatureSet = BitMaskOptionSet<LowEnergyFeature>
