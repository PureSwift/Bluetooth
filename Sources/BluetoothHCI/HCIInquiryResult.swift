//
//  HCIInquiryResult.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 7/30/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// Inquiry Result Event
///
/// The Inquiry Result event indicates that a BR/EDR Controller or multiple BR/ EDR Controllers have responded so far during the current Inquiry process. This event will be sent from the BR/EDR Controller to the Host as soon as an Inquiry Response from a remote device is received if the remote device supports only mandatory paging scheme. The BR/EDR Controller may queue these Inquiry Responses and send multiple BR/EDR Controllers information in one Inquiry Result event. The event can be used to return one or more Inquiry responses in one event.
@frozen
public struct HCIInquiryResult: HCIEventParameter {
    
    public static let event = HCIGeneralEvent.inquiryResult
    
    public static let length = 2 + 1 + Report.length
    
    public let reports: [Report]
    
    public init?(data: Data) {
        
        guard data.count >= type(of: self).length
            else { return nil }
        
        let reportCount = Int(data[2])
        
        guard (data.count - 2) / Report.length >= reportCount
            else { return nil }
        
        var reports = [Report]()
        reports.reserveCapacity(reportCount)
        
        var offset = 3
        for _ in 0 ..< reportCount {
            
            let reportBytes = Data(data.suffix(from: offset))
            
            guard let report = Report(data: reportBytes)
                else { return nil }
            
            offset += Report.length
            reports.append(report)
        }
        
        self.reports = reports
    }
}

extension HCIInquiryResult {
    
    public struct Report {
        
        public static let length = 6 + 1 + 1 + 1 + 3 + 2
        
        public let address: BluetoothAddress
        
        public let pageScanRepetitionMode: PageScanRepetitionMode
        
        public let classOfDevice: ClassOfDevice
        
        public let clockOffset: ClockOffset
        
        public init?(data: Data) {
            
            let address = BluetoothAddress(littleEndian: BluetoothAddress(bytes: (data[0], data[1], data[2], data[3], data[4], data[5])))
            
            self.address = address
            
            self.pageScanRepetitionMode = PageScanRepetitionMode(rawValue: data[6])
            
            guard let classOfDevice = ClassOfDevice(data: data.subdataNoCopy(in: 9 ..< 12))
                else { return nil }
            
            let clockOffset = ClockOffset(rawValue: UInt16(littleEndian: UInt16(bytes: (data[12], data[13]))))
            
            self.clockOffset = clockOffset
            self.classOfDevice = classOfDevice
        }
        
    }
}

extension HCIInquiryResult {
    
    public struct ClockOffset: RawRepresentable {
        
        public static let length = MemoryLayout<UInt16>.size
        
        public let rawValue: UInt16
        
        public init(rawValue: UInt16) {
            
            self.rawValue = rawValue
        }
    }
}
