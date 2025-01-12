//
//  GATTCharacteristicTests.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/10/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

#if canImport(BluetoothGATT)
import Testing
import Foundation
import Bluetooth
@testable import BluetoothGATT

@Suite struct GATTCharacteristicTests {
    
    @Test func dateTime() {
        
        /// remove subsecond precision
        let date = Date(timeIntervalSinceReferenceDate: TimeInterval(Int(Date.timeIntervalSinceReferenceDate)))
        
        // Date conversion
        #expect(GATTDateTime().year != .unknown)
        #expect(GATTDateTime().month != .unknown)
        #expect(GATTDateTime().day != .unknown)
        #expect(GATTDateTime(date: Date(timeIntervalSinceReferenceDate: 0)).year.rawValue == 2001)
        #expect(GATTDateTime(date: Date(timeIntervalSinceReferenceDate: 0)).month == .january)
        #expect(GATTDateTime(date: Date(timeIntervalSinceReferenceDate: 0)).day.rawValue == 1)
        #expect(GATTDateTime(date: Date(timeIntervalSinceReferenceDate: 3600)).hour.rawValue == 1)
        #expect(GATTDateTime(date: Date(timeIntervalSinceReferenceDate: 60)).minute.rawValue == 1)
        #expect(GATTDateTime(date: Date(timeIntervalSinceReferenceDate: 30)).second.rawValue == 30)
        
        // Crashes on Linux
        // fatal error: copy(with:) is not yet implemented: file Foundation/NSCalendar.swift, line 1434
        #if os(macOS)
        #expect(Date(dateTime: GATTDateTime(date: date)) == date)
        #endif
        
        // create valid values
        (1582...9999).forEach { #expect(GATTDateTime.Year(rawValue: $0) != nil)  }
        #expect(GATTDateTime.Year(rawValue: 0) == .unknown)
        (1...12).forEach { #expect(GATTDateTime.Month(rawValue: $0) != nil)  }
        #expect(GATTDateTime.Month(rawValue: 0) == .unknown)
        (1...31).forEach { #expect(GATTDateTime.Day(rawValue: $0) != nil)  }
        #expect(GATTDateTime.Day(rawValue: 0) == .unknown)
        (0...23).forEach { #expect(GATTDateTime.Hour(rawValue: $0) != nil)  }
        (0...59).forEach { #expect(GATTDateTime.Minute(rawValue: $0) != nil)  } 
        (0...59).forEach { #expect(GATTDateTime.Second(rawValue: $0) != nil)  }
        
        // test decoding
        #expect(GATTDateTime(data: Data()) == nil, "Invalid length")
        #expect(GATTDateTime(data: Data([0x00])) == nil, "Invalid length")
        #expect(GATTDateTime(data: Data([0x00, 0x00])) == nil, "Invalid length")
        #expect(GATTDateTime(data: Data([0x00, 0x00, 0x00])) == nil, "Invalid length")
        #expect(GATTDateTime(data: Data([0x00, 0x00, 0x00, 0x00])) == nil, "Invalid length")
        #expect(GATTDateTime(data: Data([0xFF, 0xFF, 0xFF, 0xFF, 0xFF])) == nil, "Invalid length")
        #expect(GATTDateTime(data: Data([0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF])) == nil, "Invalid values")
        #expect(GATTDateTime(data: Data([0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF])) == nil, "Invalid values")
        #expect(GATTDateTime(data: Data([0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF])) == nil, "Invalid length")
        
        // encoding
        do {
            
            let data = Data([0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00])
            
            guard let characteristic = GATTDateTime(data: data)
                else { Issue.record(); return }
            
            #expect(characteristic.data == data)
            #expect(characteristic.year == .unknown)
            #expect(characteristic.month == .unknown)
            #expect(characteristic.day == .unknown)
            #expect(characteristic.hour == .min)
            #expect(characteristic.minute == .min)
            #expect(characteristic.second == .min)
        }
        
        // encoding
        do {
            
            let data = Data([203, 7, 4, 24, 12, 5, 30])
            
            guard let characteristic = GATTDateTime(data: data)
                else { Issue.record(); return }
            
            #expect(characteristic.data == data)
            #expect(characteristic.year.rawValue == 1995)
            #expect(characteristic.month == .april)
            #expect(characteristic.day.rawValue == 24)
            #expect(characteristic.hour.rawValue == 12)
            #expect(characteristic.minute.rawValue == 5)
            #expect(characteristic.second.rawValue == 30)
        }
    }
    
    @Test func batteryLevel() {
        
        let data = Data([0x22])
        
        guard let characteristic = GATTBatteryLevel(data: data)
            else { Issue.record("Could not decode from bytes"); return }
        
        guard let percentage = GATTBatteryPercentage(rawValue: 34)
            else { Issue.record("Could not init Percentage"); return }
        
        // test characteristic
        #expect(characteristic.data == data)
        #expect(characteristic.level == percentage)
        #expect(characteristic.description == "34%")
        #expect(GATTBatteryLevel(level: percentage) != nil)  
        #expect(GATTBatteryLevel.uuid == BluetoothUUID.Characteristic.batteryLevel)
        #expect(GATTBatteryLevel(data: data) == GATTBatteryLevel(data: data))
        (0 ... 100).forEach { #expect(GATTBatteryLevel(data: Data([$0])) != nil)  }
        (101 ... UInt8.max).forEach { #expect(GATTBatteryLevel(data: Data([$0])) == nil)  }
        
        // test percentage
        #expect(GATTBatteryPercentage.unitType.description == "0x27AD (percentage)")
        #expect(GATTBatteryPercentage.unitType.type == "org.bluetooth.unit.percentage")
        #expect(GATTBatteryPercentage.unitType == .percentage)
        (0 ... 100).forEach { #expect(GATTBatteryPercentage(rawValue: $0) != nil)  }
        (101 ... UInt8.max).forEach { #expect(GATTBatteryPercentage(rawValue: $0) == nil)  }
    }
    
    @Test func supportedNewAlertCategory() {
        
        let data = Data([0x0a])
        
        guard let characteristic = GATTSupportedNewAlertCategory(data: data)
            else { Issue.record("Could not decode from bytes"); return }
        
        
        #expect(characteristic.data == data)
        #expect(characteristic.categories == [.call, .email], "The value 0x0a is interpreted that this server supports “Call” and “Email” categories.")
    }
    
    @Test func alertCategoryIdBitMask() {
        
        let data = Data([0x03])
        
        guard let characteristic = GATTAlertCategoryBitMask(data: data)
            else { Issue.record("Could not decode from bytes"); return }
        
        #expect(characteristic.data == data)
        #expect(characteristic.categories == [.simpleAlert, .email], "The value 0x03 is interpreted as “Simple Alert and Email bits set")
    }
    
    @Test func newAlert() {
        
        typealias Information = GATTNewAlert.Information
        
        let data = Data([0x01, 0x04, 0x52, 0x69, 0x63, 0x68, 0x61, 0x72, 0x64])
        
        guard let characteristic = GATTNewAlert(data: data)
            else { Issue.record("Could not decode from bytes"); return }
        
        #expect(characteristic.data == data)
        
        // The value 0x01, 0x04, 0x52, 0x69, 0x63, 0x68, 0x61, 0x72, 0x64 are interpreted that the server has 4 new email messages and the last message was sent by “Richard”.
        #expect(characteristic.category == .email)
        #expect(characteristic.newAlertsCount == 4)
        #expect(characteristic.information.rawValue == "Richard")
        
        #expect(Information(rawValue: "Alsey Coleman Miller ABCDEFGHIJKLMNOP") == nil)
        #expect(Information(rawValue: "") != nil)
        #expect(Information(rawValue: "Alsey Coleman") != nil)
    }
    
    @Test func alertCategoryID() {
        
        let data = Data([0x01])
        
        guard let characteristic = GATTAlertCategory(data: data)
            else { Issue.record("Could not decode from bytes"); return }
        
        #expect(characteristic.data == data)
        
        #expect(characteristic == .email, "The value 0x01 is interpreted as “Email”")
    }
    
    @Test func supportedUnreadAlertCategory() {
        
        let data = Data([0x03])
        
        guard let characteristic = GATTSupportedUnreadAlertCategory(data: data)
            else { Issue.record("Could not decode from bytes"); return }
        
        #expect(characteristic.data == data)
        #expect(characteristic == GATTSupportedUnreadAlertCategory(data: Data([0x03, 0x00])))
        #expect(characteristic.categories == [.email, .simpleAlert], "The value 0x03 is interpreted that this server supports “Simple Alert” and “Email” categories for unread alert.")
        
    }
    
    @Test func unreadAlertStatus() {
        
        let data = Data([0x01, 0x04])
        
        guard let characteristic = GATTUnreadAlertStatus(data: data)
            else { Issue.record("Could not decode from bytes"); return }
        
        #expect(characteristic.data == data)
        
        // The value 0x01, 0x04 are interpreted that the server has 4 unread messages in Email category.
        #expect(characteristic.category == .email)
        #expect(characteristic.unreadCount == 4)
    }
    
    @Test func alertNotificationControlPoint() {
        
        let data = Data([0x02, 0x01])
        
        guard let characteristic = GATTAlertNotificationControlPoint(data: data)
            else { Issue.record("Could not decode from bytes"); return }
        
        #expect(characteristic.data == data)
        
        // The data 0x02 0x01 interprets “Disable New Incoming Notification for Email Category”.
        #expect(characteristic.command == .disableNewIncomingAlertNotification)
        #expect(characteristic.category == .email)
    }
    
    @Test func bloodPressureMeasurement() {
        
        typealias Unit = GATTBloodPressureMeasurement.Unit
        typealias CompoundValue = GATTBloodPressureMeasurement.CompoundValue
        typealias MeasurementStatus = GATTBloodPressureMeasurement.MeasurementStatus
        
        #expect(Unit.mmHg.unit == .millimetreOfMercury)
        #expect(Unit.kPa.unit == .pascalPressure)
        #expect(.mmHg == Unit(unit: .millimetreOfMercury))
        #expect(.kPa == Unit(unit: .pascalPressure))
        
        let characteristic = GATTBloodPressureMeasurement(compoundValue:
            CompoundValue(unit: .kPa,
                          systolic: SFloat(bitPattern: 0xAA),
                          diastolic: SFloat(bitPattern: 0xBB),
                          meanArterialPressure: SFloat(bitPattern: 0xCC)),
            userIdentifier: 0x1B,
            measurementStatus: .all
        )
        
        #expect(Array(GATTBloodPressureMeasurement(data: characteristic.data)?.data ?? Data()) == Array(characteristic.data))
    }
    
    @Test func altitude() {
        
        let data = Data([0x00, 0x00])
        let altitude = UInt16(littleEndian: UInt16(bytes: (data[0], data[1])))
        
        guard let characteristic = GATTAltitude(data: data)
            else { Issue.record("Could not decode from bytes"); return }
        
        #expect(characteristic.data == data)
        #expect(characteristic == 0)
        #expect(characteristic.rawValue == altitude)
        #expect(characteristic.description == "0")
        #expect(GATTAltitude.uuid == BluetoothUUID.Characteristic.altitude)
        #expect(GATTAltitude(data: data) == GATTAltitude(data: data))
    }
    
    @Test func aerobicHeartRateLowerLimit() {
        
        typealias BeatsPerMinute = GATTAerobicHeartRateLowerLimit.BeatsPerMinute
        
        #expect(GATTAerobicHeartRateLowerLimit(data: Data([0x3d, 0x72])) == nil)
        
        let data = Data([0x22])
        
        let beats: BeatsPerMinute = 34
        
        guard let characteristic = GATTAerobicHeartRateLowerLimit(data: data)
            else { Issue.record("Could not decode from bytes"); return }
        
        #expect(characteristic.data == data)
        #expect(characteristic.beats == beats)
        #expect(characteristic.description == "34")
        #expect(beats.description == "34")
        #expect(GATTAerobicHeartRateLowerLimit.uuid == BluetoothUUID.Characteristic.aerobicHeartRateLowerLimit)
        #expect(BeatsPerMinute.unitType == .beatsPerMinute)
    }
    
    @Test func aerobicHeartRateUpperLimit() {
        
        typealias BeatsPerMinute = GATTAerobicHeartRateUpperLimit.BeatsPerMinute
        
        #expect(GATTAerobicHeartRateUpperLimit(data: Data([0x3d, 0x72])) == nil)
        
        let data = Data([0x22])
        
        let beats: BeatsPerMinute = 34
        
        guard let characteristic = GATTAerobicHeartRateUpperLimit(data: data)
            else { Issue.record("Could not decode from bytes"); return }
        
        #expect(characteristic.data == data)
        #expect(characteristic.beats == beats)
        #expect(characteristic.description == "34")
        #expect(beats.description == "34")
        #expect(GATTAerobicHeartRateUpperLimit.uuid == BluetoothUUID.Characteristic.aerobicHeartRateUpperLimit)
        #expect(BeatsPerMinute.unitType == .beatsPerMinute)
    }
    
    @Test func alertLevel() {
        
        let data = Data([0x01])
        
        guard let characteristic = GATTAlertLevel(data: data)
            else { Issue.record("Could not decode from bytes"); return }
        
        #expect(characteristic.data == data)
        #expect(characteristic == .mild, "The value 0x01 should be interpreted as mild Alert")
        #expect(GATTAlertLevel.uuid == BluetoothUUID.Characteristic.alertLevel)
    }
    
    @Test func aerobicThreshold() {
        
        typealias BeatsPerMinute = GATTAerobicThreshold.BeatsPerMinute
        
        #expect(GATTAerobicThreshold(data: Data([0x4f, 0x45])) == nil)
        
        let data = Data([0x32])
        
        let beats: BeatsPerMinute = 50
        
        guard let characteristic = GATTAerobicThreshold(data: data)
            else { Issue.record("Could not decode from bytes"); return }
        
        #expect(characteristic.data == data)
        #expect(characteristic.beats == beats)
        #expect(characteristic.description == "50")
        #expect(beats.description == "50")
        #expect(GATTAerobicThreshold.uuid == BluetoothUUID.Characteristic.aerobicThreshold)
        #expect(BeatsPerMinute.unitType == .beatsPerMinute)
    }
    
    @Test func age() {
        
        typealias Year = GATTAge.Year
        
        #expect(GATTAge(data: Data([0x4f, 0x45])) == nil)
        
        let data = Data([0x32])
        
        let year: Year = 50
        
        guard let characteristic = GATTAge(data: data)
            else { Issue.record("Could not decode from bytes"); return }
        
        #expect(characteristic.data == data)
        #expect(characteristic.year == year)
        #expect(characteristic.description == "50")
        #expect(year.description == "50")
        #expect(GATTAge.uuid == BluetoothUUID.Characteristic.age)
        #expect(Year.unitType == .year)
    }
    
    @Test func alertStatus() {
        
        let data = Data([0x37])
        
        guard let characteristic = GATTAlertStatus(data: data)
            else { Issue.record("Could not decode from bytes"); return }
        
        #expect(characteristic.data == data)
        #expect(characteristic.states.contains(.ringer))
        #expect(characteristic.states.contains(.displayAlert))
        #expect(characteristic.states.contains(.vibrate))
        #expect(characteristic.states.contains(GATTAlertStatus.State.allCases))
        #expect(characteristic.description == "55")
        #expect(GATTAlertStatus.uuid == BluetoothUUID.Characteristic.alertStatus)
        #expect(GATTAlertStatus(data: data) == GATTAlertStatus(data: data))
    }

    @Test func anaerobicHeartRateLowerLimit() {
        
        typealias BeatsPerMinute = GATTAnaerobicHeartRateLowerLimit.BeatsPerMinute
        
        #expect(GATTAnaerobicHeartRateLowerLimit(data: Data([0x3d, 0x72])) == nil)
        
        let data = Data([0x22])
        
        let beats: BeatsPerMinute = 34
        
        guard let characteristic = GATTAnaerobicHeartRateLowerLimit(data: data)
            else { Issue.record("Could not decode from bytes"); return }
        
        #expect(characteristic.data == data)
        #expect(characteristic.beats == beats)
        #expect(characteristic.description == "34")
        #expect(beats.description == "34")
        #expect(GATTAnaerobicHeartRateLowerLimit.uuid == BluetoothUUID.Characteristic.anaerobicHeartRateLowerLimit)
        #expect(GATTAnaerobicHeartRateLowerLimit(data: data) == GATTAnaerobicHeartRateLowerLimit(data: data))
        #expect(BeatsPerMinute.unitType == .beatsPerMinute)
        #expect(GATTAnaerobicHeartRateLowerLimit(data: Data([0x4f])) != GATTAnaerobicHeartRateLowerLimit(data: Data([0x5e])))
    }
    
    @Test func anaerobicHeartRateUpperLimit() {
        
        typealias BeatsPerMinute = GATTAnaerobicHeartRateUpperLimit.BeatsPerMinute
        
        #expect(GATTAnaerobicHeartRateUpperLimit(data: Data([0x3d, 0x72])) == nil)
        
        let data = Data([0x22])
        
        let beats: BeatsPerMinute = 34
        
        guard let characteristic = GATTAnaerobicHeartRateUpperLimit(data: data)
            else { Issue.record("Could not decode from bytes"); return }
        
        #expect(characteristic.data == data)
        #expect(characteristic.beats == beats)
        #expect(characteristic.description == "34")
        #expect(beats.description == "34")
        #expect(GATTAnaerobicHeartRateUpperLimit.uuid == BluetoothUUID.Characteristic.anaerobicHeartRateUpperLimit)
        #expect(GATTAnaerobicHeartRateUpperLimit(data: data) == GATTAnaerobicHeartRateUpperLimit(data: data))
        #expect(BeatsPerMinute.unitType == .beatsPerMinute)
        #expect(GATTAnaerobicHeartRateUpperLimit(data: Data([0x4f])) != GATTAnaerobicHeartRateUpperLimit(data: Data([0x5e])))
    }
    
    @Test func barometricPressureTrend() {
        
        #expect(GATTBarometricPressureTrend(data: Data([0x3d, 0x72])) == nil)
        #expect(GATTBarometricPressureTrend(data: Data([0xFF])) == nil)
        
        let data = Data([0x01])
        
        guard let characteristic = GATTBarometricPressureTrend(data: data)
            else { Issue.record("Could not decode from bytes"); return }
        
        #expect(characteristic.data == data)
        #expect(GATTBarometricPressureTrend(data: Data([0x01])) == GATTBarometricPressureTrend.continuouslyFalling)
        #expect(GATTBarometricPressureTrend.uuid == BluetoothUUID.Characteristic.barometricPressureTrend)
        #expect(GATTBarometricPressureTrend.unitType == .unitless)
        #expect(GATTBarometricPressureTrend(data: data) == GATTBarometricPressureTrend(data: data))
    }
    
    @Test func bootMouseInputReport() {
        
        #expect(GATTBootMouseInputReport(data: Data([0x3d, 0x72])) == nil)
        
        let data = Data([0x01])
        
        guard let characteristic = GATTBootMouseInputReport(data: data)
            else { Issue.record("Could not decode from bytes"); return }
        
        #expect(characteristic.data == data)
        #expect(characteristic.description == "1")
        #expect(characteristic == 1)
        #expect(GATTBootMouseInputReport.uuid == BluetoothUUID.Characteristic.bootMouseInputReport)
    }
    
    @Test func bootKeyboardInputReport() {
        
        #expect(GATTBootKeyboardInputReport(data: Data([0x3d, 0x72])) == nil)
        
        let data = Data([0x01])
        
        guard let characteristic = GATTBootKeyboardInputReport(data: data)
            else { Issue.record("Could not decode from bytes"); return }
        
        #expect(characteristic.data == data)
        #expect(characteristic.description == "1")
        #expect(characteristic == 1)
        #expect(GATTBootKeyboardInputReport.uuid == BluetoothUUID.Characteristic.bootKeyboardInputReport)
    }
    
    @Test func bootKeyboardOutputReport() {
        
        #expect(GATTBootKeyboardOutputReport(data: Data([0x3d, 0x72])) == nil)
        
        let data = Data([0x01])
        
        guard let characteristic = GATTBootKeyboardOutputReport(data: data)
            else { Issue.record("Could not decode from bytes"); return }
        
        #expect(characteristic.data == data)
        #expect(characteristic.description == "1")
        #expect(characteristic == 1)
        #expect(GATTBootKeyboardOutputReport.uuid == BluetoothUUID.Characteristic.bootKeyboardOutputReport)
    }
    
    @Test func batteryPowerState() {
        
        let data = Data([0b00_01_10_11])
        
        guard let characteristic = GATTBatteryPowerState(data: data)
            else { Issue.record("Could not decode from bytes"); return }
        
        #expect(characteristic.data == data)
        #expect(characteristic.presentState == .unknown)
        #expect(characteristic.dischargeState == .notSupported)
        #expect(characteristic.chargeState == .notCharging)
        #expect(characteristic.levelState == .criticallyLow)
        #expect(GATTBatteryPowerState.uuid == BluetoothUUID.Characteristic.batteryEnergyStatus)
        #expect(GATTBatteryPowerState(data: data) == GATTBatteryPowerState(data: data))
    }
    
    @Test func bodySensorLocation() {
        
        let data = Data([0x01])
        
        guard let characteristic = GATTBodySensorLocation(data: data)
            else { Issue.record("Could not decode from bytes"); return }
        
        #expect(characteristic.data == data, "Encoded data does not match expected encoded data")
        
        // enum values
        #expect(GATTBodySensorLocation(data: Data([0x00])) == .other, "The value 0x00 should be interpreted as Other")
        #expect(GATTBodySensorLocation(data: Data([0x01])) == .chest, "The value 0x01 should be interpreted as Chest")
        #expect(GATTBodySensorLocation(data: Data([0x02])) == .wrist, "The value 0x02 should be interpreted as Wrist")
        #expect(GATTBodySensorLocation(data: Data([0x03])) == .finger, "The value 0x03 should be interpreted as Finger")
        #expect(GATTBodySensorLocation(data: Data([0x04])) == .hand, "The value 0x04 should be interpreted as Hand")
        #expect(GATTBodySensorLocation(data: Data([0x05])) == .earLobe, "The value 0x05 should be interpreted as Ear Lobe")
        #expect(GATTBodySensorLocation(data: Data([0x06])) == .foot, "The value 0x06 should be interpreted as Foot")
        
        // text values
        #expect(GATTBodySensorLocation(data: Data([0x00]))?.description == "Other", "The value 0x00 should be interpreted as Other")
        #expect(GATTBodySensorLocation(data: Data([0x01]))?.description == "Chest", "The value 0x01 should be interpreted as Chest")
        #expect(GATTBodySensorLocation(data: Data([0x02]))?.description == "Wrist", "The value 0x02 should be interpreted as Wrist")
        #expect(GATTBodySensorLocation(data: Data([0x03]))?.description == "Finger", "The value 0x03 should be interpreted as Finger")
        #expect(GATTBodySensorLocation(data: Data([0x04]))?.description == "Hand", "The value 0x04 should be interpreted as Hand")
        #expect(GATTBodySensorLocation(data: Data([0x05]))?.description == "Ear Lobe", "The value 0x05 should be interpreted as Ear Lobe")
        #expect(GATTBodySensorLocation(data: Data([0x06]))?.description == "Foot", "The value 0x06 should be interpreted as Foot")
        
        // GATT characteristic UUID
        #expect(GATTBodySensorLocation.uuid == BluetoothUUID.Characteristic.bodySensorLocation)
        
        // equality
        #expect(GATTBodySensorLocation(data: data) == GATTBodySensorLocation(data: data))
    }
    
    @Test func centralAddressResolution() {
        
        let data = Data([0x01])
        
        guard let characteristic = GATTCentralAddressResolution(data: data)
            else { Issue.record("Could not decode from bytes"); return }
        
        #expect(characteristic.data == data, "Encoded data does not match expected encoded data")
        #expect(characteristic == true, "The value 0x01 should be interpreted as Supported")
        #expect(GATTCentralAddressResolution.uuid == BluetoothUUID.Characteristic.centralAddressResolution)
        #expect(GATTCentralAddressResolution(data: Data([0x00])) == false, "The value 0x00 should be interpreted as Not Supported")
    }
    
    @Test func bodyCompositionMeasurement() {
        
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
            else { Issue.record("Could not init mass"); return }
        guard let metre = mt
            else { Issue.record("Could not init mass"); return }
        guard let pound = lb
            else { Issue.record("Could not init mass"); return }
        guard let inch = inc
            else { Issue.record("Could not init mass"); return }
        
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
        
        #expect(complexFlag == complexCharacteristic.flags)
        #expect(complexData == complexCharacteristic.data)
        
        guard let complexCharacteristic2 = GATTBodyCompositionMeasurement(data: complexData)
            else { Issue.record("Could not decode from bytes"); return }
        #expect(complexCharacteristic2.data == complexData)
        
        #expect(Mass(unit: .kilogram) == siMass.unit)
        #expect(Mass(unit: .absorbedDose) == nil)
        #expect(kilogram.unit == UnitIdentifier.kilogram)
        
        #expect(Length(unit: .metre) == siLenght.unit)
        #expect(Length(unit: .absorbedDose) == nil)
        #expect(inch.unit == UnitIdentifier.inch)
        
        #expect(Mass.kilogram == siMass.unit)
        #expect(Mass.pound == imperialMass.unit)
        
        #expect(Length.metre == siLenght.unit)
        #expect(Length.inch == imperialLenght.unit)
        
        #expect(GATTBodyPercentage(rawValue: emptyUnit16) == GATTBodyPercentage(rawValue: emptyUnit16))
        #expect(GATTBodyPercentage(rawValue: emptyUnit16).description == "0%")
        #expect(GATTBodyPercentage.unitType == .percentage)
        
        #expect(GATTBodyResistance(rawValue: emptyUnit16) == GATTBodyResistance(rawValue: emptyUnit16))
        #expect(GATTBodyResistance(rawValue: emptyUnit16).description == "0")
        #expect(GATTBodyResistance.unitType == .electricResistance)
        
        #expect(GATTBodyEnergy(rawValue: emptyUnit16) == GATTBodyEnergy(rawValue: emptyUnit16))
        #expect(GATTBodyEnergy(rawValue: emptyUnit16).description == "0")
        #expect(GATTBodyEnergy.unitType == .energy)
        
        #expect(BodyMass(rawValue: emptyUnit16, unit: kilogram) == BodyMass(rawValue: emptyUnit16, unit: kilogram))
        #expect(BodyMass(rawValue: emptyUnit16, unit: kilogram).description == "0")
        
        #expect(BodyLength(rawValue: emptyUnit16, unit: inch) == BodyLength(rawValue: emptyUnit16, unit: inch))
        #expect(BodyLength(rawValue: emptyUnit16, unit: inch).description == "0")
        
        guard let characteristic = GATTBodyCompositionMeasurement(data: data)
            else { Issue.record("Could not decode from bytes"); return }
        
        #expect(GATTBodyCompositionMeasurement(data: Data([0x00, 0x00])) == nil)
        #expect(GATTBodyCompositionMeasurement(data: Data([0x00, 0x00, 0x00])) == nil)
        
        #expect(characteristic.data == data)
        
        #expect(GATTBodyCompositionMeasurement.uuid == BluetoothUUID.Characteristic.bodyCompositionMeasurement)
    }
    
    @Test func cGMSessionRunTime() {
        
        let data = Data([0x1f, 0xe5, 0x81, 0xa2])
        
        guard let characteristic = GATTCGMSessionRunTime(data: data)
            else { Issue.record("Could not decode from bytes"); return }
        
        #expect(characteristic.data == data)
        #expect(characteristic.sessionRunTime == 0xe51f)
        #expect(characteristic.sessionRunTime.description == "58655")
        #expect(characteristic.description == "58655 41601")
        
        #expect(GATTCGMSessionRunTime.uuid == BluetoothUUID.Characteristic.cgmSessionRunTime)
        #expect(GATTCGMSessionRunTime.Hour.unitType == .hour)
        #expect(GATTCGMSessionRunTime(data: data) == GATTCGMSessionRunTime(data: data))
        
        #expect(GATTE2ecrc(rawValue: 470) == 470)
        #expect(GATTE2ecrc(rawValue: 470).description == "470")
    }
    
    @Test func modelNumberString() {
        
        let data = Data([0x62, 0x6c, 0x75, 0x65, 0x74, 0x6f, 0x6f, 0x74, 0x68])
        
        guard let characteristic = GATTModelNumber(data: data)
            else { Issue.record("Could not decode from bytes"); return }
        
        #expect(characteristic.data == data)
        #expect(characteristic.rawValue == "bluetooth")
        #expect(characteristic.description == "bluetooth")
        #expect(GATTModelNumber.uuid == BluetoothUUID.Characteristic.modelNumberString)
        #expect(GATTModelNumber(data: data) == "bluetooth")
    }
    
    @Test func firmwareRevisionString() {
        
        let data = Data([0x62, 0x6c, 0x75, 0x65, 0x74, 0x6f, 0x6f, 0x74, 0x68])
        
        guard let characteristic = GATTFirmwareRevisionString(data: data)
            else { Issue.record("Could not decode from bytes"); return }
        
        #expect(characteristic.data == data)
        #expect(characteristic.rawValue == "bluetooth")
        #expect(characteristic.description == "bluetooth")
        #expect(GATTFirmwareRevisionString.uuid == BluetoothUUID.Characteristic.firmwareRevisionString)
        #expect(GATTFirmwareRevisionString(data: data) == "bluetooth")
    }
    
    @Test func softwareRevisionString() {
        
        let data = Data([0x62, 0x6c, 0x75, 0x65, 0x74, 0x6f, 0x6f, 0x74, 0x68])
        
        guard let characteristic = GATTSoftwareRevisionString(data: data)
            else { Issue.record("Could not decode from bytes"); return }
        
        #expect(characteristic.data == data)
        #expect(characteristic.rawValue == "bluetooth")
        #expect(characteristic.description == "bluetooth")
        #expect(GATTSoftwareRevisionString.uuid == BluetoothUUID.Characteristic.softwareRevisionString)
        #expect(GATTSoftwareRevisionString(data: data) == "bluetooth")
    }
    
    @Test func hardwareRevisionString() {
        
        let data = Data([0x62, 0x6c, 0x75, 0x65, 0x74, 0x6f, 0x6f, 0x74, 0x68])
        
        guard let characteristic = GATTHardwareRevisionString(data: data)
            else { Issue.record("Could not decode from bytes"); return }
        
        #expect(characteristic.data == data)
        #expect(characteristic.rawValue == "bluetooth")
        #expect(characteristic.description == "bluetooth")
        #expect(GATTHardwareRevisionString.uuid == BluetoothUUID.Characteristic.hardwareRevisionString)
        #expect(GATTHardwareRevisionString(data: data) == "bluetooth")
    }
    
    @Test func serialNumberString() {
        
        let data = Data([0x62, 0x6c, 0x75, 0x65, 0x74, 0x6f, 0x6f, 0x74, 0x68])
        
        guard let characteristic = GATTSerialNumberString(data: data)
            else { Issue.record("Could not decode from bytes"); return }
        
        #expect(characteristic.data == data)
        #expect(characteristic.rawValue == "bluetooth")
        #expect(characteristic.description == "bluetooth")
        #expect(GATTSerialNumberString.uuid == BluetoothUUID.Characteristic.serialNumberString)
        #expect(GATTSerialNumberString(data: data) == "bluetooth")
    }
    
    @Test func manufacturerNameString() {
        
        let data = Data([0x62, 0x6c, 0x75, 0x65, 0x74, 0x6f, 0x6f, 0x74, 0x68])
        
        guard let characteristic = GATTManufacturerNameString(data: data)
            else { Issue.record("Could not decode from bytes"); return }
        
        #expect(characteristic.data == data)
        #expect(characteristic.rawValue == "bluetooth")
        #expect(characteristic.description == "bluetooth")
        #expect(GATTManufacturerNameString.uuid == BluetoothUUID.Characteristic.manufacturerNameString)
        #expect(GATTManufacturerNameString(data: data) == "bluetooth")
    }
    
    @Test func pnPID() {
        
        let data = Data([0x02, 0x01, 0x5f, 0x01, 0x5f, 0x01, 0x5f])
        
        guard let characteristic = GATTPnPID(data: data)
            else { Issue.record("Could not decode from bytes"); return }
        
        #expect(characteristic.data == data)
        #expect(characteristic.vendorIdSource == .fromVendorIDValue)
        #expect(characteristic.description == "2 24321 24321 24321")
        #expect(GATTPnPID.uuid == BluetoothUUID.Characteristic.pnpId)
        #expect(GATTPnPID(data: data) == GATTPnPID(data: data))
        
        #expect(characteristic.vendorIdSource.description == "2")
        #expect(characteristic.vendorId == 24321)
        #expect(characteristic.productId == 24321)
        #expect(characteristic.productId == 24321)
    }
    
    @Test func systemID() {
        
        #expect(GATTSystemID.uuid == BluetoothUUID.Characteristic.systemId)
        
        #expect(GATTSystemID(data: Data([])) == nil)
        #expect(GATTSystemID(data: Data([0xff])) == nil)
        #expect(GATTSystemID(data: Data([0xff, 0xff])) == nil)
        #expect(GATTSystemID(data: Data([0xff, 0xff, 0xff])) == nil)
        
        do {
            
            /**
             If the system ID is based of a Bluetooth Device Address with a Company Identifier (OUI) is 0x123456 and the Company Assigned Identifier is 0x9ABCDE, then the System Identifier is required to be 0x123456FFFE9ABCDE.
             */
            
            let data = Data([0x12, 0x34, 0x56, 0xFF, 0xFE, 0x9A, 0xBC, 0xDE].reversed())
            
            let address = BluetoothAddress(rawValue: "12:34:56:9A:BC:DE")!
            let manufacturerIdentifier: UInt40 = 0xFFFE9ABCDE
            let organizationallyUniqueIdentifier: UInt24 = 0x123456
            
            let characteristic = GATTSystemID(manufacturerIdentifier: manufacturerIdentifier,
                                              organizationallyUniqueIdentifier: organizationallyUniqueIdentifier)
                        
            #expect(characteristic.manufacturerIdentifier == manufacturerIdentifier)
            #expect(characteristic.organizationallyUniqueIdentifier == organizationallyUniqueIdentifier)
            #expect(characteristic.description == "123456FFFE9ABCDE")
            #expect(characteristic.rawValue == 0x123456FFFE9ABCDE)
            #expect(characteristic.data == data)
            #expect(characteristic == GATTSystemID(data: data))
            #expect(characteristic == GATTSystemID(address: address))
        }
        
        do {
            let data = Data([0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00])
            
            guard let characteristic = GATTSystemID(data: data)
                else { Issue.record("Could not decode from bytes"); return }
            
            #expect(characteristic.manufacturerIdentifier == 0x0000000000000000)
            #expect(characteristic.organizationallyUniqueIdentifier == 0x0000000000000000)
            #expect(characteristic.description == "0000000000000000")
            #expect(characteristic.rawValue == 0x0000000000000000)
            #expect(GATTSystemID(data: data) == GATTSystemID(data: data))
        }
        
        do {
            let data = Data([0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff])
            
            guard let characteristic = GATTSystemID(data: data)
                else { Issue.record("Could not decode from bytes"); return }
            
            #expect(characteristic.manufacturerIdentifier == 1099511627775)
            #expect(characteristic.organizationallyUniqueIdentifier == 16777215)
            #expect(characteristic.description == "FFFFFFFFFFFFFFFF")
            #expect(characteristic.rawValue == 0xFFFFFFFFFFFFFFFF)
            #expect(GATTSystemID(data: data) == GATTSystemID(data: data))
        }
    }
    
    @Test func indoorPositioningConfiguration() {
        
        typealias Configuration = GATTIndoorPositioningConfiguration.Configuration
        
        let data = Data([0b00111111])
        
        guard let characteristic = GATTIndoorPositioningConfiguration(data: data)
            else { Issue.record("Could not decode from bytes"); return }
        
        let configurations: BitMaskOptionSet<Configuration> = [.coordinates, .coordinateSystemUsed, .txPowerField, .altitudeField, .floorNumber, .locationName]
        #expect(characteristic.data == data)
        #expect(characteristic.configurations == configurations, "The value 0x03 is interpreted as “Simple Alert and Email bits set")
        #expect(GATTIndoorPositioningConfiguration.uuid == BluetoothUUID.Characteristic.indoorPositioningConfiguration)
    }
    
    @Test func latitude() {
        
        let data = Data([0xEA, 0x00, 0x00, 0x00])
        let latitude = Int32(bitPattern: UInt32(littleEndian: UInt32(bytes: (data[0], data[1], data[2], data[3]))))
        
        guard let characteristic = GATTLatitude(data: data)
            else { Issue.record("Could not decode from bytes"); return }
        
        #expect(characteristic == 234)
        #expect(characteristic.data == data)
        #expect(characteristic.rawValue == latitude)
        #expect(characteristic.description == "234")
        #expect(GATTLatitude.uuid == BluetoothUUID.Characteristic.latitude)
        #expect(GATTLatitude(data: data) == GATTLatitude(data: data))
    }
    
    @Test func longitude() {
        
        let data = Data([0xEA, 0x00, 0x00, 0x00])
        let longitude = Int32(bitPattern: UInt32(littleEndian: UInt32(bytes: (data[0], data[1], data[2], data[3]))))
        
        guard let characteristic = GATTLongitude(data: data)
            else { Issue.record("Could not decode from bytes"); return }
        
        #expect(characteristic == 234)
        #expect(characteristic.data == data)
        #expect(characteristic.rawValue == longitude)
        #expect(characteristic.description == "234")
        #expect(GATTLongitude.uuid == BluetoothUUID.Characteristic.longitude)
        #expect(GATTLongitude(data: data) == GATTLongitude(data: data))
    }
    
    @Test func localNorthCoordinate() {
        
        let data = Data([0xEA, 0x00])
        let localNorthCoordinate = Int16(bitPattern: UInt16(littleEndian: UInt16(bytes: (data[0], data[1]))))
        
        guard let characteristic = GATTLocalNorthCoordinate(data: data)
            else { Issue.record("Could not decode from bytes"); return }
        
        #expect(characteristic == 234)
        #expect(characteristic.data == data)
        #expect(characteristic.rawValue == localNorthCoordinate)
        #expect(characteristic.description == "234")
        #expect(GATTLocalNorthCoordinate.uuid == BluetoothUUID.Characteristic.localNorthCoordinate)
        #expect(GATTLocalNorthCoordinate(data: data) == GATTLocalNorthCoordinate(data: data))
    }
    
    @Test func localEastCoordinate() {
        
        let data = Data([0xEA, 0x00])
        let localEastCoordinate = Int16(bitPattern: UInt16(littleEndian: UInt16(bytes: (data[0], data[1]))))
        
        guard let characteristic = GATTLocalEastCoordinate(data: data)
            else { Issue.record("Could not decode from bytes"); return }
        
        #expect(characteristic == 234)
        #expect(characteristic.data == data)
        #expect(characteristic.rawValue == localEastCoordinate)
        #expect(characteristic.description == "234")
        #expect(GATTLocalEastCoordinate.uuid == BluetoothUUID.Characteristic.localEastCoordinate)
        #expect(GATTLocalEastCoordinate(data: data) == GATTLocalEastCoordinate(data: data))
    }
    
    @Test func floorNumber() {
        
        let data = Data([0xEA])
        
        guard let characteristic = GATTFloorNumber(data: data)
            else { Issue.record("Could not decode from bytes"); return }
        
        #expect(characteristic == 234)
        #expect(characteristic.data == data)
        #expect(characteristic.rawValue == data[0])
        #expect(characteristic.description == "234")
        #expect(GATTFloorNumber.uuid == BluetoothUUID.Characteristic.floorNumber)
        #expect(GATTFloorNumber(data: data) == GATTFloorNumber(data: data))
    }
    
    @Test func uncertainty() {
        
        let data = Data([0b0111_1111])
        
        guard let characteristic = GATTUncertainty(data: data)
            else { Issue.record("Could not decode from bytes"); return }
        
        #expect(characteristic.data == data)
        #expect(characteristic.stationary == .mobile)
        #expect(characteristic.updateTime == .upTo3541s)
        #expect(characteristic.precision == .unknown)
        #expect(GATTUncertainty.uuid == BluetoothUUID.Characteristic.uncertainty)
        #expect(GATTUncertainty(data: data) == GATTUncertainty(data: data))
    }
    
    @Test func locationName() {
        
        let data = Data([0x62, 0x6c, 0x75, 0x65, 0x74, 0x6f, 0x6f, 0x74, 0x68])
        
        guard let characteristic = GATTLocationName(data: data)
            else { Issue.record("Could not decode from bytes"); return }
        
        #expect(characteristic.data == data)
        #expect(characteristic.rawValue == "bluetooth")
        #expect(characteristic.description == "bluetooth")
        #expect(GATTLocationName.uuid == BluetoothUUID.Characteristic.locationName)
        #expect(GATTLocationName(data: data) == "bluetooth")
    }
    
    @Test func dayOfWeek() {
        
        let data = Data([7])
        
        guard let characteristic = GATTDayOfWeek(data: data)
            else { Issue.record("Could not decode from bytes"); return }
        
        #expect(characteristic.data == data)
        #expect(characteristic.day == .sunday)
        #expect(characteristic.description == "7")
        #expect(GATTDayOfWeek.uuid == BluetoothUUID.Characteristic.dayOfWeek)
        #expect(GATTDayOfWeek.Day.unitType == .day)
        #expect(GATTDayOfWeek(data: data) == GATTDayOfWeek(data: data))
    }
    
    @Test func dayDateTime() {
        
        do {
            let data = Data([203, 7, 4, 24, 12, 5, 30, 7])
            
            guard let characteristic = GATTDayDateTime(data: data)
                else { Issue.record(); return }
            
            #expect(characteristic.data == data)
            #expect(characteristic.dateTime.data == Data([203, 7, 4, 24, 12, 5, 30]))
            #expect(characteristic.dayOfWeek == GATTDayOfWeek(day: .sunday))
            #expect(characteristic.dayOfWeek.day == .sunday)
            #expect(GATTDayDateTime.uuid == BluetoothUUID.Characteristic.dayDateTime)
            #expect(GATTDayDateTime(data: data) == GATTDayDateTime(data: data))
        }
    }
    
    @Test func exactTime256() {
        
        do {
            let data = Data([203, 7, 4, 24, 12, 5, 30, 7, 245])
            
            guard let characteristic = GATTExactTime256(data: data)
                else { Issue.record(); return }
            
            #expect(characteristic.data == data)
            #expect(characteristic.dayDateTime.data == Data([203, 7, 4, 24, 12, 5, 30, 7]))
            #expect(characteristic.fractions256 == 245)
            #expect(GATTExactTime256.uuid == BluetoothUUID.Characteristic.exactTime256)
            #expect(GATTExactTime256(data: data) == GATTExactTime256(data: data))
        }
    }
    
    @Test func timeZone() {
        
        #expect(GATTTimeZone(rawValue: -50) == nil)
        #expect(GATTTimeZone(rawValue: 70) == nil)
        #expect(GATTTimeZone(rawValue: -128) != nil)
        
        do {
            let data = Data([0x0c])
            
            guard let characteristic = GATTTimeZone(data: data)
                else { Issue.record(); return }
            
            #expect(characteristic.data == data)
            #expect(characteristic.rawValue == 12)
            #expect(GATTTimeZone.uuid == BluetoothUUID.Characteristic.timeZone)
            #expect(GATTTimeZone(data: data) == GATTTimeZone(data: data))
        }
    }
    
    @Test func dstOffset() {
        
        let data = Data([4])
        
        guard let characteristic = GATTDstOffset(data: data)
            else { Issue.record("Could not decode from bytes"); return }
        
        #expect(characteristic.data == data)
        #expect(characteristic == .daylightTime)
        #expect(characteristic.description == "4")
        #expect(GATTDstOffset.uuid == BluetoothUUID.Characteristic.dstOffset)
        #expect(GATTDstOffset(data: data) == GATTDstOffset(data: data))
    }
    
    @Test func localTimeInformation() {
        
        do {
            let data = Data([0x0c, 4])
            
            guard let characteristic = GATTLocalTimeInformation(data: data)
                else { Issue.record(); return }
            
            #expect(characteristic.data == data)
            #expect(characteristic.timeZone.data == Data([0x0c]))
            #expect(characteristic.dstOffset == .daylightTime)
            #expect(GATTLocalTimeInformation.uuid == BluetoothUUID.Characteristic.localTimeInformation)
            #expect(GATTLocalTimeInformation(data: data) == GATTLocalTimeInformation(data: data))
        }
    }
    
    @Test func timeSource() {
        
        let data = Data([1])
        
        guard let characteristic = GATTTimeSource(data: data)
            else { Issue.record("Could not decode from bytes"); return }
        
        #expect(characteristic.data == data)
        #expect(characteristic == .networkTimeProtocol)
        #expect(characteristic.description == "1")
        #expect(GATTTimeSource.uuid == BluetoothUUID.Characteristic.timeSource)
        #expect(GATTTimeSource(data: data) == GATTTimeSource(data: data))
    }
    
    @Test func timeAccuracy() {
        
        do {
            let data = Data([0x0c])
            
            guard let characteristic = GATTTimeAccuracy(data: data)
                else { Issue.record(); return }
            
            #expect(characteristic.data == data)
            #expect(characteristic.rawValue == 12)
            #expect(characteristic.description == "12")
            #expect(characteristic == 12)
            #expect(GATTTimeAccuracy.uuid == BluetoothUUID.Characteristic.timeAccuracy)
            #expect(GATTTimeAccuracy(data: data) == GATTTimeAccuracy(data: data))
        }
    }
    
    @Test func referenceTimeInfomation() {
        
        do {
            typealias Day = GATTReferenceTimeInformation.Day
            typealias Hour = GATTReferenceTimeInformation.Hour
            
            let data = Data([0x03, 0x0b, 5, 6])
            
            guard let characteristic = GATTReferenceTimeInformation(data: data)
                else { Issue.record(); return }
            
            #expect(characteristic.data == data)
            #expect(characteristic.timeSource == .radioTimeSignal)
            #expect(characteristic.timeAccuracy.rawValue == 0x0b)
            #expect(characteristic.daysSinceUpdate == 5)
            #expect(characteristic.daysSinceUpdate.description == "5")
            #expect(characteristic.hoursSinceUpdate.rawValue == 6)
            #expect(characteristic.hoursSinceUpdate.description == "6")
            #expect(Day.unitType == .day)
            #expect(Hour.unitType == .hour)
            #expect(GATTReferenceTimeInformation.uuid == BluetoothUUID.Characteristic.referenceTimeInformation)
            #expect(GATTReferenceTimeInformation(data: data) == GATTReferenceTimeInformation(data: data))
        }
    }
    
    @Test func crossTrainerData() {
        
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
        
        #expect(GATTCrossTrainerData(data: Data([0x00, 0x00])) == nil)
        
        do {
            let data = Data([0b00000000, 0b00000000, 0b00000000])
            #expect(GATTCrossTrainerData(data: data) != nil)
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
                else { Issue.record("Could not decode from bytes"); return }
            
            #expect(characteristic != nil)
            #expect(GATTCrossTrainerData.uuid == BluetoothUUID.Characteristic.crossTrainerData)
            #expect(characteristic.instantaneousSpeed == KilometerPerHour(rawValue: 1285))
            #expect(characteristic.averageSpeed == KilometerPerHour(rawValue: 1285))
            #expect(characteristic.totalDistance == MetreBit24(rawValue: 328965))
            #expect(characteristic.stepPerMinute == StepPerMinute(rawValue: 1285))
            #expect(characteristic.averageStepRate == StepPerMinute(rawValue: 1285))
            #expect(characteristic.strideCount == UnitlessUnsigned(rawValue: 1285))
            #expect(characteristic.positiveElevationGain == MetreBit16(rawValue: 1285))
            #expect(characteristic.negativeElevationGain == MetreBit16(rawValue: 1285))
            #expect(characteristic.inclination == Percentage(rawValue: 1285))
            #expect(characteristic.rampAngleSetting == PlainAngleDegree(rawValue: 1285))
            #expect(characteristic.resistanceLevel == UnitlessSigned(rawValue: 1285))
            #expect(characteristic.instantaneousPower == Power(rawValue: 1285))
            #expect(characteristic.averagePower == Power(rawValue: 1285))
            #expect(characteristic.totalEnergy == GATTKilogramCalorie.Bits16(rawValue: 1285))
            #expect(characteristic.energyPerHour == GATTKilogramCalorie.Bits16(rawValue: 1285))
            #expect(characteristic.energyPerMinute == GATTKilogramCalorie.Byte(rawValue: 5))
            #expect(characteristic.heartRate == GATTBeatsPerMinute.Byte(rawValue: 5))
            #expect(characteristic.metabolicEquivalent == MetabolicEquivalent(rawValue: 5))
            #expect(characteristic.elapsedTime == Time(rawValue: 1285))
            #expect(characteristic.remainingTime == Time(rawValue: 1285))
            
            #expect(KilometerPerHour.unitType == .kilometrePerHour)
            #expect(StepPerMinute.unitType == .step)
            #expect(MetreBit24.unitType == .metre)
            #expect(MetreBit16.unitType == .metre)
            #expect(UnitlessUnsigned.unitType == .unitless)
            #expect(UnitlessSigned.unitType == .unitless)
            #expect(Percentage.unitType == .percentage)
            #expect(PlainAngleDegree.unitType == .degree)
            #expect(Power.unitType == .power)
            #expect(GATTKilogramCalorie.Bits16.unitType == .kilogramCalorie)
            #expect(GATTKilogramCalorie.Byte.unitType == .kilogramCalorie)
            #expect(MetabolicEquivalent.unitType == .metabolicEquivalent)
            #expect(Time.unitType == .second)
            
            #expect(GATTCrossTrainerData(instantaneousSpeed: 1285,
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
                                                remainingTime: 1285) == characteristic)
            
            #expect(characteristic.flags == BitMaskOptionSet<GATTCrossTrainerData.Flag>(rawValue: UInt32(bytes: (0b11111111, 0b01111111, 0x00, 0x00))))
            #expect(characteristic.data == data)
        }
    }
    
    @Test func timeUpdateControlPoint() {
        
        let data = Data([1])
        
        do {
            guard let characteristic = GATTTimeUpdateControlPoint(data: data)
                else { Issue.record("Could not decode from bytes"); return }
            
            #expect(characteristic.data == data)
        }
        
        #expect(GATTTimeUpdateControlPoint(data: Data([1])) == .getReferenceUpdate)
        #expect(GATTTimeUpdateControlPoint(data: Data([2])) == .cancelReferenceUpdate)
        #expect(GATTTimeUpdateControlPoint.uuid == BluetoothUUID.Characteristic.timeUpdateControlPoint)
        #expect(GATTTimeUpdateControlPoint(data: data) == GATTTimeUpdateControlPoint(data: data))
    }
    
    @Test func timeUpdateState() {
        
        let data = Data([0x00, 0x02])
        
        guard let characteristic = GATTTimeUpdateState(data: data)
            else { Issue.record("Could not decode from bytes"); return }
        
        #expect(characteristic.data == data)
        #expect(characteristic.currentState == .idle)
        #expect(characteristic.result == .noConnectionToReference)
        #expect(GATTTimeUpdateState.uuid == BluetoothUUID.Characteristic.timeUpdateState)
        #expect(GATTTimeUpdateState(data: data) == GATTTimeUpdateState(data: data))
    }
    
    @Test func timeWithDst() {
        
        do {
            let data = Data([203, 7, 4, 24, 12, 5, 30, 8])
            
            guard let characteristic = GATTTimeWithDst(data: data)
                else { Issue.record(); return }
            
            #expect(characteristic.data == data)
            #expect(characteristic.datetime == GATTDateTime(data: Data([203, 7, 4, 24, 12, 5, 30])))
            #expect(characteristic.dstOffset == GATTDstOffset(data: Data([8])))
            #expect(GATTTimeWithDst.uuid == BluetoothUUID.Characteristic.timeWithDst)
            #expect(GATTTimeWithDst(data: data) == GATTTimeWithDst(data: data))
        }
    }
    
    @Test func currentTime() {
        let data = Data([203, 7, 4, 24, 12, 5, 30, 7, 245, 0b00001111])
        
        guard let characteristic = GATTCurrentTime(data: data)
            else { Issue.record("Could not decode from bytes"); return }
        
        #expect(characteristic.data == data)
        #expect(characteristic.exactTime == GATTExactTime256(data: Data([203, 7, 4, 24, 12, 5, 30, 7, 245])))
        #expect(characteristic.adjustReason == BitMaskOptionSet<GATTCurrentTime.Flag>(rawValue: 0b00001111))
        #expect(GATTCurrentTime.uuid == BluetoothUUID.Characteristic.currentTime)
        #expect(GATTCurrentTime(data: data) == GATTCurrentTime(data: data))
        
        #expect(characteristic.adjustReason.contains(.manualTimeUpdate))
        #expect(characteristic.adjustReason.contains(.externalReference))
        #expect(characteristic.adjustReason.contains(.timeZoneChange))
        #expect(characteristic.adjustReason.contains(.dstChange))
    }
    
    @Test func dateUTC() {
        
        #expect(GATTDateUTC.Day(rawValue: 16777215) == nil)
        #expect(GATTDateUTC.Day(rawValue: 0) != nil)
        
        do {
            let data = Data([0xFE, 0xFF, 0xFF])
            
            guard let characteristic = GATTDateUTC(data: data)
                else { Issue.record(); return }
            
            #expect(characteristic.data == data)
            #expect(characteristic.date == GATTDateUTC.Day(rawValue: 16777214))
            #expect(characteristic.description == "16777214")
            #expect(GATTDateUTC.uuid == BluetoothUUID.Characteristic.dateUtc)
            #expect(GATTDateUTC.Day.unitType == .day)
            #expect(GATTDateUTC(data: data) == GATTDateUTC(data: data))
        }
    }
    
    @Test func scanRefresh() {
        
        #expect(GATTScanRefresh(data: Data([1])) == nil)
        
        let data = Data([0x00])
        
        guard let characteristic = GATTScanRefresh(data: data)
            else { Issue.record("Could not decode from bytes"); return }
        
        #expect(GATTScanRefresh.uuid == BluetoothUUID.Characteristic.scanRefresh)
        #expect(characteristic.data == data)
        #expect(characteristic.description == "0")
        #expect(characteristic == .serverRequiredRefresh)
    }
    
    @Test func scanIntervalWindow() {
        
        let data = Data([0x0, 0x40, 0x0, 0x40])
        
        guard let characteristics = GATTScanIntervalWindow(data: data)
            else { Issue.record("Could not decode from bytes"); return }
        
        #expect(characteristics.data == data)
        #expect(characteristics.scanInterval == LowEnergyScanTimeInterval(rawValue: 16384))
        #expect(characteristics.scanWindow == LowEnergyScanTimeInterval(rawValue: 16384))
        #expect(GATTScanIntervalWindow.uuid == BluetoothUUID.Characteristic.scanIntervalWindow)
        #expect(GATTScanIntervalWindow(data: data) == GATTScanIntervalWindow(data: data))
    }
    
    @Test func objectType() {
        
        let data = Data([0x0, 0x40])
        
        guard let characteristics = GATTObjectType(data: data)
            else { Issue.record("Could not decode from bytes"); return }
        
        #expect(characteristics.data == data)
        #expect(characteristics.rawValue == 16384)
        #expect(characteristics.description == "4000")
        #expect(GATTObjectType.uuid == BluetoothUUID.Characteristic.objectType)
        #expect(GATTObjectType(data: data) == GATTObjectType(data: data))
    }
    
    @Test func objectSize() {
        
        typealias Size = GATTObjectSize.Size
        
        let data = Data([0x0A, 0x40, 0x00, 0x00, 0x0A, 0x40, 0x00, 0x00])
        
        guard let characteristics = GATTObjectSize(data: data)
            else { Issue.record("Could not decode from bytes"); return }
        
        #expect(characteristics.data == data)
        #expect(characteristics.currentSize == Size(rawValue: 16394))
        #expect(characteristics.allocatedSize == Size(rawValue: 16394))
        #expect(GATTObjectSize.uuid == BluetoothUUID.Characteristic.objectSize)
        #expect(GATTObjectSize(data: data) == GATTObjectSize(data: data))
    }
    
    @Test func objectName() {
        
        let data = Data([0x62, 0x6c, 0x75, 0x65, 0x74, 0x6f, 0x6f, 0x74, 0x68])
        
        guard let characteristics = GATTObjectName(data: data)
            else { Issue.record("Could not decode from bytes"); return }
        
        #expect(characteristics.data == data)
        #expect(characteristics.rawValue == "bluetooth")
        #expect(characteristics.description == "bluetooth")
        #expect(GATTObjectName.uuid == BluetoothUUID.Characteristic.objectName)
        #expect(GATTObjectName(data: data) == GATTObjectName(data: data))
    }
    
    @Test func objectID() {
        
        let data = Data([0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF])
        
        guard let characteristics = GATTObjectID(data: data)
            else { Issue.record("Could not decode from bytes"); return }
        
        #expect(characteristics.data == data)
        #expect(UInt64(characteristics.rawValue) == 281474976710655)
        #expect(characteristics.description == "281474976710655")
        #expect(GATTObjectID.uuid == BluetoothUUID.Characteristic.objectId)
        #expect(GATTObjectID(data: data) == GATTObjectID(data: data))
    }
}

internal extension GATTCharacteristic {
    
    var data: Data {
        Data(self)
    }
}
#endif
