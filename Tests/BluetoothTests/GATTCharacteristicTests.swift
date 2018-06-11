//
//  GATTCharacteristicTests.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/10/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import XCTest
import Foundation
@testable import Bluetooth

final class GATTCharacteristicTests: XCTestCase {
    
    static let allTests = [
        ("testBatteryLevel", testBatteryLevel),
        ("testSupportedNewAlertCategory", testSupportedNewAlertCategory),
        ("testAlertCategoryIdBitMask", testAlertCategoryIdBitMask),
        ("testNewAlert", testNewAlert),
        ("testAlertCategoryID", testAlertCategoryID),
        ("testSupportedUnreadAlertCategory", testSupportedUnreadAlertCategory),
        ("testUnreadAlertStatus", testUnreadAlertStatus),
        ("testAlertNotificationControlPoint", testAlertNotificationControlPoint)
    ]
    
    func testBatteryLevel() {
        
        let data = Data([0x22])
        
        let batteryLevel: UInt8 = 34
        
        guard let characteristic = GATTBatteryLevel(data: data)
            else { XCTFail("Could not decode from bytes"); return }
        
        XCTAssertEqual(characteristic.data, data)
        XCTAssertEqual(characteristic.level, batteryLevel)
        XCTAssertEqual(characteristic.description, "34%")
        XCTAssertEqual(GATTBatteryLevel.unit.description, "27AD (percentage)")
        XCTAssertEqual(GATTBatteryLevel.unit.type, "org.bluetooth.unit.percentage")
    }
    
    func testSupportedNewAlertCategory() {
        
        let data = Data([0x0a])
        
        guard let characteristic = GATTSupportedNewAlertCategory(data: data)
            else { XCTFail("Could not decode from bytes"); return }
        
        XCTAssertEqual(characteristic.data, data)
        XCTAssertEqual(characteristic.categories, [.call, .email], "The value 0x0a is interpreted that this server supports “Call” and “Email” categories.")
    }
    
    func testAlertCategoryIdBitMask() {
        
        let data = Data([0x03])
        
        guard let characteristic = GATTAlertCategoryBitMask(data: data)
            else { XCTFail("Could not decode from bytes"); return }
        
        XCTAssertEqual(characteristic.data, data)
        XCTAssertEqual(characteristic.categories, [.simpleAlert, .email], "The value 0x03 is interpreted as “Simple Alert and Email bits set")
    }
    
    func testNewAlert() {
        
        typealias Information = GATTNewAlert.Information
        
        let data = Data([0x01, 0x04, 0x52, 0x69, 0x63, 0x68, 0x61, 0x72, 0x64])
        
        guard let characteristic = GATTNewAlert(data: data)
            else { XCTFail("Could not decode from bytes"); return }
        
        XCTAssertEqual(characteristic.data, data)
        
        // The value 0x01, 0x04, 0x52, 0x69, 0x63, 0x68, 0x61, 0x72, 0x64 are interpreted that the server has 4 new email messages and the last message was sent by “Richard”.
        XCTAssertEqual(characteristic.category, .email)
        XCTAssertEqual(characteristic.newAlertsCount, 4)
        XCTAssertEqual(characteristic.information.rawValue, "Richard")
        
        XCTAssertNil(Information(rawValue: "Alsey Coleman Miller ABCDEFGHIJKLMNOP"))
        XCTAssertNotNil(Information(rawValue: ""))
        XCTAssertNotNil(Information(rawValue: "Alsey Coleman"))
    }
    
    func testAlertCategoryID() {
        
        let data = Data([0x01])
        
        guard let characteristic = GATTAlertCategory(data: data)
            else { XCTFail("Could not decode from bytes"); return }
        
        XCTAssertEqual(characteristic.data, data)
        
        XCTAssertEqual(characteristic, .email, "The value 0x01 is interpreted as “Email”")
    }
    
    func testSupportedUnreadAlertCategory() {
        
        let data = Data([0x03])
        
        guard let characteristic = GATTSupportedUnreadAlertCategory(data: data)
            else { XCTFail("Could not decode from bytes"); return }
        
        XCTAssertEqual(characteristic.data, data)
        XCTAssertEqual(characteristic, GATTSupportedUnreadAlertCategory(data: Data([0x03, 0x00])))
        XCTAssertEqual(characteristic.categories, [.email, .simpleAlert], "The value 0x03 is interpreted that this server supports “Simple Alert” and “Email” categories for unread alert.")
        
    }
    
    func testUnreadAlertStatus() {
        
        let data = Data([0x01, 0x04])
        
        guard let characteristic = GATTUnreadAlertStatus(data: data)
            else { XCTFail("Could not decode from bytes"); return }
        
        XCTAssertEqual(characteristic.data, data)
        
        // The value 0x01, 0x04 are interpreted that the server has 4 unread messages in Email category.
        XCTAssertEqual(characteristic.category, .email)
        XCTAssertEqual(characteristic.unreadCount, 4)
    }
    
    func testAlertNotificationControlPoint() {
        
        let data = Data([0x02, 0x01])
        
        guard let characteristic = GATTAlertNotificationControlPoint(data: data)
            else { XCTFail("Could not decode from bytes"); return }
        
        XCTAssertEqual(characteristic.data, data)
        
        // The data 0x02 0x01 interprets “Disable New Incoming Notification for Email Category”.
        XCTAssertEqual(characteristic.command, .disableNewIncomingAlertNotification)
        XCTAssertEqual(characteristic.category, .email)
    }
    
}
