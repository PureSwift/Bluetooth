//
//  BluetoothTests.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 11/28/17.
//  Copyright © 2017 PureSwift. All rights reserved.
//

import XCTest
import Foundation
@testable import Bluetooth
import BluetoothHCI
import BluetoothGATT

final class BluetoothTests: XCTestCase {
    
    static let allTests = [
        ("testAdvertisingInterval", testAdvertisingInterval),
        ("testSecurityLevel", testSecurityLevel),
        ("testCompanyIdentifier", testCompanyIdentifier),
        ("testChannelIdentifier", testChannelIdentifier),
        ("testHCICommandTimeout", testHCICommandTimeout),
        ("testHCIVersion", testHCIVersion),
        ("testLowEnergyAdvertisingData", testLowEnergyAdvertisingData),
        ("testLowEnergyAddressType", testLowEnergyAddressType),
        ("testLowEnergyAdvertisingFilterPolicy", testLowEnergyAdvertisingFilterPolicy),
        ("testLowEnergyFeature", testLowEnergyFeature),
        ("testLowEnergyEventMask", testLowEnergyEventMask),
        ("testAdvertisingChannelHeader", testAdvertisingChannelHeader),
        ("testBitMaskOption", testBitMaskOption),
        ("testClassOfDevice", testClassOfDevice)
    ]
    
    func testAdvertisingInterval() {
        
        let value = AdvertisingInterval.default
        
        XCTAssertNil(AdvertisingInterval(rawValue: 0))
        XCTAssertNil(AdvertisingInterval(rawValue: .max))
        
        // Equatable, comparable, hashable
        XCTAssert(value < .max)
        XCTAssert(value > .min)
        XCTAssertNotEqual(value, .max)
        XCTAssertNotEqual(value, .min)
        
        // Range: 0x0020 to 0x4000
        XCTAssertEqual(AdvertisingInterval.min.miliseconds, 20.0, "The `advInterval` shall be an integer multiple of 0.625 ms in the range of `20` ms to `10.24` s")
        XCTAssertEqual(AdvertisingInterval.max.miliseconds, 10.24 * 1000, "The `advInterval` shall be an integer multiple of 0.625 ms in the range of `20` ms to `10.24` s")
        XCTAssertEqual(AdvertisingInterval.default.miliseconds, 1.28 * 1000, "Default: N = 0x0800 (1.28 second)")
        XCTAssertEqual("\(AdvertisingInterval.min)", "20.0ms")
        XCTAssertEqual("\(AdvertisingInterval.max)", "10240.0ms")
        XCTAssertEqual("\(AdvertisingInterval.default)", "1280.0ms")
    }
    
    func testSecurityLevel() {
        
        let level = SecurityLevel()
        
        XCTAssertTrue(level < .high)
        XCTAssertTrue(.low < .high)
    }
    
    func testCompanyIdentifier() {
        
        let company: CompanyIdentifier = 76 // Apple, Inc.
        
        XCTAssertEqual(company.description, "Apple, Inc.")
        XCTAssertNotEqual(company.hashValue, 0)
        XCTAssertNotEqual(company, 77)
    }
    
    func testChannelIdentifier() {
        
        XCTAssertEqual(ChannelIdentifier.att, 4)
        XCTAssertEqual(ChannelIdentifier.att.description, "4")
    }
    
    func testHCICommandTimeout() {
        
        let timeout: HCICommandTimeout = 1000
        
        XCTAssertEqual(timeout, .default)
        XCTAssertEqual(timeout.duration, 1.0)
        XCTAssertEqual(timeout.rawValue, 1000)
        XCTAssertNotEqual(timeout, 2000)
        XCTAssertEqual(timeout.description, "1.0 seconds")
    }
    
    func testHCIVersion() {
        
        XCTAssertEqual(HCIVersion.v4_2.rawValue, 0x8, "HCI Version: 4.2 (0x8)")
        
        XCTAssertEqual(HCIVersion.v4_0.description, "4.0")
        XCTAssertEqual(HCIVersion.v4_1.description, "4.1")
        XCTAssertEqual(HCIVersion.v4_2.description, "4.2")
        XCTAssertEqual(HCIVersion.v5_0.description, "5.0")
        
        XCTAssertEqual(HCIVersion.v4_0, .v4_0)
        XCTAssertNotEqual(HCIVersion.v4_0, .v5_0)
        XCTAssertLessThan(HCIVersion.v4_0, .v4_2)
        XCTAssertGreaterThan(HCIVersion.v5_0, .v4_2)
    }
    
    func testLowEnergyAdvertisingData() {
        
        do {
            
            // zeroed data
            XCTAssertEqual(LowEnergyAdvertisingData(data: Data())?.data, Data())
            XCTAssertEqual(LowEnergyAdvertisingData().data, Data())
            XCTAssertNotEqual(LowEnergyAdvertisingData().hashValue, 0)
        }
        
        do {
            
            let advertisingData: LowEnergyAdvertisingData = [0x0B, 0x09, 0x42, 0x6C, 0x75, 0x65, 0x5A, 0x20, 0x35, 0x2E, 0x34, 0x33]
            XCTAssertEqual(advertisingData.data.count, advertisingData.count)
            XCTAssertEqual(advertisingData, [0x0B, 0x09, 0x42, 0x6C, 0x75, 0x65, 0x5A, 0x20, 0x35, 0x2E, 0x34, 0x33])
            XCTAssertNotEqual(advertisingData.hashValue, 0)
        }
    }
    
    func testLowEnergyAddressType() {
        
        XCTAssertEqual(LowEnergyAddressType(), .public)
        XCTAssert(LowEnergyAddressType.public.isCompatible(with: .v4_0))
        XCTAssert(LowEnergyAddressType.public.isCompatible(with: .v4_2))
        XCTAssert(LowEnergyAddressType.public.isCompatible(with: .v5_0))
        XCTAssert(LowEnergyAddressType.random.isCompatible(with: .v4_0))
        XCTAssert(LowEnergyAddressType.random.isCompatible(with: .v4_2))
        XCTAssert(LowEnergyAddressType.random.isCompatible(with: .v5_0))
        XCTAssert(LowEnergyAddressType.publicIdentity.isCompatible(with: .v5_0))
        XCTAssert(LowEnergyAddressType.randomIdentity.isCompatible(with: .v5_0))
        XCTAssert(LowEnergyAddressType.publicIdentity.isCompatible(with: .v4_2) == false)
        XCTAssert(LowEnergyAddressType.randomIdentity.isCompatible(with: .v4_2) == false)
    }
    
    func testLowEnergyState() {
        
        var states = BitMaskOptionSet<LowEnergyState>.all
        XCTAssert(states.isEmpty == false)
        XCTAssertEqual(states.count, LowEnergyState.allCases.count)
        XCTAssert(Array(states) == LowEnergyState.allCases)
        states.forEach { XCTAssert(LowEnergyState.allCases.contains($0)) }
        
        states.removeAll()
        XCTAssert(states.count == 0)
        XCTAssert(states.isEmpty)
        
        XCTAssertEqual(LowEnergyStateSet.state0.states, [.nonConnectableAdvertising])
        XCTAssertEqual(LowEnergyStateSet.state1.states, [.scannableAdvertising])
        
        XCTAssertEqual(LowEnergyState.scannableAdvertising.description, "Scannable Advertising State")
    }
    
    func testLowEnergyAdvertisingFilterPolicy() {
        
        typealias FilterPolicy = HCILESetAdvertisingParameters.FilterPolicy
        
        XCTAssertEqual(FilterPolicy(), .any)
        XCTAssertEqual(FilterPolicy(whiteListScan: false, whiteListConnect: true), .whiteListConnect)
        XCTAssertEqual(FilterPolicy(whiteListScan: true, whiteListConnect: false), .whiteListScan)
        XCTAssertEqual(FilterPolicy(whiteListScan: true, whiteListConnect: true), .whiteListScanConnect)
        XCTAssertEqual(FilterPolicy(whiteListScan: false, whiteListConnect: false), .any)
    }
    
    func testLowEnergyFeature() {
        
        XCTAssertEqual(LowEnergyFeature.encryption.description, "LE Encryption")
        XCTAssert(LowEnergyFeature.encryption.isValidControllerToController)
        
        var featureSet: LowEnergyFeatureSet = [.encryption, .connectionParametersRequestProcedure, .ping]
        XCTAssert(featureSet.count == 3)
        XCTAssert(featureSet.isEmpty == false)
        XCTAssert(featureSet.contains(.encryption))
        XCTAssert(featureSet.contains(.connectionParametersRequestProcedure))
        XCTAssert(featureSet.contains(.ping))
        XCTAssert(featureSet.contains(.le2mPhy) == false)
        
        XCTAssert(featureSet.rawValue != LowEnergyFeature.encryption.rawValue)
        XCTAssert(featureSet.rawValue != LowEnergyFeature.connectionParametersRequestProcedure.rawValue)
        XCTAssert(featureSet.rawValue != LowEnergyFeature.ping.rawValue)
        XCTAssert(LowEnergyFeature(rawValue: featureSet.rawValue) == nil)
        
        XCTAssert(LowEnergyFeature.RawValue.bitWidth == LowEnergyFeatureSet.RawValue.bitWidth)
        XCTAssert(LowEnergyFeature.RawValue.bitWidth == MemoryLayout<LowEnergyFeature.RawValue>.size * 8)
        XCTAssert(LowEnergyFeature.RawValue.bitWidth == 64)
        
        XCTAssert(MemoryLayout<LowEnergyFeatureSet>.size == MemoryLayout<LowEnergyFeature.RawValue>.size)
        XCTAssert(MemoryLayout<LowEnergyFeatureSet>.size == 8) // 64 bit
        
        featureSet = .all
        XCTAssertFalse(featureSet.isEmpty)
        XCTAssertEqual(featureSet.count, LowEnergyFeature.allCases.count)
        XCTAssertEqual(Array(featureSet), LowEnergyFeature.allCases)
        
        typealias Bit64 = (UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8)
        let bigEndianByteValue: Bit64 = (0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01)
        let littleEndianByteValue: Bit64 = (0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00)
        let rawValue: UInt64 = 0b01
        
        XCTAssert(rawValue.littleEndian.bytes.0 == littleEndianByteValue.0)
        XCTAssert(rawValue.littleEndian.bytes.1 == littleEndianByteValue.1)
        XCTAssert(rawValue.littleEndian.bytes.2 == littleEndianByteValue.2)
        XCTAssert(rawValue.littleEndian.bytes.3 == littleEndianByteValue.3)
        XCTAssert(rawValue.littleEndian.bytes.4 == littleEndianByteValue.4)
        XCTAssert(rawValue.littleEndian.bytes.5 == littleEndianByteValue.5)
        XCTAssert(rawValue.littleEndian.bytes.6 == littleEndianByteValue.6)
        XCTAssert(rawValue.littleEndian.bytes.7 == littleEndianByteValue.7)
        XCTAssert(UInt64(littleEndian: UInt64(bytes: littleEndianByteValue)) == rawValue)
        
        XCTAssert(rawValue.bigEndian.bytes.0 == bigEndianByteValue.0)
        XCTAssert(rawValue.bigEndian.bytes.1 == bigEndianByteValue.1)
        XCTAssert(rawValue.bigEndian.bytes.2 == bigEndianByteValue.2)
        XCTAssert(rawValue.bigEndian.bytes.3 == bigEndianByteValue.3)
        XCTAssert(rawValue.bigEndian.bytes.4 == bigEndianByteValue.4)
        XCTAssert(rawValue.bigEndian.bytes.5 == bigEndianByteValue.5)
        XCTAssert(rawValue.bigEndian.bytes.6 == bigEndianByteValue.6)
        XCTAssert(rawValue.bigEndian.bytes.7 == bigEndianByteValue.7)
        XCTAssert(UInt64(bigEndian: UInt64(bytes: bigEndianByteValue)) == rawValue)
        
        featureSet.forEach { XCTAssert(LowEnergyFeature.allCases.contains($0)) }
        
        featureSet.removeAll()
        
        XCTAssertEqual(featureSet.rawValue, 0)
        XCTAssertEqual(featureSet.count, 0)
        XCTAssertEqual(featureSet.hashValue, featureSet.rawValue.hashValue)
    }
    
    func testLowEnergyEventMask() {
        
        typealias EventMask = HCILESetEventMask.EventMask
        
        XCTAssert(EventMask().isEmpty)
        XCTAssert(EventMask(rawValue: 0x00).isEmpty)
        XCTAssertEqual(0x0000_0000_0000_001F, 0b11111)
        
        XCTAssertEqual(EventMask(rawValue: 0x0000_0000_0000_001F),
                       [.connectionComplete,
                        .advertisingReport,
                        .connectionUpdateComplete,
                        .readRemoteFeaturesComplete,
                        .longTermKeyRequest,
                        .remoteConnectionParameterRequest],
                       "The default is for bits 0 to 4 inclusive (the value 0x0000 0000 0000 001F) to be set.")
    }
    
    func testAdvertisingChannelHeader() {
        
        XCTAssertEqual(AdvertisingChannelHeader().rawValue, 0)
        XCTAssertEqual(AdvertisingChannelHeader(), .undirectedAdvertising)
    }
    
    func testBitMaskOption() {
        
        do {
            
            // set conversion
            let all = BitMaskOptionSet(ATTAttributePermission.allCases)
            
            let expected: Set<ATTAttributePermission> = [.read,
                                                          .write,
                                                          .readEncrypt,
                                                          .writeEncrypt,
                                                          .readAuthentication,
                                                          .writeAuthentication,
                                                          .authorized,
                                                          .noAuthorization]
            
            XCTAssertEqual(expected, Set(ATTAttributePermission.allCases))
            XCTAssert(all.contains(ATTAttributePermission.allCases))
            XCTAssertEqual(all.count, ATTAttributePermission.allCases.count)
            XCTAssertEqual(all.count, 8)
            XCTAssertEqual(Set(all), Set(ATTAttributePermission.allCases))
            XCTAssertEqual(all, BitMaskOptionSet<ATTAttributePermission>.all)
            XCTAssert(all.contains(ATTAttributePermission.encrypt))
            XCTAssert(all.contains(ATTAttributePermission.authentication))
            XCTAssert(BitMaskOptionSet<ATTAttributePermission>().contains(.read) == false)
            XCTAssert(BitMaskOptionSet<ATTAttributePermission>().contains(ATTAttributePermission.allCases) == false)
        }
        
        do {
            
            // Sets are as large as a single element
            XCTAssert(MemoryLayout<BitMaskOptionSet<GATTCharacteristicProperty>>.size == MemoryLayout<GATTCharacteristicProperty>.size)
            
            // create empty set
            var set = BitMaskOptionSet<GATTCharacteristicProperty>()
            XCTAssert(set.count == 0)
            XCTAssert(set.isEmpty)
            XCTAssert(set.rawValue == 0)
            
            // insert value
            set.insert(.read)
            XCTAssert(set.rawValue == GATTCharacteristicProperty.read.rawValue)
            XCTAssert(set.count == 1)
            XCTAssert(set.isEmpty == false)
            
            // cant store duplicates
            set.insert(.read)
            XCTAssert(set.rawValue == GATTCharacteristicProperty.read.rawValue)
            XCTAssert(set.count == 1)
            XCTAssert(set.isEmpty == false)
            
            // can store different values
            set.insert(.write)
            XCTAssert(set.rawValue == (GATTCharacteristicProperty.read.rawValue | GATTCharacteristicProperty.write.rawValue))
            XCTAssert(set.count == 2)
            XCTAssert(set.isEmpty == false)
            
            // comparison with other collections
            XCTAssert(set.contains([.read, .write]))
            XCTAssert(set == [.read, .write])
        }
    }
    
    func testClassOfDevice() {
        
        do {
            let data = Data([0b00001101, 0b00000001, 0b11000010])
            
            guard let classOfDevice = ClassOfDevice(data: data)
                else { XCTFail("Could not decode"); return }
            
            XCTAssertTrue(classOfDevice.majorServiceClass.contains(.networking))
            
            guard case let .computer(computer) = classOfDevice.majorDeviceClass
                else { XCTFail("majorDeviceClass is wrong"); return }
            
            guard computer == .laptop
                else { XCTFail("majorDeviceClass is wrong"); return }
            
            XCTAssertEqual(classOfDevice.data, data)
            XCTAssertEqual(classOfDevice.formatType, ClassOfDevice.FormatType(rawValue: 0b01))
            
            guard let formatType = ClassOfDevice.FormatType(rawValue: 0b01)
                else { XCTFail("Could not init formatType"); return }
            
            let majorServiceClass = BitMaskOptionSet<ClassOfDevice.MajorServiceClass>(rawValue: 0b11000010000)
            let majorDeviceClass = ClassOfDevice.MajorDeviceClass.computer(.laptop)
            let classOfDeviceManual = ClassOfDevice(formatType: formatType,
                                                    majorServiceClass: majorServiceClass,
                                                    majorDeviceClass: majorDeviceClass)
            
            XCTAssertEqual(classOfDevice.formatType, formatType)
            XCTAssertEqual(classOfDevice.majorDeviceClass, majorDeviceClass)
            XCTAssertEqual(classOfDevice, classOfDeviceManual)
        }
        
        do {
            let data = Data([0b00001101, 0b00100010, 0b11000000])

            guard let classOfDevice = ClassOfDevice(data: data)
                else { XCTFail("Could not decode"); return }

            XCTAssertTrue(classOfDevice.majorServiceClass.contains(.limitedDiscoverable))
            XCTAssertTrue(classOfDevice.majorServiceClass.contains(.telephony))
            XCTAssertTrue(classOfDevice.majorServiceClass.contains(.information))
            XCTAssertFalse(classOfDevice.majorServiceClass.contains(.audio))
            XCTAssertFalse(classOfDevice.majorServiceClass.contains(.objectTransfer))

            guard case let .phone(phone) = classOfDevice.majorDeviceClass
                else { XCTFail("majorDeviceClass is wrong"); return }

            guard phone == .smartphone
                else { XCTFail("majorDeviceClass is wrong"); return }

            XCTAssertEqual(classOfDevice.data, data)
            XCTAssertEqual(classOfDevice.formatType, ClassOfDevice.FormatType(rawValue: 0b01))
        }

        do {
            let data = Data([0b01000100, 0b00100101, 0b11100000])

            guard let classOfDevice = ClassOfDevice(data: data)
                else { XCTFail("Could not decode"); return }

            XCTAssertTrue(classOfDevice.majorServiceClass.contains(.audio))

            guard case let .peripheral(peripheral, device) = classOfDevice.majorDeviceClass
                else { XCTFail("majorDeviceClass is wrong"); return }

            XCTAssertEqual(peripheral, .keyboard)
            XCTAssertEqual(device, .joystick)
            XCTAssertEqual(classOfDevice.data, data)
            XCTAssertEqual(classOfDevice.formatType, ClassOfDevice.FormatType(rawValue: 0b00))
        }

        do {
            let data = Data([0b00000100, 0b00000111, 0b11100110])

            guard let classOfDevice = ClassOfDevice(data: data)
                else { XCTFail("Could not decode"); return }

            XCTAssertTrue(classOfDevice.majorServiceClass.contains(.telephony))

            guard case let .wearable(wearable) = classOfDevice.majorDeviceClass
                else { XCTFail("majorDeviceClass is wrong"); return }

            XCTAssertEqual(wearable, .wristwatch)
            XCTAssertEqual(classOfDevice.data, data)
            XCTAssertEqual(classOfDevice.formatType, ClassOfDevice.FormatType(rawValue: 0b00))
        }
    }
}

