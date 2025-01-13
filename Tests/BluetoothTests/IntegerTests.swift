//
//  IntegerTests.swift
//  BluetoothTests
//
//  Created by Alsey Coleman Miller on 6/19/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation
import Testing
@testable import Bluetooth

@Suite struct IntegerTests {
    
    @Test func test2Bit() {
        
        let bit2Range = UInt8(0) ... UInt8(3)
        
        for enum1 in bit2Range {
            
            for enum2 in bit2Range {
                
                for enum3 in bit2Range {
                    
                    for enum4 in bit2Range {
                        
                        let packedByte = UInt8.bit2(enum1, enum2, enum3, enum4)
                        let bit2Values = packedByte.bit2()
                        
                        #expect(bit2Values.0 == enum1)
                        #expect(bit2Values.1 == enum2)
                        #expect(bit2Values.2 == enum3)
                        #expect(bit2Values.3 == enum4)
                    }
                }
            }
        }
    }
}
