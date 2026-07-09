//
//  LowEnergyFeature.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 3/29/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

/// LE Feature Support
///
/// The set of features supported by a Link Layer is represented by a bit mask called FeatureSet. The value of FeatureSet shall not change while the Controller has a connection to another device. A peer device may cache information about features that the device supports. The Link Layer may cache information about features that a peer supports during a connection.
/// Within FeatureSet, a bit set to 0 indicates that the Link Layer Feature is not supported in this Controller; a bit set to 1 indicates that the Link Layer Feature is supported in this Controller.
///
/// A Link Layer shall not use a procedure that is not supported by the peer’s Link Layer. A Link Layer shall not transmit a PDU listed in the following subsections unless it supports at least one of the features that requires support for that PDU.
///
/// The bit positions for each Link Layer Feature shall be as shown in Table 4.4. This table also shows if these bits are valid between Controllers. If a bit is shown as not valid, using ‘N’, then this bit shall be ignored upon receipt by the peer Controller.
@frozen
public enum LowEnergyFeature: UInt64, BitMaskOption {

    /// LE Encryption
    case encryption = 0b00000000_00000001

    /// Connection Parameters Request Procedure
    case connectionParametersRequestProcedure = 0b00000000_00000010

    /// Extended Reject Indication
    case extendedRejectIndication = 0b00000000_00000100

    /// Slave-initiated Features Exchange
    case slaveInitiatedFeaturesExchange = 0b00000000_00001000

    /// LE Ping
    case ping = 0b00000000_00010000

    /// LE Data Packet Length Extension
    case dataPacketLengthExtension = 0b00000000_00100000

    /// LE Privacy
    case privacy = 0b00000000_01000000

    /// Extended Scanner Filter Policies
    case extendedScannerFilterPolicies = 0b00000000_10000000

    /// LE 2M PHY
    case le2mPhy = 0b00000001_00000000

    /// Stable Modulation Index - Transmitter
    case stableModulationIndexTransmitter = 0b00000010_00000000

    /// Stable Modulation Index - Receiver
    case stableModulationIndexReceiver = 0b00000100_00000000

    /// LE Coded PHY
    case codedPhy = 0b00001000_00000000

    /// LE Extended Advertising
    case extendedAdvertising = 0b00010000_00000000

    /// LE Periodic Advertising
    case periodicAdvertising = 0b00100000_00000000

    /// Channel Selection Algorithm #2
    case channelSelectionAlgorithm2 = 0b01000000_00000000

    /// LE Power Class 1
    case powerClass1 = 0b10000000_00000000

    /// Minimum Number of Used Channels Procedure
    case minimumNumberofUsedChannelsProcedure = 0b1_00000000_00000000

    /// Connection CTE Request
    case connectionCTERequest = 0x0002_0000

    /// Connection CTE Response
    case connectionCTEResponse = 0x0004_0000

    /// Connectionless CTE Transmitter
    case connectionlessCTETransmitter = 0x0008_0000

    /// Connectionless CTE Receiver
    case connectionlessCTEReceiver = 0x0010_0000

    /// Antenna Switching During CTE Transmission (AoD)
    case antennaSwitchingDuringCTETransmission = 0x0020_0000

    /// Antenna Switching During CTE Reception (AoA)
    case antennaSwitchingDuringCTEReception = 0x0040_0000

    /// Receiving Constant Tone Extensions
    case receivingConstantToneExtensions = 0x0080_0000

    /// Periodic Advertising Sync Transfer - Sender
    case periodicAdvertisingSyncTransferSender = 0x0100_0000

    /// Periodic Advertising Sync Transfer - Recipient
    case periodicAdvertisingSyncTransferRecipient = 0x0200_0000

    /// Sleep Clock Accuracy Updates
    case sleepClockAccuracyUpdates = 0x0400_0000

    /// Remote Public Key Validation
    case remotePublicKeyValidation = 0x0800_0000

    /// Connected Isochronous Stream - Central
    case connectedIsochronousStreamCentral = 0x1000_0000

    /// Connected Isochronous Stream - Peripheral
    case connectedIsochronousStreamPeripheral = 0x2000_0000

    /// Isochronous Broadcaster
    case isochronousBroadcaster = 0x4000_0000

    /// Synchronized Receiver
    case synchronizedReceiver = 0x8000_0000

    /// Connected Isochronous Stream (Host Support)
    case connectedIsochronousStreamHostSupport = 0x0001_0000_0000

    /// LE Power Control Request
    case powerControlRequest = 0x0002_0000_0000

    /// LE Power Change Indication
    case powerChangeIndication = 0x0004_0000_0000

    /// LE Path Loss Monitoring
    case pathLossMonitoring = 0x0008_0000_0000

    /// Periodic Advertising ADI support
    case periodicAdvertisingADISupport = 0x0010_0000_0000

    /// Connection Subrating
    case connectionSubrating = 0x0020_0000_0000

    /// Connection Subrating (Host Support)
    case connectionSubratingHostSupport = 0x0040_0000_0000

    /// Channel Classification
    case channelClassification = 0x0080_0000_0000

    /// Advertising Coding Selection
    case advertisingCodingSelection = 0x0100_0000_0000

    /// Advertising Coding Selection (Host Support)
    case advertisingCodingSelectionHostSupport = 0x0200_0000_0000

    /// Decision-Based Advertising Filtering
    case decisionBasedAdvertisingFiltering = 0x0400_0000_0000

    /// Periodic Advertising with Responses - Advertiser
    case periodicAdvertisingWithResponsesAdvertiser = 0x0800_0000_0000

    /// Periodic Advertising with Responses - Scanner
    case periodicAdvertisingWithResponsesScanner = 0x1000_0000_0000

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
        .minimumNumberofUsedChannelsProcedure,
        .connectionCTERequest,
        .connectionCTEResponse,
        .connectionlessCTETransmitter,
        .connectionlessCTEReceiver,
        .antennaSwitchingDuringCTETransmission,
        .antennaSwitchingDuringCTEReception,
        .receivingConstantToneExtensions,
        .periodicAdvertisingSyncTransferSender,
        .periodicAdvertisingSyncTransferRecipient,
        .sleepClockAccuracyUpdates,
        .remotePublicKeyValidation,
        .connectedIsochronousStreamCentral,
        .connectedIsochronousStreamPeripheral,
        .isochronousBroadcaster,
        .synchronizedReceiver,
        .connectedIsochronousStreamHostSupport,
        .powerControlRequest,
        .powerChangeIndication,
        .pathLossMonitoring,
        .periodicAdvertisingADISupport,
        .connectionSubrating,
        .connectionSubratingHostSupport,
        .channelClassification,
        .advertisingCodingSelection,
        .advertisingCodingSelectionHostSupport,
        .decisionBasedAdvertisingFiltering,
        .periodicAdvertisingWithResponsesAdvertiser,
        .periodicAdvertisingWithResponsesScanner
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

        guard let value = featureSet[self]
        else { fatalError("Invalid enum \(self)") }

        return value
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
    .encryption: (true, "LE Encryption"),
    .connectionParametersRequestProcedure: (true, "Connection Parameters Request Procedure"),
    .extendedRejectIndication: (true, "Extended Reject Indication"),
    .slaveInitiatedFeaturesExchange: (true, "Slave-initiated Features Exchange"),
    .ping: (false, "LE Ping"),
    .dataPacketLengthExtension: (true, "LE Data Packet Length Extension"),
    .privacy: (false, "LL Privacy"),
    .extendedScannerFilterPolicies: (true, "Extended Scanner Filter Policies"),
    .le2mPhy: (true, "LE 2M PHY"),
    .stableModulationIndexTransmitter: (true, "Stable Modulation Index - Transmitter"),
    .stableModulationIndexReceiver: (true, "Stable Modulation Index - Receiver"),
    .codedPhy: (true, "LE Coded PHY"),
    .extendedAdvertising: (false, "LE Extended Advertising"),
    .periodicAdvertising: (false, "LE Periodic Advertising"),
    .channelSelectionAlgorithm2: (true, "Channel Selection Algorithm #2"),
    .powerClass1: (true, "LE Power Class 1"),
    .minimumNumberofUsedChannelsProcedure: (false, "Minimum Number of Used Channels Procedure"),
    .connectionCTERequest: (true, "Connection CTE Request"),
    .connectionCTEResponse: (true, "Connection CTE Response"),
    .connectionlessCTETransmitter: (false, "Connectionless CTE Transmitter"),
    .connectionlessCTEReceiver: (false, "Connectionless CTE Receiver"),
    .antennaSwitchingDuringCTETransmission: (false, "Antenna Switching During CTE Transmission (AoD)"),
    .antennaSwitchingDuringCTEReception: (false, "Antenna Switching During CTE Reception (AoA)"),
    .receivingConstantToneExtensions: (true, "Receiving Constant Tone Extensions"),
    .periodicAdvertisingSyncTransferSender: (true, "Periodic Advertising Sync Transfer - Sender"),
    .periodicAdvertisingSyncTransferRecipient: (true, "Periodic Advertising Sync Transfer - Recipient"),
    .sleepClockAccuracyUpdates: (true, "Sleep Clock Accuracy Updates"),
    .remotePublicKeyValidation: (false, "Remote Public Key Validation"),
    .connectedIsochronousStreamCentral: (true, "Connected Isochronous Stream - Central"),
    .connectedIsochronousStreamPeripheral: (true, "Connected Isochronous Stream - Peripheral"),
    .isochronousBroadcaster: (false, "Isochronous Broadcaster"),
    .synchronizedReceiver: (false, "Synchronized Receiver"),
    .connectedIsochronousStreamHostSupport: (false, "Connected Isochronous Stream (Host Support)"),
    .powerControlRequest: (true, "LE Power Control Request"),
    .powerChangeIndication: (true, "LE Power Change Indication"),
    .pathLossMonitoring: (false, "LE Path Loss Monitoring"),
    .periodicAdvertisingADISupport: (false, "Periodic Advertising ADI support"),
    .connectionSubrating: (true, "Connection Subrating"),
    .connectionSubratingHostSupport: (false, "Connection Subrating (Host Support)"),
    .channelClassification: (true, "Channel Classification"),
    .advertisingCodingSelection: (false, "Advertising Coding Selection"),
    .advertisingCodingSelectionHostSupport: (false, "Advertising Coding Selection (Host Support)"),
    .decisionBasedAdvertisingFiltering: (false, "Decision-Based Advertising Filtering"),
    .periodicAdvertisingWithResponsesAdvertiser: (false, "Periodic Advertising with Responses - Advertiser"),
    .periodicAdvertisingWithResponsesScanner: (false, "Periodic Advertising with Responses - Scanner")
]
// swiftlint:enable colon

// MARK: - Supporting Types

public typealias LowEnergyFeatureSet = BitMaskOptionSet<LowEnergyFeature>
