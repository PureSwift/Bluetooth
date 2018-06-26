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
        ("testAltitude", testAltitude),
        ("testAerobicHeartRateLowerLimit", testAerobicHeartRateLowerLimit),
        ("testAerobicHeartRateUpperLimit", testAerobicHeartRateUpperLimit),
        ("testAlertLevel", testAlertLevel),
        ("testAerobicThreshold", testAerobicThreshold),
        ("testAnaerobicHeartRateLowerLimit", testAnaerobicHeartRateLowerLimit),
        ("testAnaerobicHeartRateUpperLimit", testAnaerobicHeartRateUpperLimit),
        ("testAge", testAge),
        ("testAnalog", testAnalog),
        ("testBarometricPressureTrend", testBarometricPressureTrend),
        ("testAnalogOutput", testAnalogOutput),
        ("testAlertStatus", testAlertStatus),
        ("testBodyCompositionMeasurement", testBodyCompositionMeasurement),
        ("testBootMouseInputReport", testBootMouseInputReport),
        ("testBootKeyboardOutputReport", testBootKeyboardOutputReport),
        ("testBootKeyboardInputReport", testBootKeyboardInputReport),
        ("testBatteryPowerState", testBatteryPowerState),
        ("testBodySensorLocation", testBodySensorLocation),
        ("testCentralAddressResolution", testCentralAddressResolution),
        ("testCGMSessionRunTime", testCGMSessionRunTime),
        ("testModelNumberString", testModelNumberString),
        ("testFirmwareRevisionString", testFirmwareRevisionString),
        ("testSoftwareRevisionString", testSoftwareRevisionString),
        ("testManufacturerNameString", testManufacturerNameString),
        ("testPnPID", testPnPID),
        ("testSystemID", testSystemID)
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
        
        guard let characteristic = GATTBatteryLevel(data: data)
            else { XCTFail("Could not decode from bytes"); return }
        
        guard let percentage = GATTBatteryPercentage(rawValue: 34)
            else { XCTFail("Could not init Percentage"); return }
        
        // test characteristic
        XCTAssertEqual(characteristic.data, data)
        XCTAssertEqual(characteristic.level, percentage)
        XCTAssertEqual(characteristic.description, "34%")
        XCTAssertNotNil(GATTBatteryLevel(level: percentage)) 
        XCTAssertEqual(GATTBatteryLevel.uuid, .batteryLevel)
        XCTAssertEqual(GATTBatteryLevel(data: data), GATTBatteryLevel(data: data))
        (0 ... 100).forEach { XCTAssertNotNil(GATTBatteryLevel(data: Data([$0]))) }
        (101 ... UInt8.max).forEach { XCTAssertNil(GATTBatteryLevel(data: Data([$0]))) }
        
        // test percentage
        XCTAssertEqual(GATTBatteryPercentage.unitType.description, "27AD (percentage)")
        XCTAssertEqual(GATTBatteryPercentage.unitType.type, "org.bluetooth.unit.percentage")
        XCTAssertEqual(GATTBatteryPercentage.unitType, .percentage)
        (0 ... 100).forEach { XCTAssertNotNil(GATTBatteryPercentage(rawValue: $0)) }
        (101 ... UInt8.max).forEach { XCTAssertNil(GATTBatteryPercentage(rawValue: $0)) }
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
    
    func testAltitude() {
        
        let data = Data([0x00, 0x00])
        let altitude = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
        
        guard let characteristics = GATTAltitude(data: data)
            else { XCTFail("Could not decode from bytes"); return }
        
        XCTAssertEqual(characteristics.data, data)
        XCTAssertEqual(characteristics.altitude, altitude)
        XCTAssertEqual(characteristics.description, "0")
        XCTAssertEqual(GATTAltitude.uuid, .altitude)
        XCTAssert(GATTAltitude(data: data) == GATTAltitude(data: data))
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
    
    func testAlertStatus() {
        
        let data = Data([0x37])
        
        guard let characteristic = GATTAlertStatus(data: data)
            else { XCTFail("Could not decode from bytes"); return }
        
        XCTAssertEqual(characteristic.data, data)
        XCTAssert(characteristic.states.contains(.ringer))
        XCTAssert(characteristic.states.contains(.displayAlert))
        XCTAssert(characteristic.states.contains(.vibrate))
        XCTAssert(characteristic.states.contains(GATTAlertStatus.State.all))
        XCTAssertEqual(characteristic.description, "55")
        XCTAssertEqual(GATTAlertStatus.uuid, .alertStatus)
        XCTAssert(GATTAlertStatus(data: data) == GATTAlertStatus(data: data))
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
    
    func testBarometricPressureTrend() {
        
        XCTAssertNil(GATTBarometricPressureTrend(data: Data([0x3d, 0x72])))
        XCTAssertNil(GATTBarometricPressureTrend(data: Data([0xFF])))
        
        let data = Data([0x01])
        
        guard let characteristic = GATTBarometricPressureTrend(data: data)
            else { XCTFail("Could not decode from bytes"); return }
        
        XCTAssertEqual(characteristic.data, data)
        XCTAssertEqual(GATTBarometricPressureTrend(data: Data([0x01])), GATTBarometricPressureTrend.continuouslyFalling)
        XCTAssertEqual(GATTBarometricPressureTrend.uuid, .barometricPressureTrend)
        XCTAssertEqual(GATTBarometricPressureTrend.unitType, .unitless)
        XCTAssertEqual(GATTBarometricPressureTrend(data: data), GATTBarometricPressureTrend(data: data))
    }
    
    func testAnalogOutput() {
        
        let data = Data([0x00, 0x00])
        let output = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
        
        guard let characteristics = GATTAnalogOutput(data: data)
        else { XCTFail("Could not decode from bytes"); return }
        
        XCTAssertEqual(characteristics.data, data)
        XCTAssertEqual(characteristics.output, output)
        XCTAssertEqual(characteristics.description, "0")
        XCTAssertEqual(GATTAnalogOutput.uuid, .analogOutput)
        XCTAssertEqual(GATTAnalogOutput(data: data), GATTAnalogOutput(data: data))
    }
    
    func testAnalog() {
        
        let data = Data([0x00, 0x00])
        let analog = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
        
        guard let characteristics = GATTAnalog(data: data)
            else { XCTFail("Could not decode from bytes"); return }
        
        XCTAssertEqual(characteristics.data, data)
        XCTAssertEqual(characteristics.analog, analog)
        XCTAssertEqual(characteristics.description, "0")
        XCTAssertEqual(GATTAnalog.uuid, .analog)
        XCTAssertEqual(GATTAnalog(data: data), GATTAnalog(data: data))
    }
    
    func testBootMouseInputReport() {
        
        XCTAssertNil(GATTBootMouseInputReport(data: Data([0x3d, 0x72])))
        
        let data = Data([0x01])
        
        guard let characteristic = GATTBootMouseInputReport(data: data)
            else { XCTFail("Could not decode from bytes"); return }
        
        XCTAssertEqual(characteristic.data, data)
        XCTAssertEqual(characteristic.description, "1")
        XCTAssertEqual(characteristic, 1)
        XCTAssertEqual(GATTBootMouseInputReport.uuid, .bootMouseInputReport)
    }
    
    func testBootKeyboardInputReport() {
        
        XCTAssertNil(GATTBootKeyboardInputReport(data: Data([0x3d, 0x72])))
        
        let data = Data([0x01])
        
        guard let characteristic = GATTBootKeyboardInputReport(data: data)
            else { XCTFail("Could not decode from bytes"); return }
        
        XCTAssertEqual(characteristic.data, data)
        XCTAssertEqual(characteristic.description, "1")
        XCTAssertEqual(characteristic, 1)
        XCTAssertEqual(GATTBootKeyboardInputReport.uuid, .bootKeyboardInputReport)
    }
    
    func testBootKeyboardOutputReport() {
        
        XCTAssertNil(GATTBootKeyboardOutputReport(data: Data([0x3d, 0x72])))
        
        let data = Data([0x01])
        
        guard let characteristic = GATTBootKeyboardOutputReport(data: data)
            else { XCTFail("Could not decode from bytes"); return }
        
        XCTAssertEqual(characteristic.data, data)
        XCTAssertEqual(characteristic.description, "1")
        XCTAssertEqual(characteristic, 1)
        XCTAssertEqual(GATTBootKeyboardOutputReport.uuid, .bootKeyboardOutputReport)
    }
    
    func testBatteryPowerState() {
        
        let data = Data([0b00_01_10_11])
        
        guard let characteristic = GATTBatteryPowerState(data: data)
            else { XCTFail("Could not decode from bytes"); return }
        
        XCTAssertEqual(characteristic.data, data)
        XCTAssertEqual(characteristic.presentState, .unknown)
        XCTAssertEqual(characteristic.dischargeState, .notSupported)
        XCTAssertEqual(characteristic.chargeState, .notCharging)
        XCTAssertEqual(characteristic.levelState, .criticallyLow)
        XCTAssertEqual(GATTBatteryPowerState.uuid, .batteryPowerState)
        XCTAssertEqual(GATTBatteryPowerState(data: data), GATTBatteryPowerState(data: data))
    }
    
    func testBodySensorLocation() {
        
        let data = Data([0x01])
        
        guard let characteristic = GATTBodySensorLocation(data: data)
            else { XCTFail("Could not decode from bytes"); return }
        
        XCTAssertEqual(characteristic.data, data, "Encoded data does not match expected encoded data")
        
        // enum values
        XCTAssertEqual(GATTBodySensorLocation(data: Data([0x00])), .other, "The value 0x00 should be interpreted as Other")
        XCTAssertEqual(GATTBodySensorLocation(data: Data([0x01])), .chest, "The value 0x01 should be interpreted as Chest")
        XCTAssertEqual(GATTBodySensorLocation(data: Data([0x02])), .wrist, "The value 0x02 should be interpreted as Wrist")
        XCTAssertEqual(GATTBodySensorLocation(data: Data([0x03])), .finger, "The value 0x03 should be interpreted as Finger")
        XCTAssertEqual(GATTBodySensorLocation(data: Data([0x04])), .hand, "The value 0x04 should be interpreted as Hand")
        XCTAssertEqual(GATTBodySensorLocation(data: Data([0x05])), .earLobe, "The value 0x05 should be interpreted as Ear Lobe")
        XCTAssertEqual(GATTBodySensorLocation(data: Data([0x06])), .foot, "The value 0x06 should be interpreted as Foot")
        
        // text values
        XCTAssertEqual(GATTBodySensorLocation(data: Data([0x00]))?.description, "Other", "The value 0x00 should be interpreted as Other")
        XCTAssertEqual(GATTBodySensorLocation(data: Data([0x01]))?.description, "Chest", "The value 0x01 should be interpreted as Chest")
        XCTAssertEqual(GATTBodySensorLocation(data: Data([0x02]))?.description, "Wrist", "The value 0x02 should be interpreted as Wrist")
        XCTAssertEqual(GATTBodySensorLocation(data: Data([0x03]))?.description, "Finger", "The value 0x03 should be interpreted as Finger")
        XCTAssertEqual(GATTBodySensorLocation(data: Data([0x04]))?.description, "Hand", "The value 0x04 should be interpreted as Hand")
        XCTAssertEqual(GATTBodySensorLocation(data: Data([0x05]))?.description, "Ear Lobe", "The value 0x05 should be interpreted as Ear Lobe")
        XCTAssertEqual(GATTBodySensorLocation(data: Data([0x06]))?.description, "Foot", "The value 0x06 should be interpreted as Foot")
        
        // GATT characteristic UUID
        XCTAssertEqual(GATTBodySensorLocation.uuid, .bodySensorLocation)
        
        // equality
        XCTAssertEqual(GATTBodySensorLocation(data: data), GATTBodySensorLocation(data: data))
    }
    
    func testCentralAddressResolution() {
        
        let data = Data([0x01])
        
        guard let characteristic = GATTCentralAddressResolution(data: data)
            else { XCTFail("Could not decode from bytes"); return }
        
        XCTAssertEqual(characteristic.data, data, "Encoded data does not match expected encoded data")
        XCTAssertEqual(characteristic, true, "The value 0x01 should be interpreted as Supported")
        XCTAssertEqual(GATTCentralAddressResolution.uuid, .centralAddressResolution)
        XCTAssertEqual(GATTCentralAddressResolution(data: Data([0x00])), false, "The value 0x00 should be interpreted as Not Supported")
    }
    

    func testBodyCompositionMeasurement() {
        
        let emptyUnit16 = UInt16(littleEndian: UInt16(bytes: (0x00, 0x00)))
        let data = Data([0x00, 0x00, 0x00, 0x00])
        
        typealias massUnit = GATTBodyCompositionMeasurement.MassUnit
        typealias lengthUnit = GATTBodyCompositionMeasurement.LengthUnit
        
        let kilogram = massUnit(unit: .kilogram)
        let pound = massUnit(unit: .pound)
        let inch = lengthUnit(unit: .inch)
        
        
        let SIMass = GATTBodyMass(rawValue: emptyUnit16, unit: massUnit(rawValue: 0x2702)!)
        let ImperialMass = GATTBodyMass(rawValue: emptyUnit16, unit: massUnit(rawValue: 0x27B8)!)
        
        let SILenght = GATTBodyLength(rawValue: emptyUnit16, unit: lengthUnit(rawValue: 0x2701)!)
        let ImperialLenght = GATTBodyLength(rawValue: emptyUnit16, unit: lengthUnit(rawValue: 0x27A2)!)
        
        let Joule = GATTBodyEnergy(rawValue: emptyUnit16)
        let ohm = GATTBodyResistance(rawValue: emptyUnit16)
        
        let percentage = GATTBodyPercentage(rawValue: emptyUnit16)
        
        let integerPercentage = GATTBodyPercentage(integerLiteral: 50)
        
        let timeStamp = GATTDateTime(date: Date())
        let id = UInt8(bitPattern: 0x05)
        
        let complexCharacteristic = GATTBodyCompositionMeasurement(bodyFatPercentage: percentage, massUnit: pound!, lengthUnit: inch!, timeStamp: timeStamp, userIdentifier: id, basalMetabolism: Joule, musclePercentage: integerPercentage, muscleMass: ImperialMass, fatFreeMass: ImperialMass, softLeanMass: ImperialMass, bodyWaterMass: ImperialMass, impedance: ohm, weight: ImperialMass, height: ImperialLenght)
        
        let complexData = complexCharacteristic.data
        let complexFlag = complexCharacteristic.flags
        
        XCTAssertEqual(complexFlag, complexCharacteristic.flags)
        XCTAssertEqual(complexData, complexCharacteristic.data)
        
        guard let complexCharacteristic2 = GATTBodyCompositionMeasurement(data: complexData)
            else { XCTFail("Could not decode from bytes"); return }
        XCTAssertEqual(complexCharacteristic2.data, complexData)
        
        XCTAssertEqual(massUnit(unit: .kilogram), SIMass?.unit)
        XCTAssertNil(massUnit(unit: .absorbedDose))
        XCTAssertEqual(kilogram?.unit, UnitIdentifier.kilogram)
        
        XCTAssertEqual(lengthUnit(unit: .metre), SILenght?.unit)
        XCTAssertNil(lengthUnit(unit: .absorbedDose))
        XCTAssertEqual(inch?.unit, UnitIdentifier.inch)
        
        XCTAssertEqual(massUnit.kilogram, SIMass?.unit)
        XCTAssertEqual(massUnit.pound, ImperialMass?.unit)
        
        XCTAssertEqual(lengthUnit.metre, SILenght?.unit)
        XCTAssertEqual(lengthUnit.inch, ImperialLenght?.unit)
        
        XCTAssert(GATTBodyPercentage(rawValue: emptyUnit16) == GATTBodyPercentage(rawValue: emptyUnit16))
        XCTAssertEqual(GATTBodyPercentage(rawValue: emptyUnit16).description, "0%")
        XCTAssertEqual(GATTBodyPercentage.unitType, .percentage)
        
        XCTAssert(GATTBodyResistance(rawValue: emptyUnit16) == GATTBodyResistance(rawValue: emptyUnit16))
        XCTAssertEqual(GATTBodyResistance(rawValue: emptyUnit16).description, "0")
        XCTAssertEqual(GATTBodyResistance.unitType, .electricResistance)
        
        XCTAssert(GATTBodyEnergy(rawValue: emptyUnit16) == GATTBodyEnergy(rawValue: emptyUnit16))
        XCTAssertEqual(GATTBodyEnergy(rawValue: emptyUnit16).description, "0")
        XCTAssertEqual(GATTBodyEnergy.unitType, .energy)
        
        XCTAssert(GATTBodyMass.init(rawValue: emptyUnit16, unit: kilogram!) == GATTBodyMass.init(rawValue: emptyUnit16, unit: kilogram!))
        XCTAssertEqual(GATTBodyMass.init(rawValue: emptyUnit16, unit: kilogram!)!.description, "0")
        
        guard let characteristic = GATTBodyCompositionMeasurement(data: data)
            else { XCTFail("Could not decode from bytes"); return }
        
        XCTAssertNil(GATTBodyCompositionMeasurement(data: Data([0x00, 0x00])))
        XCTAssertNil(GATTBodyCompositionMeasurement(data: Data([0x00, 0x00, 0x00])))
        
        XCTAssertEqual(characteristic.data, data)
        
        XCTAssertEqual(GATTBodyCompositionMeasurement.uuid, .bodyCompositionMeasurement)
    }
    
    func testCGMSessionRunTime() {
        
        let data = Data([0x1f, 0xe5, 0x81, 0xa2])
        
        guard let characteristic = GATTCGMSessionRunTime(data: data)
            else { XCTFail("Could not decode from bytes"); return }
        
        XCTAssertEqual(characteristic.data, data)
        XCTAssertEqual(characteristic.sessionRunTime, 0xe51f)
        XCTAssertEqual(characteristic.sessionRunTime.description, "58655")
        XCTAssertEqual(characteristic.description, "58655 41601")
        
        XCTAssertEqual(GATTCGMSessionRunTime.uuid, .cgmSessionRunTime)
        XCTAssertEqual(GATTCGMSessionRunTime.Hour.unitType, .hour)
        XCTAssertEqual(GATTCGMSessionRunTime(data: data), GATTCGMSessionRunTime(data: data))
        
        XCTAssertEqual(GATTE2ecrc(rawValue: 470), 470)
        XCTAssertEqual(GATTE2ecrc(rawValue: 470).description, "470")
    }
    
    func testModelNumberString() {
        
        let data = Data([0x62, 0x6c, 0x75, 0x65, 0x74, 0x6f, 0x6f, 0x74, 0x68])
        
        guard let characteristic = GATTModelNumber(data: data)
            else { XCTFail("Could not decode from bytes"); return }
        
        XCTAssertEqual(characteristic.data, data)
        XCTAssertEqual(characteristic.rawValue, "bluetooth")
        XCTAssertEqual(characteristic.description, "bluetooth")
        XCTAssertEqual(GATTModelNumber.uuid, .modelNumberString)
        XCTAssertEqual(GATTModelNumber(data: data), "bluetooth")
    }
    
    func testFirmwareRevisionString() {
        
        let data = Data([0x62, 0x6c, 0x75, 0x65, 0x74, 0x6f, 0x6f, 0x74, 0x68])
        
        guard let characteristic = GATTFirmwareRevisionString(data: data)
            else { XCTFail("Could not decode from bytes"); return }
        
        XCTAssertEqual(characteristic.data, data)
        XCTAssertEqual(characteristic.rawValue, "bluetooth")
        XCTAssertEqual(characteristic.description, "bluetooth")
        XCTAssertEqual(GATTFirmwareRevisionString.uuid, .firmwareRevisionString)
        XCTAssertEqual(GATTFirmwareRevisionString(data: data), "bluetooth")
    }
    
    func testSoftwareRevisionString() {
        
        let data = Data([0x62, 0x6c, 0x75, 0x65, 0x74, 0x6f, 0x6f, 0x74, 0x68])
        
        guard let characteristic = GATTSoftwareRevisionString(data: data)
            else { XCTFail("Could not decode from bytes"); return }
        
        XCTAssertEqual(characteristic.data, data)
        XCTAssertEqual(characteristic.rawValue, "bluetooth")
        XCTAssertEqual(characteristic.description, "bluetooth")
        XCTAssertEqual(GATTSoftwareRevisionString.uuid, .softwareRevisionString)
        XCTAssertEqual(GATTSoftwareRevisionString(data: data), "bluetooth")
    }
    
    func testManufacturerNameString() {
        
        let data = Data([0x62, 0x6c, 0x75, 0x65, 0x74, 0x6f, 0x6f, 0x74, 0x68])
        
        guard let characteristic = GATTManufacturerNameString(data: data)
            else { XCTFail("Could not decode from bytes"); return }
        
        XCTAssertEqual(characteristic.data, data)
        XCTAssertEqual(characteristic.rawValue, "bluetooth")
        XCTAssertEqual(characteristic.description, "bluetooth")
        XCTAssertEqual(GATTManufacturerNameString.uuid, .manufacturerNameString)
        XCTAssertEqual(GATTManufacturerNameString(data: data), "bluetooth")
    }
    
    func testPnPID() {
        
        let data = Data([0x02, 0x01, 0x5f, 0x01, 0x5f, 0x01, 0x5f])
        
        guard let characteristic = GATTPnPID(data: data)
            else { XCTFail("Could not decode from bytes"); return }
        
        XCTAssertEqual(characteristic.data, data)
        XCTAssertEqual(characteristic.vendorIdSource, .fromVendorIDValue)
        XCTAssertEqual(characteristic.description, "2 24321 24321 24321")
        XCTAssertEqual(GATTPnPID.uuid, .pnpId)
        XCTAssertEqual(GATTPnPID(data: data), GATTPnPID(data: data))
        
        XCTAssertEqual(characteristic.vendorIdSource.description, "2")
        XCTAssertEqual(characteristic.vendorId, 24321)
        XCTAssertEqual(characteristic.productId, 24321)
        XCTAssertEqual(characteristic.productId, 24321)
    }
    
    func testSystemID() {
        
        XCTAssertNil(GATTSystemID(data: Data([0xff, 0xff])))
        
        do {
            let data = Data([0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff])
            
            guard let characteristic = GATTSystemID(data: data)
                else { XCTFail("Could not decode from bytes"); return }
            
            XCTAssertEqual(characteristic.manufacturerIdentifier, 1099511627775)
            XCTAssertEqual(characteristic.organizationallyUniqueIdentifier, 16777215)
            XCTAssertEqual(GATTSystemID(data: data), GATTSystemID(data: data))
        }
        
        do {
            let data = Data([0xf0, 0x00, 0x00, 0x00, 0x00, 0x28, 0x00, 0x00])
            
            guard let characteristic = GATTSystemID(data: data)
                else { XCTFail("Could not decode from bytes"); return }
            
            XCTAssertEqual(characteristic.manufacturerIdentifier, 240)
            XCTAssertEqual(characteristic.organizationallyUniqueIdentifier, 40)
            XCTAssertEqual(characteristic.description, "240 40")
            XCTAssertEqual(characteristic.data, data)
        }
    }
}
