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
public struct LowEnergyFeature: OptionSet, Hashable, Sendable, CaseIterable {

    public let rawValue: UInt64

    public init(rawValue: UInt64) {
        self.rawValue = rawValue
    }

    /// LE Encryption
    public static let encryption = LowEnergyFeature(rawValue: 0b00000000_00000001)

    /// Connection Parameters Request Procedure
    public static let connectionParametersRequestProcedure = LowEnergyFeature(rawValue: 0b00000000_00000010)

    /// Extended Reject Indication
    public static let extendedRejectIndication = LowEnergyFeature(rawValue: 0b00000000_00000100)

    /// Slave-initiated Features Exchange
    public static let slaveInitiatedFeaturesExchange = LowEnergyFeature(rawValue: 0b00000000_00001000)

    /// LE Ping
    public static let ping = LowEnergyFeature(rawValue: 0b00000000_00010000)

    /// LE Data Packet Length Extension
    public static let dataPacketLengthExtension = LowEnergyFeature(rawValue: 0b00000000_00100000)

    /// LE Privacy
    public static let privacy = LowEnergyFeature(rawValue: 0b00000000_01000000)

    /// Extended Scanner Filter Policies
    public static let extendedScannerFilterPolicies = LowEnergyFeature(rawValue: 0b00000000_10000000)

    /// LE 2M PHY
    public static let le2mPhy = LowEnergyFeature(rawValue: 0b00000001_00000000)

    /// Stable Modulation Index - Transmitter
    public static let stableModulationIndexTransmitter = LowEnergyFeature(rawValue: 0b00000010_00000000)

    /// Stable Modulation Index - Receiver
    public static let stableModulationIndexReceiver = LowEnergyFeature(rawValue: 0b00000100_00000000)

    /// LE Coded PHY
    public static let codedPhy = LowEnergyFeature(rawValue: 0b00001000_00000000)

    /// LE Extended Advertising
    public static let extendedAdvertising = LowEnergyFeature(rawValue: 0b00010000_00000000)

    /// LE Periodic Advertising
    public static let periodicAdvertising = LowEnergyFeature(rawValue: 0b00100000_00000000)

    /// Channel Selection Algorithm #2
    public static let channelSelectionAlgorithm2 = LowEnergyFeature(rawValue: 0b01000000_00000000)

    /// LE Power Class 1
    public static let powerClass1 = LowEnergyFeature(rawValue: 0b10000000_00000000)

    /// Minimum Number of Used Channels Procedure
    public static let minimumNumberofUsedChannelsProcedure = LowEnergyFeature(rawValue: 0b1_00000000_00000000)

    /// Connection CTE Request
    public static let connectionCTERequest = LowEnergyFeature(rawValue: 0x0002_0000)

    /// Connection CTE Response
    public static let connectionCTEResponse = LowEnergyFeature(rawValue: 0x0004_0000)

    /// Connectionless CTE Transmitter
    public static let connectionlessCTETransmitter = LowEnergyFeature(rawValue: 0x0008_0000)

    /// Connectionless CTE Receiver
    public static let connectionlessCTEReceiver = LowEnergyFeature(rawValue: 0x0010_0000)

    /// Antenna Switching During CTE Transmission (AoD)
    public static let antennaSwitchingDuringCTETransmission = LowEnergyFeature(rawValue: 0x0020_0000)

    /// Antenna Switching During CTE Reception (AoA)
    public static let antennaSwitchingDuringCTEReception = LowEnergyFeature(rawValue: 0x0040_0000)

    /// Receiving Constant Tone Extensions
    public static let receivingConstantToneExtensions = LowEnergyFeature(rawValue: 0x0080_0000)

    /// Periodic Advertising Sync Transfer - Sender
    public static let periodicAdvertisingSyncTransferSender = LowEnergyFeature(rawValue: 0x0100_0000)

    /// Periodic Advertising Sync Transfer - Recipient
    public static let periodicAdvertisingSyncTransferRecipient = LowEnergyFeature(rawValue: 0x0200_0000)

    /// Sleep Clock Accuracy Updates
    public static let sleepClockAccuracyUpdates = LowEnergyFeature(rawValue: 0x0400_0000)

    /// Remote Public Key Validation
    public static let remotePublicKeyValidation = LowEnergyFeature(rawValue: 0x0800_0000)

    /// Connected Isochronous Stream - Central
    public static let connectedIsochronousStreamCentral = LowEnergyFeature(rawValue: 0x1000_0000)

    /// Connected Isochronous Stream - Peripheral
    public static let connectedIsochronousStreamPeripheral = LowEnergyFeature(rawValue: 0x2000_0000)

    /// Isochronous Broadcaster
    public static let isochronousBroadcaster = LowEnergyFeature(rawValue: 0x4000_0000)

    /// Synchronized Receiver
    public static let synchronizedReceiver = LowEnergyFeature(rawValue: 0x8000_0000)

    /// Connected Isochronous Stream (Host Support)
    public static let connectedIsochronousStreamHostSupport = LowEnergyFeature(rawValue: 0x0001_0000_0000)

    /// LE Power Control Request
    public static let powerControlRequest = LowEnergyFeature(rawValue: 0x0002_0000_0000)

    /// LE Power Change Indication
    public static let powerChangeIndication = LowEnergyFeature(rawValue: 0x0004_0000_0000)

    /// LE Path Loss Monitoring
    public static let pathLossMonitoring = LowEnergyFeature(rawValue: 0x0008_0000_0000)

    /// Periodic Advertising ADI support
    public static let periodicAdvertisingADISupport = LowEnergyFeature(rawValue: 0x0010_0000_0000)

    /// Connection Subrating
    public static let connectionSubrating = LowEnergyFeature(rawValue: 0x0020_0000_0000)

    /// Connection Subrating (Host Support)
    public static let connectionSubratingHostSupport = LowEnergyFeature(rawValue: 0x0040_0000_0000)

    /// Channel Classification
    public static let channelClassification = LowEnergyFeature(rawValue: 0x0080_0000_0000)

    /// Advertising Coding Selection
    public static let advertisingCodingSelection = LowEnergyFeature(rawValue: 0x0100_0000_0000)

    /// Advertising Coding Selection (Host Support)
    public static let advertisingCodingSelectionHostSupport = LowEnergyFeature(rawValue: 0x0200_0000_0000)

    /// Decision-Based Advertising Filtering
    public static let decisionBasedAdvertisingFiltering = LowEnergyFeature(rawValue: 0x0400_0000_0000)

    /// Periodic Advertising with Responses - Advertiser
    public static let periodicAdvertisingWithResponsesAdvertiser = LowEnergyFeature(rawValue: 0x0800_0000_0000)

    /// Periodic Advertising with Responses - Scanner
    public static let periodicAdvertisingWithResponsesScanner = LowEnergyFeature(rawValue: 0x1000_0000_0000)

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

        if let value = featureSet[self] { return value.name }
        return "[" + elements.map { $0.description }.joined(separator: ", ") + "]"
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

public typealias LowEnergyFeatureSet = LowEnergyFeature
