//
//  IntegerTests.swift
//  BluetoothTests
//
//  Created by Alsey Coleman Miller on 6/19/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation
import XCTest
import Foundation
@testable import Bluetooth

final class IntegerTests: XCTestCase {
    
    static let allTests = [
        ("test2Bit", test2Bit)
        ]
    
    func test2Bit() {
        
        let bit2Range = UInt8(0) ... UInt8(3)
        
        for enum1 in bit2Range {
            
            for enum2 in bit2Range {
                
                for enum3 in bit2Range {
                    
                    for enum4 in bit2Range {
                        
                        let packedByte = UInt8.bit2(enum1, enum2, enum3, enum4)
                        let bit2Values = packedByte.bit2()
                        
                        XCTAssertEqual(bit2Values.0, enum1)
                        XCTAssertEqual(bit2Values.1, enum2)
                        XCTAssertEqual(bit2Values.2, enum3)
                        XCTAssertEqual(bit2Values.3, enum4)
                    }
                }
            }
        }
    }
}
