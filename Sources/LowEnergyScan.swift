//
//  LowEnergyScan.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 11/27/17.
//  Copyright © 2017 PureSwift. All rights reserved.
//

import Foundation

public extension BluetoothHostControllerInterface {
    
    public typealias LowEnergyScannedDevice = LowEnergyEvent.AdvertisingReportEventParameter.Report
    
    /// Scan LE devices.
    mutating func lowEnergyScan(filterDuplicates: Bool = true,
                       parameters: LowEnergyCommand.SetScanParametersParameter = .init(),
                       commandTimeout timeout: Int = HCI.defaultTimeout,
                       shouldContinue: () -> (Bool),
                       foundDevice: (LowEnergyScannedDevice) -> ()) throws {
        
        // macro for enabling / disabling scan
        func enableScan(_ isEnabled: Bool = true) throws {
            
            let scanEnableCommand = LowEnergyCommand.SetScanEnableParameter(enabled: isEnabled,
                                                                            filterDuplicates: filterDuplicates)
            
            do { try deviceRequest(scanEnableCommand, timeout: timeout) }
            catch HCIError.commandDisallowed { /* ignore, means already turned on or off */ }
        }
        
        // disable scanning first
        do { try enableScan(false) }
        catch HCIError.commandDisallowed { } // ignore error
        
        // set parameters
        try deviceRequest(parameters, timeout: timeout)
        
        // enable scanning
        try enableScan()
        
        // disable scanning after completion
        defer { do { try enableScan(false) } catch { /* ignore all errors disabling scanning */ } }
        
        // poll for scanned devices
        try pollEvent(HCIGeneralEvent.LowEnergyMetaParameter.self, shouldContinue: shouldContinue) { (metaEvent) in
            
            // only want advertising report
            guard metaEvent.subevent == .advertisingReport
                else { return }
            
            // parse LE advertising report
            guard let advertisingReport = LowEnergyEvent.AdvertisingReportEventParameter(byteValue: metaEvent.data)
                else { throw BluetoothHostControllerError.garbageResponse(Data(metaEvent.data)) }
            
            // call closure on each device found
            advertisingReport.reports.forEach { foundDevice($0) }
        }
    }
    
    /// Scan LE devices for the specified time period.
    mutating func lowEnergyScan(duration: TimeInterval = 10,
                       filterDuplicates: Bool = true,
                       parameters: LowEnergyCommand.SetScanParametersParameter = .init(),
                       commandTimeout timeout: Int = HCI.defaultTimeout) throws -> [LowEnergyScannedDevice] {
        
        let startDate = Date()
        let endDate = startDate + duration
        
        var foundDevices = [LowEnergyScannedDevice]()
        
        try lowEnergyScan(filterDuplicates: filterDuplicates,
                          parameters: parameters,
                          commandTimeout: timeout,
                          shouldContinue: { Date() < endDate },
                          foundDevice: { foundDevices.append($0) })
        
        return foundDevices
    }
    
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
    mutating func setLowEnergyScanResponse(_ data: LowEnergyResponseData, length: UInt8, commandTimeout: Int = HCI.defaultTimeout) throws {
        
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
    mutating func setLowEnergyScanResponse(_ data: Data, commandTimeout: Int = HCI.defaultTimeout) throws {
        
        precondition(data.count <= 31, "LE Scan Response Data can only be 31 octets")
        
        let bytes: LowEnergyResponseData = (data[0], data[1], data[2], data[3], data[4], data[5], data[6], data[7], data[8], data[9], data[10], data[11], data[12], data[13], data[14], data[15], data[16], data[17], data[18], data[19], data[20], data[21], data[22], data[23], data[24], data[25], data[26], data[27], data[28], data[29], data[30])
        
        try setLowEnergyScanResponse(bytes, length: UInt8(data.count), commandTimeout: commandTimeout)
    }
}
