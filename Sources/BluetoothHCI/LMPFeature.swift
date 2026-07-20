//
//  LMPFeature.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 8/7/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

/// Bluetooth LMP Feature
@frozen
public struct LMPFeature: OptionSet, Hashable, Sendable, CaseIterable {

    public let rawValue: UInt64

    public init(rawValue: UInt64) {
        self.rawValue = rawValue
    }

    /// 3 slot packets
    public static let slotPackets3 = LMPFeature(rawValue: 0b01)

    /// 5 slot packets
    public static let slotPackets5 = LMPFeature(rawValue: 0b10)

    /// Encryption
    public static let encryption = LMPFeature(rawValue: 0b100)

    /// Slot offset
    public static let slotOffset = LMPFeature(rawValue: 0b1000)

    /// Timing accuracy
    public static let timingAccuracy = LMPFeature(rawValue: 0b10000)

    /// Role switch
    public static let roleSwitch = LMPFeature(rawValue: 0b100000)

    // Hold mode
    public static let holdMode = LMPFeature(rawValue: 0b1000000)

    // Sniff mode
    public static let sniffMode = LMPFeature(rawValue: 0b10000000)

    /// Park state
    public static let parkState = LMPFeature(rawValue: 0b1_00000000)

    /// Power control requests
    public static let powerControlRequests = LMPFeature(rawValue: 0b010_00000000)

    // Channel quality driven data rate
    public static let channelQualityDrivenDataRate = LMPFeature(rawValue: 0b100_00000000)

    /// SCO link
    public static let scoLink = LMPFeature(rawValue: 0b1000_00000000)

    /// HV2 Packets
    public static let hv2Packets = LMPFeature(rawValue: 0b10000_00000000)

    /// HV3 Packets
    public static let hv3Packets = LMPFeature(rawValue: 0b100000_00000000)

    /// u-law log synchronous data
    public static let uLawLogSynchronousData = LMPFeature(rawValue: 0b1000000_00000000)

    /// A-law log synchronous data
    public static let aLawLogSynchronousData = LMPFeature(rawValue: 0b10000000_00000000)

    /// CVSD synchronous data
    public static let csvdSynchronousData = LMPFeature(rawValue: 0b1_00000000_00000000)

    /// Paging parameter negotiation
    public static let pagingParameterNegotiation = LMPFeature(rawValue: 0b10_00000000_00000000)

    /// Power Control
    public static let powerControl = LMPFeature(rawValue: 0b100_00000000_00000000)

    // Transparent synchronous data
    public static let transparentSynchronousData = LMPFeature(rawValue: 0b1000_00000000_00000000)

    // Flow control lag (least significant bit)
    public static let flowControlLag = LMPFeature(rawValue: 0b1110000_00000000_00000000)

    /// Broadcast Encryption
    public static let broadcastEncryption = LMPFeature(rawValue: 0b10000000_00000000_00000000)

    // Enhanced Data Rate ACL 2 Mbps mode
    public static let enhancedDataRateACL2mbpsMode = LMPFeature(rawValue: 0b10_00000000_00000000_00000000)

    // Enhanced Data Rate ACL 3 Mbps mode
    public static let enhancedDataRateACL3mbpsMode = LMPFeature(rawValue: 0b100_00000000_00000000_00000000)

    // Enhanced inquiry scan
    public static let enhancedInquiryScan = LMPFeature(rawValue: 0b1000_00000000_00000000_00000000)

    // Interlaced inquiry scan
    public static let interlacedInquiryScan = LMPFeature(rawValue: 0b10000_00000000_00000000_00000000)

    // Interlaced page scan
    public static let interlacedPageScan = LMPFeature(rawValue: 0b100000_00000000_00000000_00000000)

    // RSSI with inquiry results
    public static let rssiWithInquiryResults = LMPFeature(rawValue: 0b1000000_00000000_00000000_00000000)

    // Extended SCO link (EV3 packets)
    public static let ev3Packets = LMPFeature(rawValue: 0b10000000_00000000_00000000_00000000)

    // EV4 packets
    public static let ev4Packets = LMPFeature(rawValue: 0b1_00000000_00000000_00000000_00000000)

    // EV5 packets
    public static let ev5Packets = LMPFeature(rawValue: 0b10_00000000_00000000_00000000_00000000)

    // AFH capable slave
    public static let afhCapableSlave = LMPFeature(rawValue: 0b1000_00000000_00000000_00000000_00000000)

    // AFH classification slave
    public static let afhClassificationSlave = LMPFeature(rawValue: 0b10000_00000000_00000000_00000000_00000000)

    // BR/EDR Not Supported
    public static let brEdrNotSupported = LMPFeature(rawValue: 0b100000_00000000_00000000_00000000_00000000)

    // LE Supported (Controller)
    public static let leSupported = LMPFeature(rawValue: 0b1000000_00000000_00000000_00000000_00000000)

    // 3-slot Enhanced Data Rate ACL packets
    public static let slot3EnhancedDataRateACLPackets = LMPFeature(rawValue: 0b10000000_00000000_00000000_00000000_00000000)

    // 5-slot Enhanced Data Rate ACL packets
    public static let slot5EnhancedDataRateACLPackets = LMPFeature(rawValue: 0b1_00000000_00000000_00000000_00000000_00000000)

    // Sniff subrating
    public static let sniffSubrating = LMPFeature(rawValue: 0b10_00000000_00000000_00000000_00000000_00000000)

    // Pause encryption
    public static let pauseEncryption = LMPFeature(rawValue: 0b100_00000000_00000000_00000000_00000000_00000000)

    // AFH capable master
    public static let afhCapableMaster = LMPFeature(rawValue: 0b1000_00000000_00000000_00000000_00000000_00000000)

    // AFH classification master
    public static let afhClassificationMaster = LMPFeature(rawValue: 0b10000_00000000_00000000_00000000_00000000_00000000)

    // Enhanced Data Rate eSCO 2 Mbps mode
    public static let enhancedDataRateeSCO2mbpsMode = LMPFeature(rawValue: 0b100000_00000000_00000000_00000000_00000000_00000000)

    // Enhanced Data Rate eSCO 3 Mbps mode
    public static let enhancedDataRateeSCO3mbpsMode = LMPFeature(rawValue: 0b1000000_00000000_00000000_00000000_00000000_00000000)

    // 3-slot Enhanced Data Rate eSCO packets
    public static let slot3EnhancedDataRateeSCOPackets = LMPFeature(rawValue: 0b10000000_00000000_00000000_00000000_00000000_00000000)

    // Extended Inquiry Response
    public static let extendedInquiryResponse = LMPFeature(rawValue: 0b1_00000000_00000000_00000000_00000000_00000000_00000000)

    // Simultaneous LE and BR/EDR to Same Device Capable (Controller)
    public static let simultanousLEandBREDR = LMPFeature(rawValue: 0b10_00000000_00000000_00000000_00000000_00000000_00000000)

    // Secure Simple Pairing
    public static let secureSimplePairing = LMPFeature(rawValue: 0b1000_00000000_00000000_00000000_00000000_00000000_00000000)

    // Encapsulated PDU
    public static let encapsulatedPDU = LMPFeature(rawValue: 0b10000_00000000_00000000_00000000_00000000_00000000_00000000)

    // Erroneous Data Reporting
    public static let erroneousDataReporting = LMPFeature(rawValue: 0b100000_00000000_00000000_00000000_00000000_00000000_00000000)

    // Non-flushable Packet Boundary Flag
    public static let nonFlushablePacketBoundaryFlag = LMPFeature(rawValue: 0b1000000_00000000_00000000_00000000_00000000_00000000_00000000)

    // Link Supervision Timeout Changed Event
    public static let linkSupervisionTimeoutChangedEvent = LMPFeature(rawValue: 0b1_00000000_00000000_00000000_00000000_00000000_00000000_00000000)

    // Inquiry TX Power Level
    public static let inquiryTXPowerLevel = LMPFeature(rawValue: 0b10_00000000_00000000_00000000_00000000_00000000_00000000_00000000)

    // Enhanced Power Control
    public static let enhancedPowerControl = LMPFeature(rawValue: 0b100_00000000_00000000_00000000_00000000_00000000_00000000_00000000)

    // Extended features
    public static let extendedFeatures = LMPFeature(rawValue: 0b10000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000)

    public static let allCases: [LMPFeature] = [
        .slotPackets3,
        .slotPackets5,
        .encryption,
        .slotOffset,
        .timingAccuracy,
        .roleSwitch,
        .holdMode,
        .sniffMode,
        .parkState,
        .powerControlRequests,
        .channelQualityDrivenDataRate,
        .scoLink,
        .hv2Packets,
        .hv3Packets,
        .uLawLogSynchronousData,
        .aLawLogSynchronousData,
        .csvdSynchronousData,
        .pagingParameterNegotiation,
        .powerControl,
        .transparentSynchronousData,
        .flowControlLag,
        .broadcastEncryption,
        .enhancedDataRateACL2mbpsMode,
        .enhancedDataRateACL3mbpsMode,
        .enhancedInquiryScan,
        .interlacedInquiryScan,
        .interlacedPageScan,
        .rssiWithInquiryResults,
        .ev3Packets,
        .ev4Packets,
        .ev5Packets,
        .afhCapableSlave,
        .afhClassificationSlave,
        .brEdrNotSupported,
        .leSupported,
        .slot3EnhancedDataRateACLPackets,
        .slot5EnhancedDataRateACLPackets,
        .sniffSubrating,
        .pauseEncryption,
        .afhCapableMaster,
        .afhClassificationMaster,
        .enhancedDataRateeSCO2mbpsMode,
        .enhancedDataRateeSCO3mbpsMode,
        .slot3EnhancedDataRateeSCOPackets,
        .extendedInquiryResponse,
        .simultanousLEandBREDR,
        .secureSimplePairing,
        .encapsulatedPDU,
        .erroneousDataReporting,
        .nonFlushablePacketBoundaryFlag,
        .linkSupervisionTimeoutChangedEvent,
        .inquiryTXPowerLevel,
        .enhancedPowerControl,
        .extendedFeatures
    ]
}

public extension LMPFeature {

    var name: String {

        switch self {
        case .slotPackets3: return "3 slot packets"
        case .slotPackets5: return "5 slot packets"
        case .encryption: return "Encryption"
        case .slotOffset: return "Slot offset"
        case .timingAccuracy: return "Timing accuracy"
        case .roleSwitch: return "Role switch"
        case .holdMode: return "Hold mode"
        case .sniffMode: return "Sniff mode"
        case .parkState: return "Park state"
        case .powerControlRequests: return "Power control requests"
        case .channelQualityDrivenDataRate: return "Channel quality driven data rate (CQDDR)"
        case .scoLink: return "SCO link"
        case .hv2Packets: return "HV2 packets"
        case .hv3Packets: return "HV3 packets"
        case .uLawLogSynchronousData: return "u-law log synchronous data"
        case .aLawLogSynchronousData: return "A-law log synchronous data"
        case .csvdSynchronousData: return "CVSD synchronous data"
        case .pagingParameterNegotiation: return "Paging parameter negotiation"
        case .powerControl: return "Power control"
        case .transparentSynchronousData: return "Transparent synchronous data"
        case .flowControlLag: return "Flow control lag"
        case .broadcastEncryption: return "Broadcast Encryption"
        case .enhancedDataRateACL2mbpsMode: return "Enhanced Data Rate ACL 2 Mbps mode"
        case .enhancedDataRateACL3mbpsMode: return "Enhanced Data Rate ACL 3 Mbps mode"
        case .enhancedInquiryScan: return "Enhanced inquiry scan"
        case .interlacedInquiryScan: return "Interlaced inquiry scan"
        case .interlacedPageScan: return "Interlaced page scan"
        case .rssiWithInquiryResults: return "RSSI with inquiry results"
        case .ev3Packets: return "Extended SCO link (EV3 packets)"
        case .ev4Packets: return "EV4 packets"
        case .ev5Packets: return "EV5 packets"
        case .afhCapableSlave: return "AFH capable slave"
        case .afhClassificationSlave: return "AFH classification slave"
        case .brEdrNotSupported: return "BR/EDR Not Supported"
        case .leSupported: return "LE Supported (Controller)"
        case .slot3EnhancedDataRateACLPackets: return "3-slot Enhanced Data Rate ACL packets"
        case .slot5EnhancedDataRateACLPackets: return "5-slot Enhanced Data Rate ACL packets"
        case .sniffSubrating: return "Sniff subrating"
        case .pauseEncryption: return "Pause encryption"
        case .afhCapableMaster: return "AFH capable master"
        case .afhClassificationMaster: return "AFH classification master"
        case .enhancedDataRateeSCO2mbpsMode: return "Enhanced Data Rate eSCO 2 Mbps mode"
        case .enhancedDataRateeSCO3mbpsMode: return "Enhanced Data Rate eSCO 3 Mbps mode"
        case .slot3EnhancedDataRateeSCOPackets: return "3-slot Enhanced Data Rate eSCO packets"
        case .extendedInquiryResponse: return "Extended Inquiry Response"
        case .simultanousLEandBREDR: return "Simultaneous LE and BR/EDR to Same Device Capa- ble (Controller)"
        case .secureSimplePairing: return "Secure Simple Pairing"
        case .encapsulatedPDU: return "Encapsulated PDU"
        case .erroneousDataReporting: return "Erroneous Data Reporting"
        case .nonFlushablePacketBoundaryFlag: return "Non-flushable Packet Boundary Flag"
        case .linkSupervisionTimeoutChangedEvent: return "Link Supervision Timeout Changed Event"
        case .inquiryTXPowerLevel: return "Inquiry TX Power Level"
        case .enhancedPowerControl: return "Enhanced Power Control"
        case .extendedFeatures: return "Extended features"
        default: return "0b" + String(rawValue, radix: 2)
        }
    }
}
