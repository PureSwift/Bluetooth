//
//  HCIReadDataBlockSize.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 8/6/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Method

public extension BluetoothHostControllerInterface {
    
    /// Read Data Block Size
    ///
    /// The Read_Data_Block_Size command is used to read values regarding the maximum permitted data transfers over the Controller and the data buffering available in the Controller.
    /// The Host uses this information when fragmenting data for transmission, and when performing block-based flow control, based on the Number Of Completed Data Blocks event. The Read_Data_Block_Size command shall be issued by the Host before it sends any data to the Controller.
    func readDataBlockSize(timeout: HCICommandTimeout = .default) async throws -> HCIReadDataBlockSizeReturn {
        
        return try await deviceRequest(HCIReadDataBlockSizeReturn.self, timeout: timeout)
    }
}

// MARK: - Return Parameter

/// Read Data Block Size
///
/// The Read_Data_Block_Size command is used to read values regarding the maximum permitted data transfers over the Controller and the data buffering available in the Controller.
/// The Host uses this information when fragmenting data for transmission, and when performing block-based flow control, based on the Number Of Completed Data Blocks event. The Read_Data_Block_Size command shall be issued by the Host before it sends any data to the Controller.
@frozen
public struct HCIReadDataBlockSizeReturn: HCICommandReturnParameter {
    
    public static let command = InformationalCommand.readDataBlockSize
    
    public static let length = 7
    
    public let status: HCIStatus
    
    /// Maximum length (in octets) of the data portion of an HCI ACL Data Packet that the Controller is able to accept for transmission. For AMP Controllers this always equals to Max_PDU_Size.
    public let maxACLDataPacketLength: UInt16
    
    /// Maximum length (in octets) of the data portion of each HCI ACL Data Packet that the Controller is able to hold in each of its data block buffers.
    public let dataBlockLength: UInt16
    
    /// Total number of data block buffers available in the Controller for the storage of data packets scheduled for transmission.
    public let dataBlocksTotalNumber: UInt16
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        guard let status = HCIStatus(rawValue: data[0])
            else { return nil }
        
        self.status = status
        
        self.maxACLDataPacketLength = UInt16(littleEndian: UInt16(bytes: (data[1], data[2])))
        
        self.dataBlockLength = UInt16(littleEndian: UInt16(bytes: (data[3], data[4])))
        
        self.dataBlocksTotalNumber = UInt16(littleEndian: UInt16(bytes: (data[5], data[6])))
    }
}
