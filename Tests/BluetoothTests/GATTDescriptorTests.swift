//
//  GATTDescriptorTests.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 5/30/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

#if canImport(BluetoothGATT)
import Testing
import Foundation
import Bluetooth
@testable import BluetoothGATT

@Suite struct GATTDescriptorTests {

    @Test func characteristicClientConfigurationDescriptor() {

        #expect(GATTClientCharacteristicConfiguration().rawValue == 0)

        #expect(GATTClientCharacteristicConfiguration(data: Data()) == nil)
        #expect(GATTClientCharacteristicConfiguration(data: Data([0x00])) == nil)
        #expect(GATTClientCharacteristicConfiguration(data: Data([0x00, 0x00, 0x03])) == nil)
        #expect(GATTClientCharacteristicConfiguration(data: Data([0x00, 0x00])) == [])
        #expect(GATTClientCharacteristicConfiguration(data: Data([0x01, 0x00])) == [.notify])
        #expect(GATTClientCharacteristicConfiguration(data: Data([0x02, 0x00])) == [.indicate])
        #expect(GATTClientCharacteristicConfiguration(data: Data([0x03, 0x00])) == [.notify, .indicate])

        var clientConfiguration = GATTClientCharacteristicConfiguration()
        #expect(clientConfiguration == [])

        clientConfiguration.insert(.notify)
        #expect(clientConfiguration.data == Data([0x01, 00]))

        #expect(clientConfiguration.remove(.notify) == .notify)
        #expect(clientConfiguration.data == Data([0x00, 0x00]))
        #expect(clientConfiguration == [])
        #expect(clientConfiguration.rawValue == 0)

    }

    @Test func characteristicExtendedPropertiesDescriptor() {
        #expect(GATTCharacteristicExtendedProperties().rawValue == 0)
        #expect(GATTCharacteristicExtendedProperties(data: Data()) == nil)
        #expect(GATTCharacteristicExtendedProperties(data: Data([0x00])) == nil)
        #expect(GATTCharacteristicExtendedProperties(data: Data([0x03])) == nil)
        #expect(GATTCharacteristicExtendedProperties(data: Data([0x00, 0x00, 0x00])) == nil)
        #expect(GATTCharacteristicExtendedProperties(data: Data([0x00, 0x00, 0x03])) == nil)
        #expect(GATTCharacteristicExtendedProperties(data: Data([0x00, 0x00])) == [])
        #expect(GATTCharacteristicExtendedProperties(data: Data([0x01, 0x00])) == [.reliableWrite])
        #expect(GATTCharacteristicExtendedProperties(data: Data([0x02, 0x00])) == [.writableAuxiliaries])
        #expect(GATTCharacteristicExtendedProperties(data: Data([0x03, 0x00])) == [.reliableWrite, .writableAuxiliaries])

        var extendedProperties = GATTCharacteristicExtendedProperties()
        #expect(extendedProperties == [])

        extendedProperties.insert(.reliableWrite)
        #expect(extendedProperties.data == Data([0x01, 0x00]))

        #expect(extendedProperties.remove(.reliableWrite) == .reliableWrite)
        #expect(extendedProperties.data == Data([0x00, 0x00]))

        #expect(extendedProperties == [])
        #expect(extendedProperties.rawValue == 0)

    }

    @Test func characteristicsServerConfigurationDescriptor() {
        #expect(GATTServerCharacteristicConfiguration().rawValue == 0)
        #expect(GATTServerCharacteristicConfiguration(data: Data()) == nil)
        #expect(GATTServerCharacteristicConfiguration(data: Data([0x00, 0x00])) == nil)
        #expect(GATTServerCharacteristicConfiguration(data: Data([0x00, 0x01])) == nil)
        #expect(GATTServerCharacteristicConfiguration(data: Data([0x00, 0x00, 0x00])) == nil)
        #expect(GATTServerCharacteristicConfiguration(data: Data([0x00, 0x00, 0x01])) == nil)
        #expect(GATTServerCharacteristicConfiguration(data: Data([0x00])) == [])
        #expect(GATTServerCharacteristicConfiguration(data: Data([0x01])) == [.broadcasts])

        var serverConfiguration = GATTServerCharacteristicConfiguration()
        #expect(serverConfiguration == [])

        serverConfiguration.insert(.broadcasts)
        #expect(serverConfiguration.data == Data([0x01]))

        #expect(serverConfiguration.remove(.broadcasts) == .broadcasts)
        #expect(serverConfiguration.data == Data([0x00]))

        #expect(serverConfiguration == [])
        #expect(serverConfiguration.rawValue == 0)

    }

    @Test func characteristicsAggregateFormatDescriptor() {
        #expect(GATTAggregateFormatDescriptor().handles == [])
        #expect(GATTAggregateFormatDescriptor(data: Data([0x00])) == nil)
        #expect(GATTAggregateFormatDescriptor(data: Data([0x00, 0x00, 0x00])) == nil)
        #expect(GATTAggregateFormatDescriptor(data: Data([0x00, 0x00]))!.handles == [0x00])
        #expect(GATTAggregateFormatDescriptor(data: Data([0x20, 0x00]))!.handles == [0x20])
        #expect(GATTAggregateFormatDescriptor(data: Data([0x20, 0x00, 0x30, 0x00]))!.handles == [0x20, 0x30])
        #expect(GATTAggregateFormatDescriptor(data: Data([0x40, 0x00, 0x50, 0x00, 0x60, 0x00]))!.handles == [0x40, 0x50, 0x60])

        var aggregateFormat = GATTAggregateFormatDescriptor()
        #expect(aggregateFormat.handles == [])

        aggregateFormat.handles.append(UInt16(0x40))
        #expect(aggregateFormat.data == Data([0x40, 0x00]))
        aggregateFormat.handles.append(UInt16(bitPattern: 0x50))
        #expect(aggregateFormat.data == Data([0x40, 0x00, 0x50, 0x00]))
        aggregateFormat.handles.append(UInt16(bitPattern: 0x60))
        #expect(aggregateFormat.data == Data([0x40, 0x00, 0x50, 0x00, 0x60, 0x00]))
        aggregateFormat.handles.removeLast()
        #expect(aggregateFormat.data == Data([0x40, 0x00, 0x50, 0x00]))
        aggregateFormat.handles.removeLast()
        #expect(aggregateFormat.data == Data([0x40, 0x00]))
        aggregateFormat.handles.removeLast()
        #expect(aggregateFormat.handles == [])
    }

    @Test func characteristicsFormatDescriptor() {

        let value = Data([0x17, 0x00, 0xAC, 0x27, 0x01, 0x00, 0x00])
        #expect(value.count == 0x07)

        #expect(GATTFormatDescriptor(data: Data([0x00])) == nil)
        #expect(GATTFormatDescriptor(data: Data([0x00, 0x00, 0x00])) == nil)
        #expect(GATTFormatDescriptor(data: Data([0x00, 0x00, 0x00, 0x00, 0x00])) == nil)
        #expect(GATTFormatDescriptor(data: Data([0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00])) == nil)
        #expect(GATTFormatDescriptor(data: Data([0x1C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00])) == nil)
        #expect(GATTFormatDescriptor(data: Data([0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00])) == nil)

        #expect(GATTFormatDescriptor(data: Data([0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]))?.format == .rfu)

        #expect(GATTFormatDescriptor(data: Data([0x17, 0x00, 0xAC, 0x27, 0x01, 0x00, 0x00]))?.format == .float)
        #expect(GATTFormatDescriptor(data: Data([0x17, 0x00, 0xAC, 0x27, 0x01, 0x00, 0x00]))?.exponent == 0x00)
        #expect(GATTFormatDescriptor(data: Data([0x17, 0x00, 0xAC, 0x27, 0x01, 0x00, 0x00]))?.unit == 0x27AC)
        #expect(GATTFormatDescriptor(data: Data([0x17, 0x00, 0xAC, 0x27, 0x01, 0x00, 0x00]))?.namespace == 0x01)
        #expect(GATTFormatDescriptor(data: Data([0x17, 0x00, 0xAC, 0x27, 0x01, 0x00, 0x00]))?.description == 0x0000)

        let formatDescriptor = GATTFormatDescriptor(data: value)
        #expect(formatDescriptor?.format.rawValue == 0x17)

    }

    @Test func characteristicsUserDescriptionDescriptor() {

        var userDescription = GATTUserDescription(rawValue: "")
        #expect(userDescription.data == Data())

        userDescription = "Test"
        #expect(userDescription.data == Data([0x54, 0x65, 0x73, 0x74]))
    }

    @Test func characteristicReportReferenceDescriptor() {

        #expect(GATTReportReference(data: Data()) == nil)
        #expect(GATTReportReference(data: Data([0x00])) == nil)
        #expect(GATTReportReference(data: Data([0x00, 0x00])) == nil)
        #expect(GATTReportReference(data: Data([0x00, 0x04])) == nil)
        #expect(GATTReportReference(data: Data([0xFF, 0xFF])) == nil)
        #expect(GATTReportReference(data: Data([0x00, 0x00, 0x00])) == nil)

        do {

            guard let reportReference = GATTReportReference(data: Data([0x00, 0x01]))
            else {
                Issue.record()
                return
            }

            #expect(reportReference.identifier == 0x00)
            #expect(reportReference.type == .input)
        }

        do {

            guard let reportReference = GATTReportReference(data: Data([0xAA, 0x02]))
            else {
                Issue.record()
                return
            }

            #expect(reportReference.identifier == 0xAA)
            #expect(reportReference.type == .output)
        }

        do {

            guard let reportReference = GATTReportReference(data: Data([0xBB, 0x03]))
            else {
                Issue.record()
                return
            }

            #expect(reportReference.identifier == 0xBB)
            #expect(reportReference.type == .feature)
        }
    }

    @Test func timeTriggerSettingDescriptor() {

        #expect(GATTTimeTriggerSetting(data: Data()) == nil)
        #expect(GATTTimeTriggerSetting(data: Data([0x00])) == nil)
        #expect(GATTTimeTriggerSetting(data: Data([0x03, 0x00])) == nil)
        #expect(GATTTimeTriggerSetting(data: Data([0x04, 0x00])) == nil)
        #expect(GATTTimeTriggerSetting(data: Data([0x02, 0x00])) == nil)

        let valueNone = Data([0x00, 0x10])
        let valueTimeInterval = Data([0x01, 0x00, 0x00, 0x00])
        let valueTimeIntervalIndicate = Data([0x02, 0x00, 0x00, 0x00])
        let valueCount = Data([0x03, 0x00, 0x00])
        var timeTriggerSetting = GATTTimeTriggerSetting(data: valueNone)
        #expect(timeTriggerSetting?.data.count == valueNone.count)

        timeTriggerSetting = GATTTimeTriggerSetting(data: valueTimeIntervalIndicate)
        #expect(timeTriggerSetting?.data.count == valueTimeIntervalIndicate.count)

        timeTriggerSetting = GATTTimeTriggerSetting(data: valueTimeInterval)
        #expect(timeTriggerSetting?.data.count == valueTimeInterval.count)

        timeTriggerSetting = GATTTimeTriggerSetting(data: valueCount)
        #expect(timeTriggerSetting?.data.count == valueCount.count)
    }

    @Test func externalReportReferenceDescriptor() {

        #expect(GATTExternalReportReference(data: Data()) == nil)
        #expect(GATTExternalReportReference(data: Data([0x00])) == nil)

        let aerobicHeartRateLowerLimit = Data(BluetoothUUID.Characteristic.aerobicHeartRateLowerLimit)
        var externalReportReference = GATTExternalReportReference(data: aerobicHeartRateLowerLimit)
        #expect(externalReportReference?.data == aerobicHeartRateLowerLimit)

        let batteryLevel = Data(BluetoothUUID.Characteristic.batteryLevel)
        externalReportReference = GATTExternalReportReference(data: Data([0x19, 0x2A]))
        #expect(externalReportReference?.data == batteryLevel)

        externalReportReference = GATTExternalReportReference(uuid: BluetoothUUID.Service.battery)
        #expect(externalReportReference?.data == Data(BluetoothUUID.Service.battery.littleEndian))
    }

    @Test func numberOfDigitalsDescritor() {

        #expect(GATTNumberOfDigitals(data: Data()) == nil)
        #expect(GATTNumberOfDigitals(data: Data([0x00, 0x00])) == nil)

        let numbersOfDigitals = GATTNumberOfDigitals(data: Data([0x00]))
        #expect(numbersOfDigitals?.data == Data([0x00]))
    }
}

internal extension GATTDescriptor {

    var data: Data {
        Data(self)
    }
}

#endif
