//
//  BluetoothTests.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 11/28/17.
//  Copyright © 2017 PureSwift. All rights reserved.
//

import Testing
import Foundation
@testable import Bluetooth
#if canImport(BluetoothHCI)
import BluetoothHCI
#endif
#if canImport(BluetoothGATT)
import BluetoothGATT
#endif

@Suite struct BluetoothTests {

    #if canImport(BluetoothHCI)
    @Test func advertisingInterval() {

        let value = AdvertisingInterval.default

        #expect(AdvertisingInterval(rawValue: 0) == nil)
        #expect(AdvertisingInterval(rawValue: .max) == nil)

        // Equatable, comparable, hashable
        #expect(value < .max)
        #expect(value > .min)
        #expect(value != .max)
        #expect(value != .min)

        // Range: 0x0020 to 0x4000
        #expect(AdvertisingInterval.min.miliseconds == 20, "The `advInterval` shall be an integer multiple of 0.625 ms in the range of `20` ms to `10.24` s")
        #expect(AdvertisingInterval(miliseconds: 20) == .min)
        #expect(AdvertisingInterval.max.miliseconds == 10240, "The `advInterval` shall be an integer multiple of 0.625 ms in the range of `20` ms to `10.24` s")
        #expect(AdvertisingInterval(miliseconds: 10240) == .max)
        #expect(AdvertisingInterval.default.miliseconds == Int(Double(1.28 * 1000)), "Default: N = 0x0800 (1.28 second)")
        #expect(AdvertisingInterval(miliseconds: 1280) == .default)
        #expect("\(AdvertisingInterval.min)" == "20ms")
        #expect("\(AdvertisingInterval.max)" == "10240ms")
        #expect("\(AdvertisingInterval.default)" == "1280ms")
    }
    #endif

    @Test func securityLevel() {

        let level = SecurityLevel()

        #expect(level < .high)
        #expect(SecurityLevel.low < .high)
    }

    @Test func companyIdentifier() {

        let company: CompanyIdentifier = 76  // Apple, Inc.

        #if !os(WASI)
        #expect(company.description == "Apple, Inc.")
        #endif
        #expect(company.hashValue != 0)
        #expect(company != 77)
    }

    #if canImport(BluetoothHCI)
    @Test func channelIdentifier() {

        #expect(ChannelIdentifier.att == 4)
        #expect(ChannelIdentifier.att.description == "4")
    }

    @Test func hciommandTimeout() {

        let timeout: HCICommandTimeout = 1000

        #expect(timeout == .default)
        #expect(timeout.duration == 1.0)
        #expect(timeout.rawValue == 1000)
        #expect(timeout != 2000)
        #expect(timeout.description == "1.0s")
    }

    @Test func hciVersion() {

        #expect(HCIVersion.v4_2.rawValue == 0x8, "HCI Version: 4.2 (0x8)")

        #expect(HCIVersion.v4_0.description == "4.0")
        #expect(HCIVersion.v4_1.description == "4.1")
        #expect(HCIVersion.v4_2.description == "4.2")
        #expect(HCIVersion.v5_0.description == "5.0")

        #expect(HCIVersion.v4_0 == .v4_0)
        #expect(HCIVersion.v4_0 != .v5_0)
        #expect(HCIVersion.v4_0 < .v4_2)
        #expect(HCIVersion.v5_0 > .v4_2)
    }
    #endif

    @Test func lowEnergyAdvertisingData() {

        do {

            // zeroed data
            #expect(Data(LowEnergyAdvertisingData(data: Data())) == Data())
            #expect(Data(LowEnergyAdvertisingData()) == Data())
            #expect(LowEnergyAdvertisingData().hashValue != 0)
        }

        do {

            let advertisingData: LowEnergyAdvertisingData = [0x0B, 0x09, 0x42, 0x6C, 0x75, 0x65, 0x5A, 0x20, 0x35, 0x2E, 0x34, 0x33]
            #expect(Data(advertisingData).count == advertisingData.count)
            #expect(advertisingData == [0x0B, 0x09, 0x42, 0x6C, 0x75, 0x65, 0x5A, 0x20, 0x35, 0x2E, 0x34, 0x33])
            #expect(advertisingData.hashValue != 0)
        }
    }

    #if canImport(BluetoothHCI)
    @Test func lowEnergyAddressType() {

        #expect(LowEnergyAddressType() == .public)
        #expect(LowEnergyAddressType.public.isCompatible(with: .v4_0))
        #expect(LowEnergyAddressType.public.isCompatible(with: .v4_2))
        #expect(LowEnergyAddressType.public.isCompatible(with: .v5_0))
        #expect(LowEnergyAddressType.random.isCompatible(with: .v4_0))
        #expect(LowEnergyAddressType.random.isCompatible(with: .v4_2))
        #expect(LowEnergyAddressType.random.isCompatible(with: .v5_0))
        #expect(LowEnergyAddressType.publicIdentity.isCompatible(with: .v5_0))
        #expect(LowEnergyAddressType.randomIdentity.isCompatible(with: .v5_0))
        #expect(LowEnergyAddressType.publicIdentity.isCompatible(with: .v4_2) == false)
        #expect(LowEnergyAddressType.randomIdentity.isCompatible(with: .v4_2) == false)
    }

    @Test func lowEnergyState() {

        var states = BitMaskOptionSet<LowEnergyState>.all
        #expect(states.isEmpty == false)
        #expect(states.count == LowEnergyState.allCases.count)
        #expect(Array(states) == LowEnergyState.allCases)
        states.forEach { #expect(LowEnergyState.allCases.contains($0)) }

        states.removeAll()
        #expect(states.count == 0)
        #expect(states.isEmpty)

        #expect(LowEnergyStateSet.state0.states == [.nonConnectableAdvertising])
        #expect(LowEnergyStateSet.state1.states == [.scannableAdvertising])

        #expect(LowEnergyState.scannableAdvertising.description == "Scannable Advertising State")
    }

    @Test func lowEnergyAdvertisingFilterPolicy() {

        typealias FilterPolicy = HCILESetAdvertisingParameters.FilterPolicy

        #expect(FilterPolicy() == .any)
        #expect(FilterPolicy(whiteListScan: false, whiteListConnect: true) == .whiteListConnect)
        #expect(FilterPolicy(whiteListScan: true, whiteListConnect: false) == .whiteListScan)
        #expect(FilterPolicy(whiteListScan: true, whiteListConnect: true) == .whiteListScanConnect)
        #expect(FilterPolicy(whiteListScan: false, whiteListConnect: false) == .any)
    }

    @Test func lowEnergyFeature() {

        #expect(LowEnergyFeature.encryption.description == "LE Encryption")
        #expect(LowEnergyFeature.encryption.isValidControllerToController)

        var featureSet: LowEnergyFeatureSet = [.encryption, .connectionParametersRequestProcedure, .ping]
        #expect(featureSet.count == 3)
        #expect(featureSet.isEmpty == false)
        #expect(featureSet.contains(.encryption))
        #expect(featureSet.contains(.connectionParametersRequestProcedure))
        #expect(featureSet.contains(.ping))
        #expect(featureSet.contains(.le2mPhy) == false)

        #expect(featureSet.rawValue != LowEnergyFeature.encryption.rawValue)
        #expect(featureSet.rawValue != LowEnergyFeature.connectionParametersRequestProcedure.rawValue)
        #expect(featureSet.rawValue != LowEnergyFeature.ping.rawValue)
        #expect(LowEnergyFeature(rawValue: featureSet.rawValue) == nil)

        #expect(LowEnergyFeature.RawValue.bitWidth == LowEnergyFeatureSet.RawValue.bitWidth)
        #expect(LowEnergyFeature.RawValue.bitWidth == MemoryLayout<LowEnergyFeature.RawValue>.size * 8)
        #expect(LowEnergyFeature.RawValue.bitWidth == 64)

        #expect(MemoryLayout<LowEnergyFeatureSet>.size == MemoryLayout<LowEnergyFeature.RawValue>.size)
        #expect(MemoryLayout<LowEnergyFeatureSet>.size == 8)  // 64 bit // 64 bit

        featureSet = .all
        #expect(!featureSet.isEmpty)
        #expect(featureSet.count == LowEnergyFeature.allCases.count)
        #expect(Array(featureSet) == LowEnergyFeature.allCases)

        typealias Bit64 = (UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8)
        let bigEndianByteValue: Bit64 = (0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01)
        let littleEndianByteValue: Bit64 = (0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00)
        let rawValue: UInt64 = 0b01

        #expect(rawValue.littleEndian.bytes.0 == littleEndianByteValue.0)
        #expect(rawValue.littleEndian.bytes.1 == littleEndianByteValue.1)
        #expect(rawValue.littleEndian.bytes.2 == littleEndianByteValue.2)
        #expect(rawValue.littleEndian.bytes.3 == littleEndianByteValue.3)
        #expect(rawValue.littleEndian.bytes.4 == littleEndianByteValue.4)
        #expect(rawValue.littleEndian.bytes.5 == littleEndianByteValue.5)
        #expect(rawValue.littleEndian.bytes.6 == littleEndianByteValue.6)
        #expect(rawValue.littleEndian.bytes.7 == littleEndianByteValue.7)
        #expect(UInt64(littleEndian: UInt64(bytes: littleEndianByteValue)) == rawValue)

        #expect(rawValue.bigEndian.bytes.0 == bigEndianByteValue.0)
        #expect(rawValue.bigEndian.bytes.1 == bigEndianByteValue.1)
        #expect(rawValue.bigEndian.bytes.2 == bigEndianByteValue.2)
        #expect(rawValue.bigEndian.bytes.3 == bigEndianByteValue.3)
        #expect(rawValue.bigEndian.bytes.4 == bigEndianByteValue.4)
        #expect(rawValue.bigEndian.bytes.5 == bigEndianByteValue.5)
        #expect(rawValue.bigEndian.bytes.6 == bigEndianByteValue.6)
        #expect(rawValue.bigEndian.bytes.7 == bigEndianByteValue.7)
        #expect(UInt64(bigEndian: UInt64(bytes: bigEndianByteValue)) == rawValue)

        featureSet.forEach { #expect(LowEnergyFeature.allCases.contains($0)) }

        featureSet.removeAll()

        #expect(featureSet.rawValue == 0)
        #expect(featureSet.count == 0)
        #expect(featureSet.hashValue == featureSet.rawValue.hashValue)
    }

    @Test func lowEnergyEventMask() {

        typealias EventMask = HCILESetEventMask.EventMask

        #expect(EventMask().isEmpty)
        #expect(EventMask(rawValue: 0x00).isEmpty)
        #expect(0x0000_0000_0000_001F == 0b11111)

        #expect(
            EventMask(rawValue: 0x0000_0000_0000_001F) == [
                .connectionComplete,
                .advertisingReport,
                .connectionUpdateComplete,
                .readRemoteFeaturesComplete,
                .longTermKeyRequest,
                .remoteConnectionParameterRequest
            ],
            "The default is for bits 0 to 4 inclusive (the value 0x0000 0000 0000 001F) to be set.")
    }

    @Test func advertisingChannelHeader() {

        #expect(AdvertisingChannelHeader().rawValue == 0)
        #expect(AdvertisingChannelHeader() == .undirectedAdvertising)
    }
    #endif

    @Test func classOfDevice() {

        do {
            let data = Data([0b00001101, 0b00000001, 0b11000010])

            guard let classOfDevice = ClassOfDevice(data: data)
            else {
                Issue.record("Could not decode")
                return
            }

            #expect(classOfDevice.majorServiceClass.contains(.networking))

            guard case let .computer(computer) = classOfDevice.majorDeviceClass
            else {
                Issue.record("majorDeviceClass is wrong")
                return
            }

            guard computer == .laptop
            else {
                Issue.record("majorDeviceClass is wrong")
                return
            }

            #expect(Data(classOfDevice) == data)
            #expect(classOfDevice.formatType == ClassOfDevice.FormatType(rawValue: 0b01))

            guard let formatType = ClassOfDevice.FormatType(rawValue: 0b01)
            else {
                Issue.record("Could not init formatType")
                return
            }

            let majorServiceClass = BitMaskOptionSet<ClassOfDevice.MajorServiceClass>(rawValue: 0b110_00010000)
            let majorDeviceClass = ClassOfDevice.MajorDeviceClass.computer(.laptop)
            let classOfDeviceManual = ClassOfDevice(
                formatType: formatType,
                majorServiceClass: majorServiceClass,
                majorDeviceClass: majorDeviceClass)

            #expect(classOfDevice.formatType == formatType)
            #expect(classOfDevice.majorDeviceClass == majorDeviceClass)
            #expect(classOfDevice == classOfDeviceManual)
        }

        do {
            let data = Data([0b00001101, 0b00100010, 0b11000000])

            guard let classOfDevice = ClassOfDevice(data: data)
            else {
                Issue.record("Could not decode")
                return
            }

            #expect(classOfDevice.majorServiceClass.contains(.limitedDiscoverable))
            #expect(classOfDevice.majorServiceClass.contains(.telephony))
            #expect(classOfDevice.majorServiceClass.contains(.information))
            #expect(!classOfDevice.majorServiceClass.contains(.audio))
            #expect(!classOfDevice.majorServiceClass.contains(.objectTransfer))

            guard case let .phone(phone) = classOfDevice.majorDeviceClass
            else {
                Issue.record("majorDeviceClass is wrong")
                return
            }

            guard phone == .smartphone
            else {
                Issue.record("majorDeviceClass is wrong")
                return
            }

            #expect(Data(classOfDevice) == data)
            #expect(classOfDevice.formatType == ClassOfDevice.FormatType(rawValue: 0b01))
        }

        do {
            let data = Data([0b01000100, 0b00100101, 0b11100000])

            guard let classOfDevice = ClassOfDevice(data: data)
            else {
                Issue.record("Could not decode")
                return
            }

            #expect(classOfDevice.majorServiceClass.contains(.audio))

            guard case let .peripheral(peripheral, device) = classOfDevice.majorDeviceClass
            else {
                Issue.record("majorDeviceClass is wrong")
                return
            }

            #expect(peripheral == .keyboard)
            #expect(device == .joystick)
            #expect(Data(classOfDevice) == data)
            #expect(classOfDevice.formatType == ClassOfDevice.FormatType(rawValue: 0b00))
        }

        do {
            let data = Data([0b00000100, 0b00000111, 0b11100110])

            guard let classOfDevice = ClassOfDevice(data: data)
            else {
                Issue.record("Could not decode")
                return
            }

            #expect(classOfDevice.majorServiceClass.contains(.telephony))

            guard case let .wearable(wearable) = classOfDevice.majorDeviceClass
            else {
                Issue.record("majorDeviceClass is wrong")
                return
            }

            #expect(wearable == .wristwatch)
            #expect(Data(classOfDevice) == data)
            #expect(classOfDevice.formatType == ClassOfDevice.FormatType(rawValue: 0b00))
        }
    }
}
