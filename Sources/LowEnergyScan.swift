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
    func lowEnergyScan(filterDuplicates: Bool = true,
                       parameters: LowEnergyCommand.SetScanParametersParameter = .init(),
                       timeout: HCICommandTimeout = .default,
                       shouldContinue: () -> (Bool),
                       foundDevice: (LowEnergyScannedDevice) -> ()) throws {
        
        // macro for enabling / disabling scan
        func enableScan(_ isEnabled: Bool = true) throws {
            
            let scanEnableCommand = LowEnergyCommand.SetScanEnableParameter(isEnabled: isEnabled,
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
    func lowEnergyScan(duration: TimeInterval = 10,
                       filterDuplicates: Bool = true,
                       parameters: LowEnergyCommand.SetScanParametersParameter = .init(),
                       timeout: HCICommandTimeout = .default) throws -> [LowEnergyScannedDevice] {
        
        let startDate = Date()
        let endDate = startDate + duration
        
        var foundDevices = [LowEnergyScannedDevice]()
        
        try lowEnergyScan(filterDuplicates: filterDuplicates,
                          parameters: parameters,
                          timeout: timeout,
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
    func setLowEnergyScanResponse(_ data: LowEnergyAdvertisingData,
                                  timeout: HCICommandTimeout = .default) throws {
        
        // set scan response parameters
        let command = LowEnergyCommand.SetScanResponseDataParameter(data: data)
        
        try deviceRequest(command, timeout: timeout)
    }
    
    /// LE Set Extended Scan Response Data Command
    ///
    /// The command is used to provide scan response data used in scanning response PDUs. This command may be
    /// issued at any time after the advertising set identified by the Advertising_Handle parameter has been
    /// created using the LE Set Extended Advertising Parameters Command (see Section 7.8.53) regardless of
    /// whether advertising in that set is enabled or disabled.
    func setLowEnergyExtendedScanResponseData(advertisingHandle: UInt8,
                                              operation: LowEnergyCommand.SetExtendedScanResponseDataParameter.Operation,
                                              fragmentPreference: LowEnergyFragmentPreference,
                                              scanResponseData: [UInt8],
                                              timeout: HCICommandTimeout = .default)  throws {
        
        let parameters = LowEnergyCommand.SetExtendedScanResponseDataParameter(advertisingHandle: advertisingHandle, operation: operation, fragmentPreference: fragmentPreference, scanResponseData: scanResponseData)
        
        try deviceRequest(parameters, timeout: timeout)
    }
    
    /// LE Set Extended Scan Enable Command
    ///
    /// The command is used to enable or disable scanning.
    func setLowEnergyExtendedScanEnable(enable: LowEnergyCommand.SetExtendedScanEnableParameter.Enable,
                                        filterDuplicates: LowEnergyCommand.SetExtendedScanEnableParameter.FilterDuplicates,
                                        duration: LowEnergyCommand.SetExtendedScanEnableParameter.Duration,
                                        period: LowEnergyCommand.SetExtendedScanEnableParameter.Period,
                                        timeout: HCICommandTimeout = .default)  throws {
        
        let parameters = LowEnergyCommand.SetExtendedScanEnableParameter(enable: enable,
                                                                         filterDuplicates: filterDuplicates,
                                                                         duration: duration,
                                                                         period: period)
        
        try deviceRequest(parameters, timeout: timeout)
    }
    
    /// LE Set Extended Scan Parameters Command
    ///
    /// Used to set the extended scan parameters to be used on the advertising channels.
    func setLowEnergyExtendedScanParameters(ownAddressType: LowEnergyAddressType,
                                            scanningFilterPolicy: LowEnergyCommand.SetExtendedScanParametersParameter.ScanningFilterPolicy,
                                            scanningPHY: LowEnergyCommand.SetExtendedScanParametersParameter.ScanningPHY,
                                            timeout: HCICommandTimeout = .default)  throws {
        
        let parameters = LowEnergyCommand.SetExtendedScanParametersParameter(ownAddressType: ownAddressType,
                                                                         scanningFilterPolicy: scanningFilterPolicy,
                                                                         scanningPHY: scanningPHY)
        
        try deviceRequest(parameters, timeout: timeout)
    }
    
    /// LE Read Buffer Size Command
    ///
    /// The command is used to read the maximum size of the data portion of HCI LE ACL Data Packets sent from the Host to the Controller.
    func readBufferSize(timeout: HCICommandTimeout = .default) throws -> LowEnergyCommand.ReadBufferSizeReturnParameter {
        
        let bufferSizeReturnParameter = try deviceRequest(LowEnergyCommand.ReadBufferSizeReturnParameter.self, timeout: timeout)
        
        return bufferSizeReturnParameter
    }
}
