//
//  PacketType.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 8/9/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// The packets used on the piconet are related to the logical transports they are used in. Three logical transports with distinct packet types are defined (see Section 4 on page 97): the SCO logical transport, the eSCO logical transport, and the ACL logical transport. For each of these logical transports, 15 different packet types can be defined.
///
/// To indicate the different packets on a logical transport, the 4-bit TYPE code is used. The packet types are divided into four segments. The first segment is reserved for control packets. All control packets occupy a single time slot. The sec- ond segment is reserved for packets occupying a single time slot. The third seg- ment is reserved for packets occupying three time slots. The fourth segment is reserved for packets occupying five time slots. The slot occupancy is reflected in the segmentation and can directly be derived from the type code. Table 6.2 on page 118 summarizes the packets defined for the SCO, eSCO, and ACL logical transport types.
///
/// All packet types with a payload shall use GFSK modulation unless specified otherwise in the following sections.
///
/// ACL logical transports Enhanced Data Rate packet types are explicitly selected via LMP using the packet_type_table (ptt) parameter. eSCO Enhanced Data Rate packet types are selected when the eSCO logical transport is established.
@frozen
public enum PacketType {
    
    /// ACL packets are used on the asynchronous logical transport. The information carried may be user data or control data.
    ///
    /// Seven packet types are defined for Basic Rate operation: DM1, DH1, DM3, DH3, DM5, DH5 and AUX1. Six additional packets are defined for Enhanced Data Rate operation: 2-DH1, 3-DH1, 2-DH3, 3-DH3, 2-DH5 and 3-DH5.
    case acl(BitMaskOptionSet<ACLPacketType>)
    
    /// HV and DV packets are used on the synchronous SCO logical transport. The HV packets do not include a CRC and shall not be retransmitted. DV packets include a CRC on the data section, but not on the synchronous data section. The data section of DV packets shall be retransmitted. SCO packets may be routed to the synchronous I/O port. Four packets are allowed on the SCO logical transport: HV1, HV2, HV3 and DV. These packets are typically used for 64kb/s speech transmission but may be used for transparent synchronous data.
    case sco(BitMaskOptionSet<SCOPacketType>)
    
    public var rawValue: UInt16 {
        
        switch self {
        case .sco(let packetTypes):
            return packetTypes.rawValue
            
        case .acl(let packetTypes):
            return packetTypes.rawValue
        }
    }
}

/// ACL packets are used on the asynchronous logical transport. The information carried may be user data or control data.
///
/// Seven packet types are defined for Basic Rate operation: DM1, DH1, DM3, DH3, DM5, DH5 and AUX1. Six additional packets are defined for Enhanced Data Rate operation: 2-DH1, 3-DH1, 2-DH3, 3-DH3, 2-DH5 and 3-DH5.
@frozen
public enum ACLPacketType: UInt16, BitMaskOption {
        
    /// 2-DH1 may not be used
    case packet2DH1mayNotBeUsed = 0x0002
    
    /// 3-DH1 may not be used
    case packet3DH1mayNotBeUsed = 0x0004
    
    /// DM1 may be used
    case packetDM1mayBeUsed = 0x0008
    
    /// DH1 may be used
    case packetDH1mayBeUsed = 0x0010
    
    /// 2-DH3 may not be used
    case packet2DH3mayNotBeUsed = 0x0100
    
    /// 3-DH3 may not be used
    case packet3DH3mayNotBeUsed = 0x0200
    
    /// DM3 may be used
    case packetDM3mayBeUsed = 0x0400
    
    /// DH3 may be used
    case packetDH3mayBeUsed = 0x0800
    
    /// 2-DH5 may not be used
    case packet2DH5mayBeUsed = 0x1000
    
    /// 3-DH5 may not be used
    case packet3DH5mayBeUsed = 0x2000
    
    /// DM5 may be used
    case packetDM5mayBeUsed = 0x4000
    
    /// DH5 may be used
    case packetDH5mayBeUsed = 0x8000
    
    public static let allCases: [ACLPacketType] = [
        .packet2DH1mayNotBeUsed,
        .packet3DH1mayNotBeUsed,
        .packetDM1mayBeUsed,
        .packetDH1mayBeUsed,
        .packet2DH3mayNotBeUsed,
        .packet3DH3mayNotBeUsed,
        .packetDM3mayBeUsed,
        .packetDH3mayBeUsed,
        .packet2DH5mayBeUsed,
        .packet3DH5mayBeUsed,
        .packetDM5mayBeUsed,
        .packetDH5mayBeUsed
    ]
}

/// HV and DV packets are used on the synchronous SCO logical transport. The HV packets do not include a CRC and shall not be retransmitted. DV packets include a CRC on the data section, but not on the synchronous data section. The data section of DV packets shall be retransmitted. SCO packets may be routed to the synchronous I/O port. Four packets are allowed on the SCO logical transport: HV1, HV2, HV3 and DV. These packets are typically used for 64kb/s speech transmission but may be used for transparent synchronous data.
@frozen
public enum SCOPacketType: UInt16, BitMaskOption {
    
    /// HV1
    case hv1 = 0x0020
    
    /// HV2
    case hv2 = 0x0040
    
    /// HV3
    case hv3 = 0x0080
    
    public static let allCases: [SCOPacketType] = [
        .hv1,
        .hv2,
        .hv3
    ]
}
