//
//  GAPTransportDiscoveryData.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// The Transport Discovery Data AD Type shall be present in the Advertising Data (i.e., AdvData) and may also be present in the Extended Inquiry Response (EIR).
/// EIR and Advertising Packets may be of different sizes and may contain different information within the Transport Discovery Data AD Type.
///
/// Note 1: Typically 0-26 (inclusive of the Flags AD Type), however larger values may be supported in future updates of the Core Specification.
@frozen
public struct GAPTransportDiscoveryData: GAPData, Equatable {
    
    internal static let minBlocks = 1
    
    public static let dataType: GAPDataType = .transportDiscoveryData
    
    public let code: UInt8
    
    public let blocks: [GAPTransportDiscoveryBlock]
    
    public init(code: UInt8, blocks: [GAPTransportDiscoveryBlock]) {
        
        self.code = code
        self.blocks = blocks
    }
}

public extension GAPTransportDiscoveryData {
    
    init?(data: Data) {
        
        var index = 1
        var blocks = [GAPTransportDiscoveryBlock]()
        
        while index < data.count {
            
            guard index + GAPTransportDiscoveryBlock.minLength < data.count
                else { return nil }
            
            let flags = BitMaskOptionSet<GAPTransportDiscoveryDataFlag>(rawValue: data[index+1])
            let length = Int(data[index+2])
            
            guard index + GAPTransportDiscoveryBlock.minLength + length < data.count
                else { return nil }
            
            let transportData: [UInt8] = stride(from: index+3, to: index+3+length, by: 1).map { data[Int($0)] }
            let block = GAPTransportDiscoveryBlock(organizationID: data[index], flags: flags, /* dataLength: data[index+2], */ transportData: Data(transportData))
            blocks.append(block)
            
            index += (GAPTransportDiscoveryBlock.minLength + length + 1)
        }
        
        guard blocks.count >= GAPTransportDiscoveryData.minBlocks
            else { return nil }
        
        self.init(code: data[0], blocks: blocks)
    }
    
    func append(to data: inout Data) {
        
        data += code
        blocks.forEach { data += $0 }
    }
    
    var dataLength: Int {
        
        return blocks.reduce(1, { $0 + $1.dataLength })
    }
}

// MARK: - Supporting Types

/// A Transport Block includes the following fields: Organization ID, TDS Flags, Transport Data Length, and Transport Data.
/// One or more Transport Block(s) may be present in the Transport Discovery Data AD Type.
/// The value of the fields in this section relate only to the transport which the block describes (i.e., they pertain only to that Transport Block).
/// The data contained in the Transport Block shall be able to be fully parsed by Clients even if size or other restrictions require that full data is in the GATT database.
/// The structure of the Transport Block may be repeated in case there are multiple services (on the same or different transports) to advertise simultaneously.
///
/// The structure may repeat as long as there is space available. These Transport Blocks may be from the same organization or from different organizations.
/// Where multiple Transport Blocks are used, the advertising device should list these in order of descending priority or preference.
/// For example, if the blocks represent more than one supported service, the order represents preferred support (e.g., perhaps a printer is capable of printing using a faster technology from one organization, but also a slower technology from another organization). If the blocks represent more than one required service, the order represents preferred service order (e.g., perhaps a device requires an immediate service, but also another service that is of lower priority).
@frozen
public struct GAPTransportDiscoveryBlock: Equatable {
    
    internal static let minLength = 2
    
    public let organizationID: UInt8
    
    public let flags: BitMaskOptionSet<GAPTransportDiscoveryDataFlag>
    
    public let transportData: Data
}

extension GAPTransportDiscoveryBlock: DataConvertible {
    
    /// Append data representation into buffer.
    static func += <T: DataContainer> (data: inout T, value: GAPTransportDiscoveryBlock) {
        
        data += value.organizationID
        data += value.flags.rawValue
        data += UInt8(value.transportData.count)
        data += value.transportData
    }
    
    /// Length of value when encoded into data.
    var dataLength: Int {
        
        return 3 + transportData.count
    }
}

/// GAP Transport Discovery Data Flag
@frozen
public enum GAPTransportDiscoveryDataFlag: UInt8, BitMaskOption {
    
    /// Seeker
    case seeker = 0b01
    
    /// Provider
    case provider = 0b10
    
    /// Transport Data Incomplete
    case dataIncomplete = 0b100
    
    /// Transport State
    case stateOn = 0b1000
    
    /// Temporarily Unavailable
    case temporalilyUnavailable = 0b10000
    
    public static let allCases: [GAPTransportDiscoveryDataFlag] = [
        .seeker,
        .provider,
        .dataIncomplete,
        .stateOn,
        .temporalilyUnavailable
    ]
}
