//
//  HCIPageScanRepetitionMode.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 7/30/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// The Page_Scan_Repetition_Mode parameter specifies the page scan repetition mode supported by the remote device with the BD_ADDR. This is the information that was acquired during the inquiry process.
public enum PageScanRepetitionMode: UInt8 {
    
    // R0
    case r0 = 0x00
    
    // R1
    case r1 = 0x01
    
    // R2
    case r2 = 0x02
}
