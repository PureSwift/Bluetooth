//
//  UInt48.swift
//  BluetoothTests
//
//  Created by Carlos Duclos on 7/11/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Testing
import Foundation
@testable import Bluetooth

@Suite struct UInt48Tests {
    
    @Test func bitWidth() {
        
        #expect(UInt48.bitWidth == MemoryLayout<UInt48.ByteValue>.size * 8)
        #expect(UInt48.bitWidth == 48)
    }
    
    @Test func comparable() {
        
        #expect(UInt48.zero == 0)
        #expect(UInt48.min == 0)
        #expect(UInt48.max == 281474976710655)
        #expect(UInt48.max == 0xFFFFFFFFFFFF)
        #expect(0xFFFFFFFFFFFF <= UInt48.max)
        #expect(0xFFFFFFFFFFFE < UInt48.max)
        #expect(0xFFFFFFFFFFFF >= UInt48.max)
        #expect(UInt48.max > 0xFFFFFFFFFFFE)
    }
    
    @Test func hashable() {
        
        #expect(UInt48.max.hashValue != 0)
    }
    
    @Test func expressibleByIntegerLiteral() {
        
        let values: [(UInt48, String)] = [
            (.zero,             "0"),
            (0x0000000000,      "0"),
            (0x0000000001,      "1"),
            (0x0000000020,      "32"),
            (123456789,         "123456789"),
            (281474976710655,   "281474976710655"),
            (0xFFFFFFFFFFFF,    "281474976710655")
        ]
        
        values.forEach { #expect($0.description == $1)  }
    }
    
    @Test func data() {
        
        let data = Data([0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF])
        
        #expect(UInt48(data: data) == 281474976710655)
        #expect(Data(UInt48.max) == data)
    }
}
