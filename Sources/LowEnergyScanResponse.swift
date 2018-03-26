//
//  ScanResponse.swift
//  BluetoothLinux
//
//  Created by Alsey Coleman Miller on 11/27/17.
//  Copyright © 2017 PureSwift. All rights reserved.
//

import struct Foundation.Data

public extension BluetoothHostControllerInterface {
    
    /// Set the LE Scan Response
    ///
    /// - Parameter data: 31 byte static array representing the scan response data.
    /// 
    /// - Parameter length: The length of signficant bytes in the scan response data. 
    /// Must be less than or equal to 31. 
    /// 
    /// - Parameter commandTimeout: The timeout to use for each HCI command.
    ///
    /// - Precondition: The provided length must be less than or equal to 31.
    func setLowEnergyScanResponse(_ data: LowEnergyResponseData, length: UInt8, commandTimeout: Int = 1000) throws {
        
        precondition(length <= 31, "LE Scan Response Data can only be 31 octets")
        
        // set scan response parameters
        let setScanResponseDataCommand = LowEnergyCommand.SetScanResponseDataParameter(data: data, length: length)
        
        //print("Setting Scan Response Data")
        
        try deviceRequest(setScanResponseDataCommand, timeout: commandTimeout)
    }
    
    /// Set the LE Scan Response
    ///
    /// - Parameter data: Scan response data.
    /// Must be less than or equal to 31 bytes.
    ///
    /// - Parameter length: The length of signficant bytes in the scan response data.
    /// Must be less than or equal to 31.
    ///
    /// - Parameter commandTimeout: The timeout to use for each HCI command.
    ///
    /// - Precondition: The provided length must be less than or equal to 31.
    func setLowEnergyScanResponse(_ data: Data, commandTimeout: Int = 1000) throws {
        
        precondition(data.count <= 31, "LE Scan Response Data can only be 31 octets")
        
        let bytes: LowEnergyResponseData = (data[0], data[1], data[2], data[3], data[4], data[5], data[6], data[7], data[8], data[9], data[10], data[11], data[12], data[13], data[14], data[15], data[16], data[17], data[18], data[19], data[20], data[21], data[22], data[23], data[24], data[25], data[26], data[27], data[28], data[29], data[30])
        
        try setLowEnergyScanResponse(bytes, length: UInt8(data.count), commandTimeout: commandTimeout)
    }
}
