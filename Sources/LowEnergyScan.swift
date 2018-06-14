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
    
    /// Scan LE devices for the specified time period.
    func lowEnergyScan(duration: TimeInterval = 10,
                       filterDuplicates: Bool = true,
                       parameters: HCILESetScanParameters = .init(),
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
    
    /// LE Set Extended Scan Response Data Command
    ///
    /// The command is used to provide scan response data used in scanning response PDUs. This command may be
    /// issued at any time after the advertising set identified by the Advertising_Handle parameter has been
    /// created using the LE Set Extended Advertising Parameters Command (see Section 7.8.53) regardless of
    /// whether advertising in that set is enabled or disabled.
    func setLowEnergyExtendedScanResponseData(advertisingHandle: UInt8,
                                              operation: HCILowEnergyCommand.SetExtendedScanResponseDataParameter.Operation,
                                              fragmentPreference: LowEnergyFragmentPreference,
                                              scanResponseData: [UInt8],
                                              timeout: HCICommandTimeout = .default)  throws {
        
        let parameters = HCILowEnergyCommand.SetExtendedScanResponseDataParameter(advertisingHandle: advertisingHandle, operation: operation, fragmentPreference: fragmentPreference, scanResponseData: scanResponseData)
        
        try deviceRequest(parameters, timeout: timeout)
    }
    
    /// LE Set Extended Scan Enable Command
    ///
    /// The command is used to enable or disable scanning.
    func setLowEnergyExtendedScanEnable(enable: HCILowEnergyCommand.SetExtendedScanEnableParameter.Enable,
                                        filterDuplicates: HCILowEnergyCommand.SetExtendedScanEnableParameter.FilterDuplicates,
                                        duration: HCILowEnergyCommand.SetExtendedScanEnableParameter.Duration,
                                        period: HCILowEnergyCommand.SetExtendedScanEnableParameter.Period,
                                        timeout: HCICommandTimeout = .default)  throws {
        
        let parameters = HCILowEnergyCommand.SetExtendedScanEnableParameter(enable: enable,
                                                                         filterDuplicates: filterDuplicates,
                                                                         duration: duration,
                                                                         period: period)
        
        try deviceRequest(parameters, timeout: timeout)
    }
    
    /// LE Set Extended Scan Parameters Command
    ///
    /// Used to set the extended scan parameters to be used on the advertising channels.
    func setLowEnergyExtendedScanParameters(ownAddressType: LowEnergyAddressType,
                                            scanningFilterPolicy: HCILowEnergyCommand.SetExtendedScanParametersParameter.ScanningFilterPolicy,
                                            scanningPHY: HCILowEnergyCommand.SetExtendedScanParametersParameter.ScanningPHY,
                                            timeout: HCICommandTimeout = .default)  throws {
        
        let parameters = HCILowEnergyCommand.SetExtendedScanParametersParameter(ownAddressType: ownAddressType,
                                                                         scanningFilterPolicy: scanningFilterPolicy,
                                                                         scanningPHY: scanningPHY)
        
        try deviceRequest(parameters, timeout: timeout)
    }
    
    /// LE Read Buffer Size Command
    ///
    /// The command is used to read the maximum size of the data portion of HCI LE ACL Data Packets sent from the Host to the Controller.
    func readBufferSize(timeout: HCICommandTimeout = .default) throws -> HCILowEnergyCommand.ReadBufferSizeReturnParameter {
        
        let bufferSizeReturnParameter = try deviceRequest(HCILowEnergyCommand.ReadBufferSizeReturnParameter.self, timeout: timeout)
        
        return bufferSizeReturnParameter
    }
}
