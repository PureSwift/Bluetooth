//
//  HCIPageScanRepetitionMode.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 7/30/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// The Page_Scan_Repetition_Mode parameter specifies the page scan repetition mode supported by the remote device with the BD_ADDR. This is the information that was acquired during the inquiry process.
@frozen
public struct PageScanRepetitionMode: RawRepresentable {
    
    public static let r1 = PageScanRepetitionMode(0x00)
    
    public static let r2 = PageScanRepetitionMode(0x01)
    
    public static let r3 = PageScanRepetitionMode(0x02)
    
    public var rawValue: UInt8
    
    public init(rawValue: UInt8) {
        
        self.rawValue = rawValue
    }
    
    private init(_ unsafe: UInt8) {
        
        self.rawValue = unsafe
    }
}
