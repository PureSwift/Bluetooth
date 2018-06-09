//
//  GATTAlertNotificationServiceTests.swift
//  BluetoothTests
//
//  Created by Alsey Coleman Miller on 6/8/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import XCTest
import Foundation
@testable import Bluetooth

final class GATTAlertNotificationTests: XCTestCase {
    
    static let allTests = [
        ("testSupportedNewAlertCategory", testSupportedNewAlertCategory),
        ("testAlertCategoryIdBitMask", testAlertCategoryIdBitMask),
        ("testNewAlert", testNewAlert)
    ]
    
    func testSupportedNewAlertCategory() {
        
        guard let characteristic = GATTAlertNotificationService.SupportedNewAlertCategory(data: Data([0x0a, 0x00]))
            else { XCTFail("Could not decode from bytes"); return }
        
        XCTAssertEqual(characteristic.alertCategoryBitMask.bitMask0, [.call, .email],
                       "The value 0x0a is interpreted that this server supports “Call” and “Email” categories.")
    }
    
    func testAlertCategoryIdBitMask() {
        
        guard let characteristic = GATTAlertNotificationService.AlertCategoryIdBitMask(data: Data([0x03, 0x00]))
            else { XCTFail("Could not decode from bytes"); return }
        
        XCTAssertEqual(characteristic.bitMask0, [.simpleAlert, .email],
                       "The value 0x03 is interpreted as “Simple Alert and Email bits set")
    }
    
    func testNewAlert() {
        
        let data = Data([0x01, 0x04, 0x52, 0x69, 0x63, 0x68, 0x61, 0x72, 0x64])
        
        guard let characteristic = GATTAlertNotificationService.NewAlert(data: data)
            else { XCTFail("Could not decode from bytes"); return }
        
        // The value 0x01, 0x04, 0x52, 0x69, 0x63, 0x68, 0x61, 0x72, 0x64 are interpreted that the server has 4 new email messages and the last message was sent by “Richard”.
        XCTAssertEqual(characteristic.categoryID, .email)
        XCTAssertEqual(characteristic.numberOfNewAlerts, 4)
        XCTAssertEqual(characteristic.textStringInformation, "Richard")
    }
}
