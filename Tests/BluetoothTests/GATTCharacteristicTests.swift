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
        ("testDateTime", testDateTime),
        ("testBatteryLevel", testBatteryLevel),
        ("testSupportedNewAlertCategory", testSupportedNewAlertCategory),
        ("testAlertCategoryIdBitMask", testAlertCategoryIdBitMask),
        ("testNewAlert", testNewAlert),
        ("testAlertCategoryID", testAlertCategoryID),
        ("testSupportedUnreadAlertCategory", testSupportedUnreadAlertCategory),
        ("testUnreadAlertStatus", testUnreadAlertStatus),
        ("testAlertNotificationControlPoint", testAlertNotificationControlPoint),
        ("testBloodPressureMeasurement", testBloodPressureMeasurement),
        ("testAerobicHeartRateLowerLimit", testAerobicHeartRateLowerLimit),
        ("testAerobicHeartRateUpperLimit", testAerobicHeartRateUpperLimit),
        ("testAlertLevel", testAlertLevel),
        ("testAerobicThreshold", testAerobicThreshold),
        ("testAnaerobicHeartRateLowerLimit", testAnaerobicHeartRateLowerLimit),
        ("testAnaerobicHeartRateUpperLimit", testAnaerobicHeartRateUpperLimit)
    ]
    
    func testDateTime() {
        
        /// remove subsecond precision
        let date = Date(timeIntervalSinceReferenceDate: TimeInterval(Int(Date.timeIntervalSinceReferenceDate)))
        
        // Date conversion
        XCTAssertNotEqual(GATTDateTime().year, .unknown)
        XCTAssertNotEqual(GATTDateTime().month, .unknown)
        XCTAssertNotEqual(GATTDateTime().day, .unknown)
        XCTAssertEqual(GATTDateTime(date: Date(timeIntervalSinceReferenceDate: 0)).year.rawValue, 2001)
        XCTAssertEqual(GATTDateTime(date: Date(timeIntervalSinceReferenceDate: 0)).month, .january)
        XCTAssertEqual(GATTDateTime(date: Date(timeIntervalSinceReferenceDate: 0)).day.rawValue, 1)
        XCTAssertEqual(GATTDateTime(date: Date(timeIntervalSinceReferenceDate: 3600)).hour.rawValue, 1)
        XCTAssertEqual(GATTDateTime(date: Date(timeIntervalSinceReferenceDate: 60)).minute.rawValue, 1)
        XCTAssertEqual(GATTDateTime(date: Date(timeIntervalSinceReferenceDate: 30)).second.rawValue, 30)
        
        // Crashes on Linux
        // fatal error: copy(with:) is not yet implemented: file Foundation/NSCalendar.swift, line 1434
        #if os(macOS)
        XCTAssertEqual(Date(dateTime: GATTDateTime(date: date)), date)
        #endif
        
        // create valid values
        (1582...9999).forEach { XCTAssertNotNil(GATTDateTime.Year(rawValue: $0)) }
        XCTAssertEqual(GATTDateTime.Year(rawValue: 0), .unknown)
        (1...12).forEach { XCTAssertNotNil(GATTDateTime.Month(rawValue: $0)) }
        XCTAssertEqual(GATTDateTime.Month(rawValue: 0), .unknown)
        (1...31).forEach { XCTAssertNotNil(GATTDateTime.Day(rawValue: $0)) }
        XCTAssertEqual(GATTDateTime.Day(rawValue: 0), .unknown)
        (0...23).forEach { XCTAssertNotNil(GATTDateTime.Hour(rawValue: $0)) }
        (0...59).forEach { XCTAssertNotNil(GATTDateTime.Minute(rawValue: $0)) } 
        (0...59).forEach { XCTAssertNotNil(GATTDateTime.Second(rawValue: $0)) }
        
        // test decoding
        XCTAssertNil(GATTDateTime(data: Data()), "Invalid length")
        XCTAssertNil(GATTDateTime(data: Data([0x00])), "Invalid length")
        XCTAssertNil(GATTDateTime(data: Data([0x00, 0x00])), "Invalid length")
        XCTAssertNil(GATTDateTime(data: Data([0x00, 0x00, 0x00])), "Invalid length")
        XCTAssertNil(GATTDateTime(data: Data([0x00, 0x00, 0x00, 0x00])), "Invalid length")
        XCTAssertNil(GATTDateTime(data: Data([0xFF, 0xFF, 0xFF, 0xFF, 0xFF])), "Invalid length")
        XCTAssertNil(GATTDateTime(data: Data([0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF])), "Invalid values")
        XCTAssertNil(GATTDateTime(data: Data([0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF])), "Invalid values")
        XCTAssertNil(GATTDateTime(data: Data([0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF])), "Invalid length")
        
        // encoding
        do {
            
            let data = Data([0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00])
            
            guard let characteristic = GATTDateTime(data: data)
                else { XCTFail(); return }
            
            XCTAssertEqual(characteristic.data, data)
            XCTAssertEqual(characteristic.year, .unknown)
            XCTAssertEqual(characteristic.month, .unknown)
            XCTAssertEqual(characteristic.day, .unknown)
            XCTAssertEqual(characteristic.hour, .min)
            XCTAssertEqual(characteristic.minute, .min)
            XCTAssertEqual(characteristic.second, .min)
        }
        
        // encoding
        do {
            
            let data = Data([203, 7, 4, 24, 12, 5, 30])
            
            guard let characteristic = GATTDateTime(data: data)
                else { XCTFail(); return }
            
            XCTAssertEqual(characteristic.data, data)
            XCTAssertEqual(characteristic.year.rawValue, 1995)
            XCTAssertEqual(characteristic.month, .april)
            XCTAssertEqual(characteristic.day.rawValue, 24)
            XCTAssertEqual(characteristic.hour.rawValue, 12)
            XCTAssertEqual(characteristic.minute.rawValue, 5)
            XCTAssertEqual(characteristic.second.rawValue, 30)
        }
    }
    
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
    
    func testBloodPressureMeasurement() {
        
        typealias Unit = GATTBloodPressureMeasurement.Unit
        typealias CompoundValue = GATTBloodPressureMeasurement.CompoundValue
        typealias MeasurementStatus = GATTBloodPressureMeasurement.MeasurementStatus
        
        XCTAssertEqual(Unit.mmHg.unit, .millimetreOfMercury)
        XCTAssertEqual(Unit.kPa.unit, .pascalPressure)
        XCTAssertEqual(.mmHg, Unit(unit: .millimetreOfMercury))
        XCTAssertEqual(.kPa, Unit(unit: .pascalPressure))
        
        let characteristic = GATTBloodPressureMeasurement(compoundValue:
            CompoundValue(unit: .kPa,
                          systolic: SFloat(builtin: 0xAA),
                          diastolic: SFloat(builtin: 0xBB),
                          meanArterialPressure: SFloat(builtin: 0xCC)),
            userIdentifier: 0x1B,
            measurementStatus: .all
        )
        
        XCTAssertEqual(Array(GATTBloodPressureMeasurement(data: characteristic.data)?.data ?? Data()), Array(characteristic.data))
    }
    
    func testAerobicHeartRateLowerLimit() {
        
        typealias BeatsPerMinute = GATTAerobicHeartRateLowerLimit.BeatsPerMinute
        
        XCTAssertNil(GATTAerobicHeartRateLowerLimit(data: Data([0x3d, 0x72])))
        
        let data = Data([0x22])
        
        let beats: BeatsPerMinute = 34
        
        guard let characteristic = GATTAerobicHeartRateLowerLimit(data: data)
            else { XCTFail("Could not decode from bytes"); return }
        
        XCTAssertEqual(characteristic.data, data)
        XCTAssertEqual(characteristic.beats, beats)
        XCTAssertEqual(characteristic.description, "34")
        XCTAssertEqual(beats.description, "34")
        XCTAssertEqual(GATTAerobicHeartRateLowerLimit.uuid, .aerobicHeartRateLowerLimit)
        XCTAssertEqual(BeatsPerMinute.unitType, .beatsPerMinute)
    }
    
    func testAerobicHeartRateUpperLimit() {
        
        typealias BeatsPerMinute = GATTAerobicHeartRateUpperLimit.BeatsPerMinute
        
        XCTAssertNil(GATTAerobicHeartRateUpperLimit(data: Data([0x3d, 0x72])))
        
        let data = Data([0x22])
        
        let beats: BeatsPerMinute = 34
        
        guard let characteristic = GATTAerobicHeartRateUpperLimit(data: data)
            else { XCTFail("Could not decode from bytes"); return }
        
        XCTAssertEqual(characteristic.data, data)
        XCTAssertEqual(characteristic.beats, beats)
        XCTAssertEqual(characteristic.description, "34")
        XCTAssertEqual(beats.description, "34")
        XCTAssertEqual(GATTAerobicHeartRateUpperLimit.uuid, .aerobicHeartRateUpperLimit)
        XCTAssertEqual(BeatsPerMinute.unitType, .beatsPerMinute)
    }
    
    func testAlertLevel() {
        
        let data = Data([0x01])
        
        guard let characteristic = GATTAlertLevel(data: data)
            else { XCTFail("Could not decode from bytes"); return }
        
        XCTAssertEqual(characteristic.data, data)
        XCTAssertEqual(characteristic, .mild, "The value 0x01 should be interpreted as mild Alert")
        XCTAssertEqual(GATTAlertLevel.uuid, .alertLevel)
    }
    
    func testAerobicThreshold() {
        
        typealias BeatsPerMinute = GATTAerobicThreshold.BeatsPerMinute
        
        XCTAssertNil(GATTAerobicThreshold(data: Data([0x4f, 0x45])))
        
        let data = Data([0x32])
        
        let beats: BeatsPerMinute = 50
        
        guard let characteristic = GATTAerobicThreshold(data: data)
            else { XCTFail("Could not decode from bytes"); return }
        
        XCTAssertEqual(characteristic.data, data)
        XCTAssertEqual(characteristic.beats, beats)
        XCTAssertEqual(characteristic.description, "50")
        XCTAssertEqual(beats.description, "50")
        XCTAssertEqual(GATTAerobicThreshold.uuid, .aerobicThreshold)
        XCTAssertEqual(BeatsPerMinute.unitType, .beatsPerMinute)
    }
    
    func testAge() {
        
        typealias Year = GATTAge.Year
        
        XCTAssertNil(GATTAge(data: Data([0x4f, 0x45])))
        
        let data = Data([0x32])
        
        let year: Year = 50
        
        guard let characteristic = GATTAge(data: data)
            else { XCTFail("Could not decode from bytes"); return }
        
        XCTAssertEqual(characteristic.data, data)
        XCTAssertEqual(characteristic.year, year)
        XCTAssertEqual(characteristic.description, "50")
        XCTAssertEqual(year.description, "50")
        XCTAssertEqual(GATTAge.uuid, .age)
        XCTAssertEqual(Year.unitType, .year)
    }
    
    func testAnaerobicHeartRateLowerLimit() {
        
        typealias BeatsPerMinute = GATTAnaerobicHeartRateLowerLimit.BeatsPerMinute
        
        XCTAssertNil(GATTAnaerobicHeartRateLowerLimit(data: Data([0x3d, 0x72])))
        
        let data = Data([0x22])
        
        let beats: BeatsPerMinute = 34
        
        guard let characteristic = GATTAnaerobicHeartRateLowerLimit(data: data)
            else { XCTFail("Could not decode from bytes"); return }
        
        XCTAssertEqual(characteristic.data, data)
        XCTAssertEqual(characteristic.beats, beats)
        XCTAssertEqual(characteristic.description, "34")
        XCTAssertEqual(beats.description, "34")
        XCTAssertEqual(GATTAnaerobicHeartRateLowerLimit.uuid, .anaerobicHeartRateLowerLimit)
        XCTAssertEqual(GATTAnaerobicHeartRateLowerLimit(data: data), GATTAnaerobicHeartRateLowerLimit(data: data))
        XCTAssertEqual(BeatsPerMinute.unitType, .beatsPerMinute)
        XCTAssertNotEqual(GATTAnaerobicHeartRateLowerLimit(data: Data([0x4f])), GATTAnaerobicHeartRateLowerLimit(data: Data([0x5e])))
    }
    
    func testAnaerobicHeartRateUpperLimit() {
        
        typealias BeatsPerMinute = GATTAnaerobicHeartRateUpperLimit.BeatsPerMinute
        
        XCTAssertNil(GATTAnaerobicHeartRateUpperLimit(data: Data([0x3d, 0x72])))
        
        let data = Data([0x22])
        
        let beats: BeatsPerMinute = 34
        
        guard let characteristic = GATTAnaerobicHeartRateUpperLimit(data: data)
            else { XCTFail("Could not decode from bytes"); return }
        
        XCTAssertEqual(characteristic.data, data)
        XCTAssertEqual(characteristic.beats, beats)
        XCTAssertEqual(characteristic.description, "34")
        XCTAssertEqual(beats.description, "34")
        XCTAssertEqual(GATTAnaerobicHeartRateUpperLimit.uuid, .anaerobicHeartRateUpperLimit)
        XCTAssertEqual(GATTAnaerobicHeartRateUpperLimit(data: data), GATTAnaerobicHeartRateUpperLimit(data: data))
        XCTAssertEqual(BeatsPerMinute.unitType, .beatsPerMinute)
        XCTAssertNotEqual(GATTAnaerobicHeartRateUpperLimit(data: Data([0x4f])), GATTAnaerobicHeartRateUpperLimit(data: Data([0x5e])))
    }
}
