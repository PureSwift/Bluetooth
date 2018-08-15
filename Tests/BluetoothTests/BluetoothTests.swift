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

final class BluetoothTests: XCTestCase {
    
    static let allTests = [
        ("testAdvertisingInterval", testAdvertisingInterval),
        ("testSecurityLevel", testSecurityLevel),
        ("testCompanyIdentifier", testCompanyIdentifier),
        ("testHCICommandTimeout", testHCICommandTimeout),
        ("testPOSIXError", testPOSIXError),
        ("testHCIVersion", testHCIVersion),
        ("testLowEnergyAdvertisingData", testLowEnergyAdvertisingData),
        ("testLowEnergyAddressType", testLowEnergyAddressType),
        ("testLowEnergyAdvertisingFilterPolicy", testLowEnergyAdvertisingFilterPolicy),
        ("testLowEnergyFeature", testLowEnergyFeature),
        ("testLowEnergyEventMask", testLowEnergyEventMask),
        ("testAdvertisingChannelHeader", testAdvertisingChannelHeader),
        ("testBitMaskOption", testBitMaskOption)
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
        XCTAssertEqual(value.hashValue, Int(value.rawValue))
        
        // Range: 0x0020 to 0x4000
        XCTAssertEqual(AdvertisingInterval.min.miliseconds, 20.0, "The `advInterval` shall be an integer multiple of 0.625 ms in the range of `20` ms to `10.24` s")
        XCTAssertEqual(AdvertisingInterval.max.miliseconds, 10.24 * 1000, "The `advInterval` shall be an integer multiple of 0.625 ms in the range of `20` ms to `10.24` s")
        XCTAssertEqual(AdvertisingInterval.default.miliseconds, 1.28 * 1000, "Default: N = 0x0800 (1.28 second)")
    }
    
    func testSecurityLevel() {
        
        let level = SecurityLevel()
        
        XCTAssertTrue(level < .high)
        XCTAssertTrue(.low < .high)
    }
    
    func testCompanyIdentifier() {
        
        let company: CompanyIdentifier = 76 // Apple, Inc.
        
        XCTAssertEqual(company.description, "Apple, Inc.")
        XCTAssertEqual(company.hashValue, 76)
        XCTAssertNotEqual(company.hashValue, 0)
        XCTAssertNotEqual(company, 77)
    }
    
    func testHCICommandTimeout() {
        
        let timeout: HCICommandTimeout = 1000
        
        XCTAssertEqual(timeout, .default)
        XCTAssertEqual(timeout.duration, 1.0)
        XCTAssertEqual(timeout.rawValue, 1000)
        XCTAssertNotEqual(timeout, 2000)
        XCTAssertEqual(timeout.hashValue, timeout.rawValue.hashValue)
        XCTAssertEqual(timeout.description, "1.0 seconds")
    }
    
    func testPOSIXError() {
        
        XCTAssertEqual(POSIXError.fromErrno?.code.rawValue ?? 0, errno)
        
        #if os(macOS)
        XCTAssertEqual("\(POSIXError(code: .EBUSY))", "Resource busy")
        #elseif os(Linux)
        XCTAssertEqual("\(POSIXError(code: .EBUSY))", "Device or resource busy")
        #endif
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
        }
        
        do {
            
            let advertisingData: LowEnergyAdvertisingData = [0x0B, 0x09, 0x42, 0x6C, 0x75, 0x65, 0x5A, 0x20, 0x35, 0x2E, 0x34, 0x33]
            XCTAssertEqual(advertisingData.data.count, advertisingData.count)
            XCTAssertEqual(advertisingData, [0x0B, 0x09, 0x42, 0x6C, 0x75, 0x65, 0x5A, 0x20, 0x35, 0x2E, 0x34, 0x33])
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
        XCTAssertEqual(states.count, LowEnergyState.all.count)
        XCTAssert(states.containsAll)
        states.forEach { XCTAssert(LowEnergyState.all.contains($0)) }
        
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
        
        #if swift(>=3.2)
        XCTAssert(LowEnergyFeature.RawValue.bitWidth == LowEnergyFeatureSet.RawValue.bitWidth)
        XCTAssert(LowEnergyFeature.RawValue.bitWidth == MemoryLayout<LowEnergyFeature.RawValue>.size * 8)
        XCTAssert(LowEnergyFeature.RawValue.bitWidth == 64)
        #endif
        
        XCTAssert(MemoryLayout<LowEnergyFeatureSet>.size == MemoryLayout<LowEnergyFeature.RawValue>.size)
        XCTAssert(MemoryLayout<LowEnergyFeatureSet>.size == 8) // 64 bit
        
        featureSet = .all
        XCTAssert(featureSet.isEmpty == false)
        XCTAssert(featureSet.count == LowEnergyFeature.all.count)
        XCTAssert(featureSet.containsAll)
        
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
        
        featureSet.forEach { XCTAssert(LowEnergyFeature.all.contains($0)) }
        
        featureSet.removeAll()
        
        XCTAssertEqual(featureSet.rawValue, 0)
        XCTAssertEqual(featureSet.count, 0)
        XCTAssertEqual(featureSet.hashValue, 0)
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
            let all = BitMaskOptionSet(ATT.AttributePermission.all)
            
            XCTAssert(all.contains(ATT.AttributePermission.all))
            XCTAssert(all.count == ATT.AttributePermission.all.count)
            XCTAssert(all.count == 8)
            XCTAssert(Set(all) == ATT.AttributePermission.all)
            XCTAssert(all == BitMaskOptionSet<ATT.AttributePermission>.all)
            XCTAssert(all.contains(ATT.AttributePermission.encrypt))
            XCTAssert(all.contains(ATT.AttributePermission.authentication))
            XCTAssert(BitMaskOptionSet<ATT.AttributePermission>().contains(.read) == false)
            XCTAssert(BitMaskOptionSet<ATT.AttributePermission>().contains(ATT.AttributePermission.all) == false)
        }
        
        do {
            
            // Sets are as large as a single element
            XCTAssert(MemoryLayout<BitMaskOptionSet<GATT.CharacteristicProperty>>.size == MemoryLayout<GATT.CharacteristicProperty>.size)
            
            // create empty set
            var set = BitMaskOptionSet<GATT.CharacteristicProperty>()
            XCTAssert(set.count == 0)
            XCTAssert(set.isEmpty)
            XCTAssert(set.rawValue == 0)
            
            // insert value
            set.insert(.read)
            XCTAssert(set.rawValue == GATT.CharacteristicProperty.read.rawValue)
            XCTAssert(set.count == 1)
            XCTAssert(set.isEmpty == false)
            
            // cant store duplicates
            set.insert(.read)
            XCTAssert(set.rawValue == GATT.CharacteristicProperty.read.rawValue)
            XCTAssert(set.count == 1)
            XCTAssert(set.isEmpty == false)
            
            // can store different values
            set.insert(.write)
            XCTAssert(set.rawValue == (GATT.CharacteristicProperty.read.rawValue | GATT.CharacteristicProperty.write.rawValue))
            XCTAssert(set.count == 2)
            XCTAssert(set.isEmpty == false)
            
            // comparison with other collections
            XCTAssert(set.contains([.read, .write]))
            XCTAssert(set == [.read, .write])
        }
    }
}
