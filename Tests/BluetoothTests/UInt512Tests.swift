//
//  UInt512Tests.swift
//  Bluetooth
//
//  Created by Marco Estrella on 4/21/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Testing
import Foundation
@testable import Bluetooth

@Suite struct UInt512Tests {
    
    @Test func bitWidth() {
        
        #expect(UInt512.bitWidth == MemoryLayout<UInt512.ByteValue>.size * 8)
        #expect(UInt512.bitWidth == 512)
    }
    
    @Test func hashable() {
        
        #expect(UInt512.max.hashValue != 0)
    }
    
    @Test func expressibleByIntegerLiteral() {
        
        let values: [(UInt512, String)] = [
            (UInt512.zero, "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"),
            (0x0, "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"),
            (0x1, "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001"),
            (0x20, "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000020"),
            (0xDCBABEBAAFDE0001, "0x0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000DCBABEBAAFDE0001")
        ]
        
        values.forEach { #expect($0.description == $1)  }
        
        #expect(UInt512.zero == 0)
    }
}
