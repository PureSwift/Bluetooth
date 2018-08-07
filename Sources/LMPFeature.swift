//
//  LMPFeature.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 8/7/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

public enum LMPFeature: UInt64, BitMaskOption {
    
    #if swift(>=3.2)
    #elseif swift(>=3.0)
    public typealias RawValue = UInt64
    #endif
    
    /// 3 slot packets
    case slotPackets3 = 0b01
    
    /// 5 slot packets
    case slotPackets5 = 0b10
    
    /// Encryption
    case encryption = 0b100
    
    /// Slot offset
    case slotOffset = 0b1000
    
    /// Timing accuracy
    case timingAccuracy = 0b10000
    
    /// Role switch
    case roleSwitch = 0b100000
    
    // Hold mode
    case holdMode = 0b1000000
    
    // Sniff mode
    case sniffMode = 0b10000000
    
    /// Park state
    case parkState = 0b1_00000000

    /// Power control requests
    case powerControlRequests = 0b010_00000000
    
    // Channel quality driven data rate
    case channelQualityDrivenDataRate = 0b100_00000000
    
    /// SCO link
    case scoLink = 0b1000_00000000
    
    /// HV2 Packets
    case hv2Packets = 0b10000_00000000
    
    /// HV3 Packets
    case hv3Packets = 0b100000_00000000
    
    /// u-law log synchronous data
    case uLawLogSynchronousData = 0b1000000_00000000
    
    /// A-law log synchronous data
    case aLawLogSynchronousData = 0b10000000_00000000
    
    /// CVSD synchronous data
    case csvdSynchronousData = 0b1_00000000_00000000
    
    /// Paging parameter negotiation
    case pagingParameterNegotiation = 0b10_00000000_00000000
    
    /// Power Control
    case powerControl = 0b100_00000000_00000000
    
    // Transparent synchronous data
    case transparentSynchronousData = 0b1000_00000000_00000000
    
    // Flow control lag (least significant bit)
    case flowControlLag = 0b1110000_00000000_00000000
    
    /// Broadcast Encryption
    case broadcastEncryption = 0b10000000_00000000_00000000
    
    // Enhanced Data Rate ACL 2 Mbps mode
    case enhancedDataRateACL2mbpsMode = 0b10_00000000_00000000_00000000
    
    // Enhanced Data Rate ACL 3 Mbps mode
    case enhancedDataRateACL3mbpsMode = 0b100_00000000_00000000_00000000
    
    // Enhanced inquiry scan
    case enhancedInquiryScan = 0b1000_00000000_00000000_00000000
    
    // Interlaced inquiry scan
    case interlacedInquiryScan = 0b10000_00000000_00000000_00000000
    
    // Interlaced page scan
    case interlacedPageScan = 0b100000_00000000_00000000_00000000
    
    // RSSI with inquiry results
    case rssiWithInquiryResults = 0b1000000_00000000_00000000_00000000
    
    // Extended SCO link (EV3 packets)
    case ev3Packets = 0b10000000_00000000_00000000_00000000
    
    // EV4 packets
    case ev4Packets = 0b1_00000000_00000000_00000000_00000000
    
    // EV5 packets
    case ev5Packets = 0b10_00000000_00000000_00000000_00000000
    
    // AFH capable slave
    case afhCapableSlave = 0b1000_00000000_00000000_00000000_00000000
    
    // AFH classification slave
    case afhClassificationSlave = 0b10000_00000000_00000000_00000000_00000000
    
    // BR/EDR Not Supported
    case brEdrNotSupported = 0b100000_00000000_00000000_00000000_00000000
    
    // LE Supported (Controller)
    case leSupported = 0b1000000_00000000_00000000_00000000_00000000
    
    // 3-slot Enhanced Data Rate ACL packets
    case slot3EnhancedDataRateACLPackets = 0b10000000_00000000_00000000_00000000_00000000
    
    // 5-slot Enhanced Data Rate ACL packets
    case slot5EnhancedDataRateACLPackets = 0b1_00000000_00000000_00000000_00000000_00000000
    
    // Sniff subrating
    case sniffSubrating = 0b10_00000000_00000000_00000000_00000000_00000000
    
    // Pause encryption
    case pauseEncryption = 0b100_00000000_00000000_00000000_00000000_00000000
    
    // AFH capable master
    case afhCapableMaster = 0b1000_00000000_00000000_00000000_00000000_00000000
    
    // AFH classification master
    case afhClassificationMaster = 0b10000_00000000_00000000_00000000_00000000_00000000
    
    // Enhanced Data Rate eSCO 2 Mbps mode
    case enhancedDataRateeSCO2mbpsMode = 0b100000_00000000_00000000_00000000_00000000_00000000
    
    // Enhanced Data Rate eSCO 3 Mbps mode
    case enhancedDataRateeSCO3mbpsMode = 0b1000000_00000000_00000000_00000000_00000000_00000000
    
    // 3-slot Enhanced Data Rate eSCO packets
    case slot3EnhancedDataRateeSCOPackets = 0b10000000_00000000_00000000_00000000_00000000_00000000
    
    // Extended Inquiry Response
    case extendedInquiryResponse = 0b1_00000000_00000000_00000000_00000000_00000000_00000000
    
    // Simultaneous LE and BR/EDR to Same Device Capable (Controller)
    case simultanousLEandBREDR = 0b10_00000000_00000000_00000000_00000000_00000000_00000000
    
    // Secure Simple Pairing
    case secureSimplePairing = 0b1000_00000000_00000000_00000000_00000000_00000000_00000000
    
    // Encapsulated PDU
    case encapsulatedPDU = 0b10000_00000000_00000000_00000000_00000000_00000000_00000000
    
    // Erroneous Data Reporting
    case erroneousDataReporting = 0b100000_00000000_00000000_00000000_00000000_00000000_00000000
    
    // Non-flushable Packet Boundary Flag
    case nonFlushablePacketBoundaryFlag = 0b1000000_00000000_00000000_00000000_00000000_00000000_00000000
    
    // Link Supervision Timeout Changed Event
    case linkSupervisionTimeoutChangedEvent = 0b1_00000000_00000000_00000000_00000000_00000000_00000000_00000000
    
    // Inquiry TX Power Level
    case inquiryTXPowerLevel = 0b10_00000000_00000000_00000000_00000000_00000000_00000000_00000000
    
    // Enhanced Power Control
    case enhancedPowerControl = 0b100_00000000_00000000_00000000_00000000_00000000_00000000_00000000
    
    // Extended features
    case extendedFeatures = 0b10000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000
    
    public static var all: Set<LMPFeature> = [
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
        .rssiWithInquiryResults,
        .ev3Packets,
        .ev4Packets,
        .ev5Packets,
        .afhCapableSlave,
        .afhClassificationMaster,
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
