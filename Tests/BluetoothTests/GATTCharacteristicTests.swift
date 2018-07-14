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
        ("testSystemID", testSystemID),
        ("testHardwareRevisionString", testHardwareRevisionString),
        ("testSerialNumberString", testSerialNumberString),
        ("testIndoorPositioningConfiguration", testIndoorPositioningConfiguration),
        ("testLatitude", testLatitude),
        ("testLongitude", testLongitude),
        ("testLocalNorthCoordinate", testLocalNorthCoordinate),
        ("testFloorNumber", testFloorNumber),
        ("testUncertainty", testUncertainty),
        ("testDayOfWeek", testDayOfWeek),
        ("testDateTime", testDateTime),
        ("testDstOffset", testDstOffset),
        ("testLocalTimeInformation", testLocalTimeInformation),
        ("testTimeSource", testTimeSource),
        ("testTimeAccuracy", testTimeAccuracy),
        ("testReferenceTimeInfomation", testReferenceTimeInfomation),
        ("testTimeBroadcast", testTimeBroadcast),
        ("testCrossTrainerData", testCrossTrainerData),
        ("testTimeUpdateControlPoint", testTimeUpdateControlPoint),
        ("testTimeUpdateState", testTimeUpdateState),
        ("testTimeWithDst", testTimeWithDst),
        ("testCurrentTime", testCurrentTime),
        ("testSecondaryTimeZone", testSecondaryTimeZone),
        ("testDateUTC", testDateUTC),
        ("testScanRefresh", testScanRefresh),
        ("testScanIntervalWindow", testScanIntervalWindow),
        ("testObjectType", testObjectType),
        ("testObjectName", testObjectName),
        ("testObjectSize", testObjectSize),
        ("testObjectID", testObjectID)
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
        
        guard let characteristic = GATTAltitude(data: data)
            else { XCTFail("Could not decode from bytes"); return }
        
        XCTAssertEqual(characteristic.data, data)
        XCTAssertEqual(characteristic, 0)
        XCTAssertEqual(characteristic.rawValue, altitude)
        XCTAssertEqual(characteristic.description, "0")
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
        
        typealias Mass = GATTBodyCompositionMeasurement.MassUnit
        typealias Length = GATTBodyCompositionMeasurement.LengthUnit
        typealias BodyMass = GATTBodyCompositionMeasurement.BodyMass
        typealias BodyLength = GATTBodyCompositionMeasurement.BodyLength
        
        let kg = Mass(unit: .kilogram)
        let mt = Length(rawValue: 0x2701)
        let lb = Mass(unit: .pound)
        let inc = Length(unit: .inch)
        
        guard let kilogram = kg
            else { XCTFail("Could not init mass"); return }
        guard let metre = mt
            else { XCTFail("Could not init mass"); return }
        guard let pound = lb
            else { XCTFail("Could not init mass"); return }
        guard let inch = inc
            else { XCTFail("Could not init mass"); return }
        
        let siMass = BodyMass(rawValue: emptyUnit16, unit: kilogram)
        let imperialMass = BodyMass(rawValue: emptyUnit16, unit: pound)
        
        let siLenght = BodyLength(rawValue: emptyUnit16, unit: metre)
        let imperialLenght = BodyLength(rawValue: emptyUnit16, unit: inch)
        
        let Joule = GATTBodyEnergy(rawValue: emptyUnit16)
        let ohm = GATTBodyResistance(rawValue: emptyUnit16)
        
        let percentage = GATTBodyPercentage(rawValue: emptyUnit16)
        
        let integerPercentage = GATTBodyPercentage(integerLiteral: 50)
        
        let timeStamp = GATTDateTime(date: Date())
        let id = UInt8(bitPattern: 0x05)
        
        let complexCharacteristic = GATTBodyCompositionMeasurement(bodyFatPercentage: percentage, massUnit: pound, lengthUnit: inch, timeStamp: timeStamp, userIdentifier: id, basalMetabolism: Joule, musclePercentage: integerPercentage, muscleMass: imperialMass, fatFreeMass: imperialMass, softLeanMass: imperialMass, bodyWaterMass: imperialMass, impedance: ohm, weight: imperialMass, height: imperialLenght)
        
        let complexData = complexCharacteristic.data
        let complexFlag = complexCharacteristic.flags
        
        XCTAssertEqual(complexFlag, complexCharacteristic.flags)
        XCTAssertEqual(complexData, complexCharacteristic.data)
        
        guard let complexCharacteristic2 = GATTBodyCompositionMeasurement(data: complexData)
            else { XCTFail("Could not decode from bytes"); return }
        XCTAssertEqual(complexCharacteristic2.data, complexData)
        
        XCTAssertEqual(Mass(unit: .kilogram), siMass.unit)
        XCTAssertNil(Mass(unit: .absorbedDose))
        XCTAssertEqual(kilogram.unit, UnitIdentifier.kilogram)
        
        XCTAssertEqual(Length(unit: .metre), siLenght.unit)
        XCTAssertNil(Length(unit: .absorbedDose))
        XCTAssertEqual(inch.unit, UnitIdentifier.inch)
        
        XCTAssertEqual(Mass.kilogram, siMass.unit)
        XCTAssertEqual(Mass.pound, imperialMass.unit)
        
        XCTAssertEqual(Length.metre, siLenght.unit)
        XCTAssertEqual(Length.inch, imperialLenght.unit)
        
        XCTAssert(GATTBodyPercentage(rawValue: emptyUnit16) == GATTBodyPercentage(rawValue: emptyUnit16))
        XCTAssertEqual(GATTBodyPercentage(rawValue: emptyUnit16).description, "0%")
        XCTAssertEqual(GATTBodyPercentage.unitType, .percentage)
        
        XCTAssert(GATTBodyResistance(rawValue: emptyUnit16) == GATTBodyResistance(rawValue: emptyUnit16))
        XCTAssertEqual(GATTBodyResistance(rawValue: emptyUnit16).description, "0")
        XCTAssertEqual(GATTBodyResistance.unitType, .electricResistance)
        
        XCTAssert(GATTBodyEnergy(rawValue: emptyUnit16) == GATTBodyEnergy(rawValue: emptyUnit16))
        XCTAssertEqual(GATTBodyEnergy(rawValue: emptyUnit16).description, "0")
        XCTAssertEqual(GATTBodyEnergy.unitType, .energy)
        
        XCTAssert(BodyMass(rawValue: emptyUnit16, unit: kilogram) == BodyMass(rawValue: emptyUnit16, unit: kilogram))
        XCTAssertEqual(BodyMass(rawValue: emptyUnit16, unit: kilogram).description, "0")
        
        XCTAssert(BodyLength(rawValue: emptyUnit16, unit: inch) == BodyLength(rawValue: emptyUnit16, unit: inch))
        XCTAssertEqual(BodyLength(rawValue: emptyUnit16, unit: inch).description, "0")
        
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
    
    func testHardwareRevisionString() {
        
        let data = Data([0x62, 0x6c, 0x75, 0x65, 0x74, 0x6f, 0x6f, 0x74, 0x68])
        
        guard let characteristic = GATTHardwareRevisionString(data: data)
            else { XCTFail("Could not decode from bytes"); return }
        
        XCTAssertEqual(characteristic.data, data)
        XCTAssertEqual(characteristic.rawValue, "bluetooth")
        XCTAssertEqual(characteristic.description, "bluetooth")
        XCTAssertEqual(GATTHardwareRevisionString.uuid, .hardwareRevisionString)
        XCTAssertEqual(GATTHardwareRevisionString(data: data), "bluetooth")
    }
    
    func testSerialNumberString() {
        
        let data = Data([0x62, 0x6c, 0x75, 0x65, 0x74, 0x6f, 0x6f, 0x74, 0x68])
        
        guard let characteristic = GATTSerialNumberString(data: data)
            else { XCTFail("Could not decode from bytes"); return }
        
        XCTAssertEqual(characteristic.data, data)
        XCTAssertEqual(characteristic.rawValue, "bluetooth")
        XCTAssertEqual(characteristic.description, "bluetooth")
        XCTAssertEqual(GATTSerialNumberString.uuid, .serialNumberString)
        XCTAssertEqual(GATTSerialNumberString(data: data), "bluetooth")
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
        
        XCTAssertEqual(GATTSystemID.uuid, .systemId)
        
        XCTAssertNil(GATTSystemID(data: Data([])))
        XCTAssertNil(GATTSystemID(data: Data([0xff])))
        XCTAssertNil(GATTSystemID(data: Data([0xff, 0xff])))
        XCTAssertNil(GATTSystemID(data: Data([0xff, 0xff, 0xff])))
        
        do {
            
            /**
             If the system ID is based of a Bluetooth Device Address with a Company Identifier (OUI) is 0x123456 and the Company Assigned Identifier is 0x9ABCDE, then the System Identifier is required to be 0x123456FFFE9ABCDE.
             */
            
            let data = Data([0x12, 0x34, 0x56, 0xFF, 0xFE, 0x9A, 0xBC, 0xDE].reversed())
            
            let address = Address(rawValue: "12:34:56:9A:BC:DE")!
            let manufacturerIdentifier: UInt40 = 0xFFFE9ABCDE
            let organizationallyUniqueIdentifier: UInt24 = 0x123456
            
            let characteristic = GATTSystemID(manufacturerIdentifier: manufacturerIdentifier,
                                              organizationallyUniqueIdentifier: organizationallyUniqueIdentifier)
                        
            XCTAssertEqual(characteristic.manufacturerIdentifier, manufacturerIdentifier)
            XCTAssertEqual(characteristic.organizationallyUniqueIdentifier, organizationallyUniqueIdentifier)
            XCTAssertEqual(characteristic.description, "123456FFFE9ABCDE")
            XCTAssertEqual(characteristic.rawValue, 0x123456FFFE9ABCDE)
            XCTAssertEqual(characteristic.hashValue, 0x123456FFFE9ABCDE)
            XCTAssertEqual(characteristic.data, data)
            XCTAssertEqual(characteristic, GATTSystemID(data: data))
            XCTAssertEqual(characteristic, GATTSystemID(address: address))
        }
        
        do {
            let data = Data([0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00])
            
            guard let characteristic = GATTSystemID(data: data)
                else { XCTFail("Could not decode from bytes"); return }
            
            XCTAssertEqual(characteristic.manufacturerIdentifier, 0x0000000000000000)
            XCTAssertEqual(characteristic.organizationallyUniqueIdentifier, 0x0000000000000000)
            XCTAssertEqual(characteristic.description, "0000000000000000")
            XCTAssertEqual(characteristic.rawValue, 0x0000000000000000)
            XCTAssertEqual(characteristic.hashValue, UInt64.min.hashValue)
            XCTAssertEqual(GATTSystemID(data: data), GATTSystemID(data: data))
        }
        
        do {
            let data = Data([0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff])
            
            guard let characteristic = GATTSystemID(data: data)
                else { XCTFail("Could not decode from bytes"); return }
            
            XCTAssertEqual(characteristic.manufacturerIdentifier, 1099511627775)
            XCTAssertEqual(characteristic.organizationallyUniqueIdentifier, 16777215)
            XCTAssertEqual(characteristic.description, "FFFFFFFFFFFFFFFF")
            XCTAssertEqual(characteristic.rawValue, 0xFFFFFFFFFFFFFFFF)
            XCTAssertEqual(characteristic.hashValue, UInt64.max.hashValue)
            XCTAssertEqual(GATTSystemID(data: data), GATTSystemID(data: data))
        }
    }
    
    func testIndoorPositioningConfiguration() {
        
        typealias Configuration = GATTIndoorPositioningConfiguration.Configuration
        
        let data = Data([0b00111111])
        
        guard let characteristic = GATTIndoorPositioningConfiguration(data: data)
            else { XCTFail("Could not decode from bytes"); return }
        
        let configurations: BitMaskOptionSet<Configuration> = [.coordinates, .coordinateSystemUsed, .txPowerField, .altitudeField, .floorNumber, .locationName]
        XCTAssertEqual(characteristic.data, data)
        XCTAssertEqual(characteristic.configurations, configurations, "The value 0x03 is interpreted as “Simple Alert and Email bits set")
        XCTAssertEqual(GATTIndoorPositioningConfiguration.uuid, .indoorPositioningConfiguration)
    }
    
    func testLatitude() {
        
        let data = Data([0xEA, 0x00, 0x00, 0x00])
        let latitude = Int32(bitPattern: UInt32(littleEndian: UInt32(bytes: (data[0], data[1], data[2], data[3]))))
        
        guard let characteristic = GATTLatitude(data: data)
            else { XCTFail("Could not decode from bytes"); return }
        
        XCTAssertEqual(characteristic, 234)
        XCTAssertEqual(characteristic.data, data)
        XCTAssertEqual(characteristic.rawValue, latitude)
        XCTAssertEqual(characteristic.description, "234")
        XCTAssertEqual(GATTLatitude.uuid, .latitude)
        XCTAssertEqual(GATTLatitude(data: data), GATTLatitude(data: data))
    }
    
    func testLongitude() {
        
        let data = Data([0xEA, 0x00, 0x00, 0x00])
        let longitude = Int32(bitPattern: UInt32(littleEndian: UInt32(bytes: (data[0], data[1], data[2], data[3]))))
        
        guard let characteristic = GATTLongitude(data: data)
            else { XCTFail("Could not decode from bytes"); return }
        
        XCTAssertEqual(characteristic, 234)
        XCTAssertEqual(characteristic.data, data)
        XCTAssertEqual(characteristic.rawValue, longitude)
        XCTAssertEqual(characteristic.description, "234")
        XCTAssertEqual(GATTLongitude.uuid, .longitude)
        XCTAssertEqual(GATTLongitude(data: data), GATTLongitude(data: data))
    }
    
    func testLocalNorthCoordinate() {
        
        let data = Data([0xEA, 0x00])
        let localNorthCoordinate = Int16(bitPattern: UInt16(littleEndian: UInt16(bytes: (data[0], data[1]))))
        
        guard let characteristic = GATTLocalNorthCoordinate(data: data)
            else { XCTFail("Could not decode from bytes"); return }
        
        XCTAssertEqual(characteristic, 234)
        XCTAssertEqual(characteristic.data, data)
        XCTAssertEqual(characteristic.rawValue, localNorthCoordinate)
        XCTAssertEqual(characteristic.description, "234")
        XCTAssertEqual(GATTLocalNorthCoordinate.uuid, .localNorthCoordinate)
        XCTAssertEqual(GATTLocalNorthCoordinate(data: data), GATTLocalNorthCoordinate(data: data))
    }
    
    func testLocalEastCoordinate() {
        
        let data = Data([0xEA, 0x00])
        let localEastCoordinate = Int16(bitPattern: UInt16(littleEndian: UInt16(bytes: (data[0], data[1]))))
        
        guard let characteristic = GATTLocalEastCoordinate(data: data)
            else { XCTFail("Could not decode from bytes"); return }
        
        XCTAssertEqual(characteristic, 234)
        XCTAssertEqual(characteristic.data, data)
        XCTAssertEqual(characteristic.rawValue, localEastCoordinate)
        XCTAssertEqual(characteristic.description, "234")
        XCTAssertEqual(GATTLocalEastCoordinate.uuid, .localEastCoordinate)
        XCTAssertEqual(GATTLocalEastCoordinate(data: data), GATTLocalEastCoordinate(data: data))
    }
    
    func testFloorNumber() {
        
        let data = Data([0xEA])
        
        guard let characteristic = GATTFloorNumber(data: data)
            else { XCTFail("Could not decode from bytes"); return }
        
        XCTAssertEqual(characteristic, 234)
        XCTAssertEqual(characteristic.data, data)
        XCTAssertEqual(characteristic.rawValue, data[0])
        XCTAssertEqual(characteristic.description, "234")
        XCTAssertEqual(GATTFloorNumber.uuid, .floorNumber)
        XCTAssertEqual(GATTFloorNumber(data: data), GATTFloorNumber(data: data))
    }
    
    func testUncertainty() {
        
        let data = Data([0b0111_1111])
        
        guard let characteristic = GATTUncertainty(data: data)
            else { XCTFail("Could not decode from bytes"); return }
        
        XCTAssertEqual(characteristic.data, data)
        XCTAssertEqual(characteristic.stationary, .mobile)
        XCTAssertEqual(characteristic.updateTime, .upTo3541s)
        XCTAssertEqual(characteristic.precision, .unknown)
        XCTAssertEqual(GATTUncertainty.uuid, .uncertainty)
        XCTAssertEqual(GATTUncertainty(data: data), GATTUncertainty(data: data))
    }
    
    func testLocationName() {
        
        let data = Data([0x62, 0x6c, 0x75, 0x65, 0x74, 0x6f, 0x6f, 0x74, 0x68])
        
        guard let characteristic = GATTLocationName(data: data)
            else { XCTFail("Could not decode from bytes"); return }
        
        XCTAssertEqual(characteristic.data, data)
        XCTAssertEqual(characteristic.rawValue, "bluetooth")
        XCTAssertEqual(characteristic.description, "bluetooth")
        XCTAssertEqual(GATTLocationName.uuid, .locationName)
        XCTAssertEqual(GATTLocationName(data: data), "bluetooth")
    }
    
    func testDayOfWeek() {
        
        let data = Data([7])
        
        guard let characteristic = GATTDayOfWeek(data: data)
            else { XCTFail("Could not decode from bytes"); return }
        
        XCTAssertEqual(characteristic.data, data)
        XCTAssertEqual(characteristic.day, .sunday)
        XCTAssertEqual(characteristic.description, "7")
        XCTAssertEqual(GATTDayOfWeek.uuid, .dayOfWeek)
        XCTAssertEqual(GATTDayOfWeek.Day.unitType, .day)
        XCTAssertEqual(GATTDayOfWeek(data: data), GATTDayOfWeek(data: data))
    }
    
    func testDayDateTime() {
        
        do {
            let data = Data([203, 7, 4, 24, 12, 5, 30, 7])
            
            guard let characteristic = GATTDayDateTime(data: data)
                else { XCTFail(); return }
            
            XCTAssertEqual(characteristic.data, data)
            XCTAssertEqual(characteristic.dateTime.data, Data([203, 7, 4, 24, 12, 5, 30]))
            XCTAssertEqual(characteristic.dayOfWeek, GATTDayOfWeek(day: .sunday))
            XCTAssertEqual(characteristic.dayOfWeek.day, .sunday)
            XCTAssertEqual(GATTDayDateTime.uuid, .dayDateTime)
            XCTAssertEqual(GATTDayDateTime(data: data), GATTDayDateTime(data: data))
        }
    }
    
    func testExactTime100() {
        
        do {
            let data = Data([203, 7, 4, 24, 12, 5, 30, 7, 45])
            
            guard let characteristic = GATTExactTime100(data: data)
                else { XCTFail(); return }
            
            XCTAssertEqual(characteristic.data, data)
            XCTAssertEqual(characteristic.dayDateTime.data, Data([203, 7, 4, 24, 12, 5, 30, 7]))
            XCTAssertEqual(characteristic.fraction100, GATTExactTime100.Second(rawValue: 45))
            XCTAssertEqual(GATTExactTime100.uuid, .exactTime100)
            XCTAssertEqual(GATTExactTime100(data: data), GATTExactTime100(data: data))
        }
    }
    
    func testExactTime256() {
        
        do {
            let data = Data([203, 7, 4, 24, 12, 5, 30, 7, 245])
            
            guard let characteristic = GATTExactTime256(data: data)
                else { XCTFail(); return }
            
            XCTAssertEqual(characteristic.data, data)
            XCTAssertEqual(characteristic.dayDateTime.data, Data([203, 7, 4, 24, 12, 5, 30, 7]))
            XCTAssertEqual(characteristic.fractions256, 245)
            XCTAssertEqual(GATTExactTime256.uuid, .exactTime256)
            XCTAssertEqual(GATTExactTime256(data: data), GATTExactTime256(data: data))
        }
    }
    
    func testTimeZone() {
        
        XCTAssertNil(GATTTimeZone(rawValue: -50))
        XCTAssertNil(GATTTimeZone(rawValue: 70))
        XCTAssertNotNil(GATTTimeZone(rawValue: -128))
        
        do {
            let data = Data([0x0c])
            
            guard let characteristic = GATTTimeZone(data: data)
                else { XCTFail(); return }
            
            XCTAssertEqual(characteristic.data, data)
            XCTAssertEqual(characteristic.rawValue, 12)
            XCTAssertEqual(GATTTimeZone.uuid, .timeZone)
            XCTAssertEqual(GATTTimeZone(data: data), GATTTimeZone(data: data))
        }
    }
    
    func testDstOffset() {
        
        let data = Data([4])
        
        guard let characteristic = GATTDstOffset(data: data)
            else { XCTFail("Could not decode from bytes"); return }
        
        XCTAssertEqual(characteristic.data, data)
        XCTAssertEqual(characteristic, .daylightTime)
        XCTAssertEqual(characteristic.description, "4")
        XCTAssertEqual(GATTDstOffset.uuid, .dstOffset)
        XCTAssertEqual(GATTDstOffset(data: data), GATTDstOffset(data: data))
    }
    
    func testLocalTimeInformation() {
        
        do {
            let data = Data([0x0c, 4])
            
            guard let characteristic = GATTLocalTimeInformation(data: data)
                else { XCTFail(); return }
            
            XCTAssertEqual(characteristic.data, data)
            XCTAssertEqual(characteristic.timeZone.data, Data([0x0c]))
            XCTAssertEqual(characteristic.dstOffset, .daylightTime)
            XCTAssertEqual(GATTLocalTimeInformation.uuid, .localTimeInformation)
            XCTAssertEqual(GATTLocalTimeInformation(data: data), GATTLocalTimeInformation(data: data))
        }
    }
    
    func testTimeSource() {
        
        let data = Data([1])
        
        guard let characteristic = GATTTimeSource(data: data)
            else { XCTFail("Could not decode from bytes"); return }
        
        XCTAssertEqual(characteristic.data, data)
        XCTAssertEqual(characteristic, .networkTimeProtocol)
        XCTAssertEqual(characteristic.description, "1")
        XCTAssertEqual(GATTTimeSource.uuid, .timeSource)
        XCTAssertEqual(GATTTimeSource(data: data), GATTTimeSource(data: data))
    }
    
    func testTimeAccuracy() {
        
        do {
            let data = Data([0x0c])
            
            guard let characteristic = GATTTimeAccuracy(data: data)
                else { XCTFail(); return }
            
            XCTAssertEqual(characteristic.data, data)
            XCTAssertEqual(characteristic.rawValue, 12)
            XCTAssertEqual(characteristic.description, "12")
            XCTAssertEqual(characteristic, 12)
            XCTAssertEqual(GATTTimeAccuracy.uuid, .timeAccuracy)
            XCTAssertEqual(GATTTimeAccuracy(data: data), GATTTimeAccuracy(data: data))
        }
    }
    
    func testReferenceTimeInfomation() {
        
        do {
            typealias Day = GATTReferenceTimeInformation.Day
            typealias Hour = GATTReferenceTimeInformation.Hour
            
            let data = Data([0x03, 0x0b, 5, 6])
            
            guard let characteristic = GATTReferenceTimeInformation(data: data)
                else { XCTFail(); return }
            
            XCTAssertEqual(characteristic.data, data)
            XCTAssertEqual(characteristic.timeSource, .radioTimeSignal)
            XCTAssertEqual(characteristic.timeAccuracy.rawValue, 0x0b)
            XCTAssertEqual(characteristic.daysSinceUpdate, 5)
            XCTAssertEqual(characteristic.daysSinceUpdate.description, "5")
            XCTAssertEqual(characteristic.hoursSinceUpdate.rawValue , 6)
            XCTAssertEqual(characteristic.hoursSinceUpdate.description , "6")
            XCTAssertEqual(Day.unitType, .day)
            XCTAssertEqual(Hour.unitType, .hour)
            XCTAssertEqual(GATTReferenceTimeInformation.uuid, .referenceTimeInformation)
            XCTAssertEqual(GATTReferenceTimeInformation(data: data), GATTReferenceTimeInformation(data: data))
        }
    }
    
    func testTimeBroadcast() {
        let data = Data([203, 7, 4, 24, 12, 5, 30, 7, 245, 0x0c, 4, 0x03, 0x0b, 5, 6])
        
        guard let characteristic = GATTTimeBroadcast(data: data)
            else { XCTFail("Could not decode from bytes"); return }
        
        XCTAssertEqual(characteristic.data, data)
        XCTAssertEqual(characteristic.time, GATTExactTime256(data: Data([203, 7, 4, 24, 12, 5, 30, 7, 245])))
        XCTAssertEqual(characteristic.localTime, GATTLocalTimeInformation(data: Data([0x0c, 4])))
        XCTAssertEqual(characteristic.referenceTime, GATTReferenceTimeInformation(data: Data([0x03, 0x0b, 5, 6])))
        XCTAssertEqual(GATTTimeBroadcast.uuid, .timeBroadcast)
        XCTAssertEqual(GATTTimeBroadcast(data: data), GATTTimeBroadcast(data: data))
    }
    
    func testCrossTrainerData() {
        
        typealias KilometerPerHour = GATTCrossTrainerData.KilometerPerHour
        typealias MetreBit24 = GATTCrossTrainerData.Metre.Bit24
        typealias MetreBit16 = GATTCrossTrainerData.Metre.Bits16
        typealias StepPerMinute = GATTCrossTrainerData.StepPerMinute
        typealias UnitlessUnsigned = GATTCrossTrainerData.Unitless.Unsigned
        typealias UnitlessSigned = GATTCrossTrainerData.Unitless.Signed
        typealias Percentage = GATTCrossTrainerData.Percentage
        typealias PlainAngleDegree = GATTCrossTrainerData.PlainAngleDegree
        typealias Power = GATTCrossTrainerData.Power
        typealias BeatsPerMinute = GATTBeatsPerMinute.Byte
        typealias MetabolicEquivalent = GATTCrossTrainerData.MetabolicEquivalent
        typealias Time = GATTCrossTrainerData.Time
        
        XCTAssertNil(GATTCrossTrainerData(data: Data([0x00, 0x00])))
        
        do {
            let data = Data([0b00000000, 0b00000000, 0b00000000])
            XCTAssertNotNil(GATTCrossTrainerData(data: data))
        }
        
        do {
            let data = Data([0b11111111, 0b01111111, 0x00, // flags
                             0x05, 0x05, // instantaneousSpeed
                             0x05, 0x05, // averageSpeed
                             0x05, 0x05, 0x05, // totalDistance
                             0x05, 0x05, 0x05, 0x05, // stepCount
                             0x05, 0x05, // strideCount
                             0x05, 0x05, 0x05, 0x05, // elevationGain
                             0x05, 0x05, 0x05, 0x05, // inclinationAndRampAngleSetting
                             0x05, 0x05, // resistanceLevel
                             0x05, 0x05, // instantaneousPower
                             0x05, 0x05, // averagePower
                             0x05, 0x05, 0x05, 0x05, 0x05, // expendedEnergy
                             0x05, // heartRate
                             0x05, // metabolicEquivalent
                             0x05, 0x05, // elapsedTime
                             0x05, 0x05 // remainingTime
                ])
            guard let characteristic = GATTCrossTrainerData(data: data)
                else { XCTFail("Could not decode from bytes"); return }
            
            XCTAssertNotNil(characteristic)
            XCTAssertEqual(GATTCrossTrainerData.uuid, .crossTrainerData)
            XCTAssertEqual(characteristic.instantaneousSpeed, KilometerPerHour(rawValue: 1285))
            XCTAssertEqual(characteristic.averageSpeed, KilometerPerHour(rawValue: 1285))
            XCTAssertEqual(characteristic.totalDistance, MetreBit24(rawValue: 328965))
            XCTAssertEqual(characteristic.stepPerMinute, StepPerMinute(rawValue: 1285))
            XCTAssertEqual(characteristic.averageStepRate, StepPerMinute(rawValue: 1285))
            XCTAssertEqual(characteristic.strideCount, UnitlessUnsigned(rawValue: 1285))
            XCTAssertEqual(characteristic.positiveElevationGain, MetreBit16(rawValue: 1285))
            XCTAssertEqual(characteristic.negativeElevationGain, MetreBit16(rawValue: 1285))
            XCTAssertEqual(characteristic.inclination, Percentage(rawValue: 1285))
            XCTAssertEqual(characteristic.rampAngleSetting, PlainAngleDegree(rawValue: 1285))
            XCTAssertEqual(characteristic.resistanceLevel, UnitlessSigned(rawValue: 1285))
            XCTAssertEqual(characteristic.instantaneousPower, Power(rawValue: 1285))
            XCTAssertEqual(characteristic.averagePower, Power(rawValue: 1285))
            XCTAssertEqual(characteristic.totalEnergy, GATTKilogramCalorie.Bits16(rawValue: 1285))
            XCTAssertEqual(characteristic.energyPerHour, GATTKilogramCalorie.Bits16(rawValue: 1285))
            XCTAssertEqual(characteristic.energyPerMinute, GATTKilogramCalorie.Byte(rawValue: 5))
            XCTAssertEqual(characteristic.heartRate, GATTBeatsPerMinute.Byte(rawValue: 5))
            XCTAssertEqual(characteristic.metabolicEquivalent, MetabolicEquivalent(rawValue: 5))
            XCTAssertEqual(characteristic.elapsedTime, Time(rawValue: 1285))
            XCTAssertEqual(characteristic.remainingTime, Time(rawValue: 1285))
            
            XCTAssertEqual(KilometerPerHour.unitType, .kilometrePerHour)
            XCTAssertEqual(StepPerMinute.unitType, .step)
            XCTAssertEqual(MetreBit24.unitType, .metre)
            XCTAssertEqual(MetreBit16.unitType, .metre)
            XCTAssertEqual(UnitlessUnsigned.unitType, .unitless)
            XCTAssertEqual(UnitlessSigned.unitType, .unitless)
            XCTAssertEqual(Percentage.unitType, .percentage)
            XCTAssertEqual(PlainAngleDegree.unitType, .degree)
            XCTAssertEqual(Power.unitType, .power)
            XCTAssertEqual(GATTKilogramCalorie.Bits16.unitType, .kilogramCalorie)
            XCTAssertEqual(GATTKilogramCalorie.Byte.unitType, .kilogramCalorie)
            XCTAssertEqual(MetabolicEquivalent.unitType, .metabolicEquivalent)
            XCTAssertEqual(Time.unitType, .second)
            
            XCTAssertEqual(GATTCrossTrainerData(instantaneousSpeed: 1285,
                                                averageSpeed: 1285,
                                                totalDistance: MetreBit24(rawValue: 328965),
                                                stepPerMinute: 1285,
                                                averageStepRate: 1285,
                                                strideCount: 1285,
                                                positiveElevationGain: 1285,
                                                negativeElevationGain: 1285,
                                                inclination: 1285,
                                                rampAngleSetting: 1285,
                                                resistanceLevel: 1285,
                                                instantaneousPower: 1285,
                                                averagePower: 1285,
                                                totalEnergy: 1285,
                                                energyPerHour: 1285,
                                                energyPerMinute: 5,
                                                heartRate: 5,
                                                metabolicEquivalent: 5,
                                                elapsedTime: 1285,
                                                remainingTime: 1285), characteristic)
            
            XCTAssertEqual(characteristic.flags, BitMaskOptionSet<GATTCrossTrainerData.Flag>(rawValue: UInt32(bytes: (0b11111111, 0b01111111, 0x00, 0x00))))
            XCTAssertEqual(characteristic.data, data)
        }
    }
    
    func testTimeUpdateControlPoint() {
        
        let data = Data([1])
        
        do {
            guard let characteristic = GATTTimeUpdateControlPoint(data: data)
                else { XCTFail("Could not decode from bytes"); return }
            
            XCTAssertEqual(characteristic.data, data)
            XCTAssertEqual(characteristic.description, "1")
        }
        
        XCTAssertEqual(GATTTimeUpdateControlPoint(data: Data([1])), .getReferenceUpdate)
        XCTAssertEqual(GATTTimeUpdateControlPoint(data: Data([2])), .cancelReferenceUpdate)
        XCTAssertEqual(GATTTimeUpdateControlPoint.uuid, .timeUpdateControlPoint)
        XCTAssertEqual(GATTTimeUpdateControlPoint(data: data), GATTTimeUpdateControlPoint(data: data))
    }
    
    func testTimeUpdateState() {
        
        let data = Data([0x00, 0x02])
        
        guard let characteristic = GATTTimeUpdateState(data: data)
            else { XCTFail("Could not decode from bytes"); return }
        
        XCTAssertEqual(characteristic.data, data)
        XCTAssertEqual(characteristic.currentState, .idle)
        XCTAssertEqual(characteristic.result, .noConnectionToReference)
        XCTAssertEqual(GATTTimeUpdateState.uuid, .timeUpdateState)
        XCTAssertEqual(GATTTimeUpdateState(data: data), GATTTimeUpdateState(data: data))
    }
    
    func testTimeWithDst() {
        
        do {
            let data = Data([203, 7, 4, 24, 12, 5, 30, 8])
            
            guard let characteristic = GATTTimeWithDst(data: data)
                else { XCTFail(); return }
            
            XCTAssertEqual(characteristic.data, data)
            XCTAssertEqual(characteristic.datetime, GATTDateTime(data: Data([203, 7, 4, 24, 12, 5, 30])))
            XCTAssertEqual(characteristic.dstOffset, GATTDstOffset(data: Data([8])))
            XCTAssertEqual(GATTTimeWithDst.uuid, .timeWithDst)
            XCTAssertEqual(GATTTimeWithDst(data: data), GATTTimeWithDst(data: data))
        }
    }
    
    func testCurrentTime() {
        let data = Data([203, 7, 4, 24, 12, 5, 30, 7, 245, 0b00001111])
        
        guard let characteristic = GATTCurrentTime(data: data)
            else { XCTFail("Could not decode from bytes"); return }
        
        XCTAssertEqual(characteristic.data, data)
        XCTAssertEqual(characteristic.exactTime, GATTExactTime256(data: Data([203, 7, 4, 24, 12, 5, 30, 7, 245])))
        XCTAssertEqual(characteristic.adjustReason, BitMaskOptionSet<GATTCurrentTime.Flag>(rawValue: 0b00001111))
        XCTAssertEqual(GATTCurrentTime.uuid, .currentTime)
        XCTAssertEqual(GATTCurrentTime(data: data), GATTCurrentTime(data: data))
        
        XCTAssertTrue(characteristic.adjustReason.contains(.manualTimeUpdate))
        XCTAssertTrue(characteristic.adjustReason.contains(.externalReference))
        XCTAssertTrue(characteristic.adjustReason.contains(.timeZoneChange))
        XCTAssertTrue(characteristic.adjustReason.contains(.dstChange))
    }
    
    func testSecondaryTimeZone() {
        
        typealias TimeZone = GATTSecondaryTimeZone.TimeZone
        typealias RelativeInformation = GATTSecondaryTimeZone.RelativeInformation
        
        let data = Data([0b10000011, 0x0c, 4])
        
        guard let characteristic = GATTSecondaryTimeZone(data: data)
            else { XCTFail("Could not decode from bytes"); return }
        
        XCTAssertEqual(characteristic.data, data)
        XCTAssertEqual(characteristic.timeZone, .atDestination)
        XCTAssertEqual(characteristic.relativeInformation, .localTime)
        XCTAssertEqual(GATTSecondaryTimeZone.uuid, .secondaryTimeZone)
        XCTAssertEqual(GATTSecondaryTimeZone(data: data), GATTSecondaryTimeZone(data: data))
    }
    
    func testDateUTC() {
        
        XCTAssertNil(GATTDateUTC.Day(rawValue: 16777215))
        XCTAssertNotNil(GATTDateUTC.Day(rawValue: 0))
        
        do {
            let data = Data([0xFE, 0xFF, 0xFF])
            
            guard let characteristic = GATTDateUTC(data: data)
                else { XCTFail(); return }
            
            XCTAssertEqual(characteristic.data, data)
            XCTAssertEqual(characteristic.date, GATTDateUTC.Day(rawValue: 16777214))
            XCTAssertEqual(characteristic.description, "FFFFFE")
            XCTAssertEqual(GATTDateUTC.uuid, .dateUtc)
            XCTAssertEqual(GATTDateUTC.Day.unitType, .day)
            XCTAssertEqual(GATTDateUTC(data: data), GATTDateUTC(data: data))
        }
    }
    
    func testScanRefresh() {
        
        XCTAssertNil(GATTScanRefresh(data: Data([1])))
        
        let data = Data([0x00])
        
        guard let characteristic = GATTScanRefresh(data: data)
            else { XCTFail("Could not decode from bytes"); return }
        
        XCTAssertEqual(GATTScanRefresh.uuid, .scanRefresh)
        XCTAssertEqual(characteristic.data, data)
        XCTAssertEqual(characteristic.description, "0")
        XCTAssertEqual(characteristic, .serverRequiredRefresh)
    }
    
    func testScanIntervalWindow() {
        
        let data = Data([0x0, 0x40, 0x0, 0x40])
        
        guard let characteristics = GATTScanIntervalWindow(data: data)
            else { XCTFail("Could not decode from bytes"); return }
        
        XCTAssertEqual(characteristics.data, data)
        XCTAssertEqual(characteristics.scanInterval, LowEnergyScanTimeInterval(16384))
        XCTAssertEqual(characteristics.scanWindow, LowEnergyScanTimeInterval(16384))
        XCTAssertEqual(GATTScanIntervalWindow.uuid, .scanIntervalWindow)
        XCTAssertEqual(GATTScanIntervalWindow(data: data), GATTScanIntervalWindow(data: data))
    }
    
    func testObjectType() {
        
        let data = Data([0x0, 0x40])
        
        guard let characteristics = GATTObjectType(data: data)
            else { XCTFail("Could not decode from bytes"); return }
        
        XCTAssertEqual(characteristics.data, data)
        XCTAssertEqual(characteristics.rawValue, 16384)
        XCTAssertEqual(characteristics.description, "4000")
        XCTAssertEqual(GATTObjectType.uuid, .objectType)
        XCTAssertEqual(GATTObjectType(data: data), GATTObjectType(data: data))
    }
    
    func testObjectSize() {
        
        typealias Size = GATTObjectSize.Size
        
        let data = Data([0x0A, 0x40, 0x00, 0x00, 0x0A, 0x40, 0x00, 0x00])
        
        guard let characteristics = GATTObjectSize(data: data)
            else { XCTFail("Could not decode from bytes"); return }
        
        XCTAssertEqual(characteristics.data, data)
        XCTAssertEqual(characteristics.currentSize, Size(rawValue: 16394))
        XCTAssertEqual(characteristics.allocatedSize, Size(rawValue: 16394))
        XCTAssertEqual(GATTObjectSize.uuid, .objectSize)
        XCTAssertEqual(GATTObjectSize(data: data), GATTObjectSize(data: data))
    }
    
    func testObjectName() {
        
        let data = Data([0x62, 0x6c, 0x75, 0x65, 0x74, 0x6f, 0x6f, 0x74, 0x68])
        
        guard let characteristics = GATTObjectName(data: data)
            else { XCTFail("Could not decode from bytes"); return }
        
        XCTAssertEqual(characteristics.data, data)
        XCTAssertEqual(characteristics.rawValue, "bluetooth")
        XCTAssertEqual(characteristics.description, "bluetooth")
        XCTAssertEqual(GATTObjectName.uuid, .objectName)
        XCTAssertEqual(GATTObjectName(data: data), GATTObjectName(data: data))
    }
    
    func testObjectID() {
        
        let data = Data([0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF])
        
        guard let characteristics = GATTObjectID(data: data)
            else { XCTFail("Could not decode from bytes"); return }
        
        XCTAssertEqual(characteristics.data, data)
        XCTAssertEqual(UInt64(characteristics.rawValue), 281474976710655)
        XCTAssertEqual(characteristics.description, "FFFFFFFFFFFF")
        XCTAssertEqual(GATTObjectID.uuid, .objectId)
        XCTAssertEqual(GATTObjectID(data: data), GATTObjectID(data: data))
    }
}
