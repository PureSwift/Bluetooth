//
//  UInt40Tests.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/28/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Testing
import Foundation
@testable import Bluetooth

@Suite struct UInt40Tests {
    
    @Test func bitWidth() {
        
        #expect(UInt40.bitWidth == MemoryLayout<UInt40.ByteValue>.size * 8)
        #expect(UInt40.bitWidth == 40)
    }
    
    @Test func equatable() {
        
        #expect(UInt40.zero == 0)
        #expect(UInt40.min == 0)
        #expect(UInt40.max == 1099511627775)
        #expect(UInt40.max == 0xFFFFFFFFFF)
    }

    @Test func hashable() {
        
        #expect(UInt40.max.hashValue != UInt64.max.hashValue)
    }
    
    @Test func expressibleByIntegerLiteral() {
        
        let values: [(UInt40, String)] = [
            (UInt40.zero,   "0"),
            (0x0000000000,  "0"),
            (0x0000000001,  "1"),
            (0x0000000020,  "32"),
            (12345678,      "12345678"),
            (1099511627775, "1099511627775"),
            (0xFFFFFFFFFF,  "1099511627775")
        ]
        
        values.forEach { #expect($0.description == $1)  }
    }
}
