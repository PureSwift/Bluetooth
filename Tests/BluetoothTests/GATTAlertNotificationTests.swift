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
        ("testNewAlert", testNewAlert),
        ("testAlertCategoryID", testAlertCategoryID),
        ("testSupportedUnreadAlertCategory", testSupportedUnreadAlertCategory),
        ("testUnreadAlertStatus", testUnreadAlertStatus),
        ("testAlertNotificationControlPoint", testAlertNotificationControlPoint)
    ]
    
    func testSupportedNewAlertCategory() {
        
        let data = Data([0x0a, 0x00])
        
        guard let characteristic = GATTAlertNotificationService.SupportedNewAlertCategory(data: data)
            else { XCTFail("Could not decode from bytes"); return }
        
        XCTAssertEqual(characteristic.data, data)
        
        XCTAssertEqual(characteristic.alertCategoryBitMask.bitMask0, [.call, .email], "The value 0x0a is interpreted that this server supports “Call” and “Email” categories.")
    }
    
    func testAlertCategoryIdBitMask() {
        
        let data = Data([0x03, 0x00])
        
        guard let characteristic = GATTAlertNotificationService.AlertCategoryIdBitMask(data: data)
            else { XCTFail("Could not decode from bytes"); return }
        
        XCTAssertEqual(characteristic.data, data)
        
        XCTAssertEqual(characteristic.bitMask0, [.simpleAlert, .email], "The value 0x03 is interpreted as “Simple Alert and Email bits set")
    }
    
    func testNewAlert() {
        
        let data = Data([0x01, 0x04, 0x52, 0x69, 0x63, 0x68, 0x61, 0x72, 0x64])
        
        guard let characteristic = GATTAlertNotificationService.NewAlert(data: data)
            else { XCTFail("Could not decode from bytes"); return }
        
        XCTAssertEqual(characteristic.data, data)
        
        // The value 0x01, 0x04, 0x52, 0x69, 0x63, 0x68, 0x61, 0x72, 0x64 are interpreted that the server has 4 new email messages and the last message was sent by “Richard”.
        XCTAssertEqual(characteristic.categoryID, .email)
        XCTAssertEqual(characteristic.newAlertsCount, 4)
        XCTAssertEqual(characteristic.information.rawValue, "Richard")
    }
    
    func testAlertCategoryID() {
        
        let data = Data([0x01])
        
        guard let characteristic = GATTAlertNotificationService.AlertCategoryID(data: data)
            else { XCTFail("Could not decode from bytes"); return }
        
        XCTAssertEqual(characteristic.data, data)
        
        XCTAssertEqual(characteristic, .email, "The value 0x01 is interpreted as “Email”")
       
    }
    
    func testSupportedUnreadAlertCategory() {
        
        let data = Data([0x03, 0x00])
        
        guard let characteristic = GATTAlertNotificationService.SupportedUnreadAlertCategory(data: data)
            else { XCTFail("Could not decode from bytes"); return }
        
        XCTAssertEqual(characteristic.data, data)
        
        XCTAssertEqual(characteristic.alertCategoryBitMask.bitMask0, [.email, .simpleAlert], "The value 0x03 is interpreted that this server supports “Simple Alert” and “Email” categories for unread alert.")
        
    }
    
    func testUnreadAlertStatus() {
        
        let data = Data([0x01, 0x04])
        
        guard let characteristic = GATTAlertNotificationService.UnreadAlertStatus(data: data)
            else { XCTFail("Could not decode from bytes"); return }
        
        XCTAssertEqual(characteristic.data, data)
        
        // The value 0x01, 0x04 are interpreted that the server has 4 unread messages in Email category.
        XCTAssertEqual(characteristic.categoryID, .email)
        XCTAssertEqual(characteristic.unreadCount, 4)
    }
    
    func testAlertNotificationControlPoint() {
        
        let data = Data([0x02, 0x01])
        
        guard let characteristic = GATTAlertNotificationService.AlertNotificationControlPoint(data: data)
            else { XCTFail("Could not decode from bytes"); return }
        
        XCTAssertEqual(characteristic.data, data)
        
        // The data 0x02 0x01 interprets “Disable New Incoming Notification for Email Category”.
        XCTAssertEqual(characteristic.commandID, .disableNewIncomingAlertNotification)
        XCTAssertEqual(characteristic.categoryID, .email)
    }
}
