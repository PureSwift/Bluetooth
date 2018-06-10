//
//  GATTBatteryTests.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/10/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import XCTest
import Foundation
@testable import Bluetooth

final class GATTBatteryTests: XCTestCase {
    
    func testBatteryLevel() {
        
        let data = Data([0x22])
        
        let batteryLevel: UInt8 = 34
        
        guard let characteristic = GATTBatteryService.BatteryLevel(data: data)
            else { XCTFail("Could not decode from bytes"); return }
        
        XCTAssertEqual(characteristic.data, data)
        XCTAssertEqual(characteristic.level, batteryLevel)
        XCTAssertEqual(characteristic.description, "34%")
        XCTAssertEqual(GATTBatteryService.BatteryLevel.unit.description, "0x27AD (percentage)")
        XCTAssertEqual(GATTBatteryService.BatteryLevel.unit.type, "org.bluetooth.unit.percentage")
    }
}
