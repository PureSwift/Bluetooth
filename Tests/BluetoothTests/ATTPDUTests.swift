//
//  ATTPDUTests.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 7/17/26.
//

#if canImport(BluetoothGATT)
import Testing
#if canImport(FoundationEssentials)
import FoundationEssentials
#else
import Foundation
#endif
@testable import Bluetooth
@testable import BluetoothGATT

@Suite struct ATTPDUTests {

    @Test func executeWriteResponse() {

        let data = Data([0x19])

        guard let pdu = ATTExecuteWriteResponse(data: data)
        else {
            Issue.record("Could not parse")
            return
        }

        #expect(type(of: pdu).attributeOpcode == .executeWriteResponse)
        #expect(type(of: pdu).attributeOpcode.rawValue == 0x19)
        #expect(pdu.data == data)
        #expect(pdu.dataLength == data.count)
        #expect(ATTExecuteWriteResponse().data == data)

        // invalid data
        #expect(ATTExecuteWriteResponse(data: Data()) == nil, "Empty data")
        #expect(ATTExecuteWriteResponse(data: Data([0x18])) == nil, "Invalid opcode")
        #expect(ATTExecuteWriteResponse(data: Data([0x19, 0x00])) == nil, "Invalid length")
    }

    @Test func prepareWriteResponse() {

        do {

            /**
             Prepare Write Response
             Opcode: 0x17
             Attribute Handle: 0x000A
             Value Offset: 0x0000
             Part Attribute Value: 0x0102
             */

            let data = Data([0x17, 0x0A, 0x00, 0x00, 0x00, 0x01, 0x02])

            guard let pdu = ATTPrepareWriteResponse<Data>(data: data)
            else {
                Issue.record("Could not parse")
                return
            }

            #expect(type(of: pdu).attributeOpcode == .preparedWriteResponse)
            #expect(type(of: pdu).attributeOpcode.rawValue == 0x17)
            #expect(pdu.handle == 0x000A)
            #expect(pdu.offset == 0x0000)
            #expect(pdu.partValue == Data([0x01, 0x02]))
            #expect(pdu.data == data)
            #expect(pdu.dataLength == data.count)
            #expect(ATTPrepareWriteResponse<Data>(data: data) == pdu)
            #expect(ATTPrepareWriteResponse(handle: 0x000A, offset: 0x0000, partValue: Data([0x01, 0x02])) == pdu)
        }

        do {

            // empty part value
            let data = Data([0x17, 0x34, 0x12, 0x02, 0x00])

            guard let pdu = ATTPrepareWriteResponse<Data>(data: data)
            else {
                Issue.record("Could not parse")
                return
            }

            #expect(pdu.handle == 0x1234)
            #expect(pdu.offset == 0x0002)
            #expect(pdu.partValue.isEmpty)
            #expect(pdu.data == data)
            #expect(pdu.dataLength == data.count)
        }

        // invalid data
        #expect(ATTPrepareWriteResponse<Data>(data: Data()) == nil, "Empty data")
        #expect(ATTPrepareWriteResponse<Data>(data: Data([0x17, 0x0A, 0x00, 0x00])) == nil, "Truncated")
        #expect(ATTPrepareWriteResponse<Data>(data: Data([0x16, 0x0A, 0x00, 0x00, 0x00])) == nil, "Invalid opcode")
    }

    @Test func readBlobResponse() {

        do {

            /**
             Read Blob Response
             Opcode: 0x0D
             Part Attribute Value: 0x68 0x65 0x6C 0x6C 0x6F
             */

            let data = Data([0x0D, 0x68, 0x65, 0x6C, 0x6C, 0x6F])

            guard let pdu = ATTReadBlobResponse<Data>(data: data)
            else {
                Issue.record("Could not parse")
                return
            }

            #expect(type(of: pdu).attributeOpcode == .readBlobResponse)
            #expect(type(of: pdu).attributeOpcode.rawValue == 0x0D)
            #expect(pdu.partAttributeValue == Data([0x68, 0x65, 0x6C, 0x6C, 0x6F]))
            #expect(pdu.data == data)
            #expect(pdu.dataLength == data.count)
            #expect(ATTReadBlobResponse<Data>(data: data) == pdu)
            #expect(ATTReadBlobResponse(partAttributeValue: Data([0x68, 0x65, 0x6C, 0x6C, 0x6F])) == pdu)
        }

        do {

            // empty part attribute value
            let data = Data([0x0D])

            guard let pdu = ATTReadBlobResponse<Data>(data: data)
            else {
                Issue.record("Could not parse")
                return
            }

            #expect(pdu.partAttributeValue.isEmpty)
            #expect(pdu.data == data)
            #expect(pdu.dataLength == data.count)
        }

        // invalid data
        #expect(ATTReadBlobResponse<Data>(data: Data()) == nil, "Empty data")
        #expect(ATTReadBlobResponse<Data>(data: Data([0x0B, 0x64])) == nil, "Invalid opcode")
    }

    @Test func signedWriteCommand() {

        typealias Signature = ATTSignedWriteCommand<Data>.Signature

        do {

            /**
             Signed Write Command
             Opcode: 0xD2
             Attribute Handle: 0x0010
             Attribute Value: 0x01
             Authentication Signature: 0x00 ... 0x0B
             */

            let data = Data([0xD2, 0x10, 0x00, 0x01, 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B])

            guard let pdu = ATTSignedWriteCommand<Data>(data: data)
            else {
                Issue.record("Could not parse")
                return
            }

            #expect(type(of: pdu).attributeOpcode == .signedWriteCommand)
            #expect(type(of: pdu).attributeOpcode.rawValue == 0xD2)
            #expect(pdu.handle == 0x0010)
            #expect(pdu.value == Data([0x01]))
            #expect(pdu.signature.0 == 0x00)
            #expect(pdu.signature.5 == 0x05)
            #expect(pdu.signature.11 == 0x0B)
            #expect(pdu.data == data)
            #expect(pdu.dataLength == data.count)

            let signature: Signature = (0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B)
            let command = ATTSignedWriteCommand(handle: 0x0010, value: Data([0x01]), signature: signature)
            #expect(command.data == data)
            #expect(command.dataLength == data.count)
        }

        do {

            // empty attribute value (minimum length)
            let data = Data([0xD2, 0x01, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF])

            guard let pdu = ATTSignedWriteCommand<Data>(data: data)
            else {
                Issue.record("Could not parse")
                return
            }

            #expect(pdu.handle == 0x0001)
            #expect(pdu.value.isEmpty)
            #expect(pdu.signature.0 == 0xFF)
            #expect(pdu.signature.11 == 0xFF)
            #expect(pdu.data == data)
            #expect(pdu.dataLength == data.count)
        }

        // invalid data
        #expect(ATTSignedWriteCommand<Data>(data: Data()) == nil, "Empty data")
        #expect(ATTSignedWriteCommand<Data>(data: Data([0xD2, 0x01, 0x00])) == nil, "Truncated")
        #expect(ATTSignedWriteCommand<Data>(data: Data(repeating: 0x00, count: 15)) == nil, "Invalid opcode")
    }

    @Test func services() {

        #expect(GATTAlertNotificationService.uuid == BluetoothUUID.Service.alertNotification)
        #expect(GATTBatteryService.uuid == BluetoothUUID.Service.battery)
        #expect(GATTBloodPressureService.uuid == BluetoothUUID.Service.bloodPressure)
    }

    @Test func bloodPressureFeature() {

        let data = Data([0x03, 0x00])

        guard let characteristic = GATTBloodPressureFeature(data: data)
        else {
            Issue.record("Could not decode from bytes")
            return
        }

        roundTrip(characteristic, encodes: data)
        #expect(GATTBloodPressureFeature.uuid == BluetoothUUID.Characteristic.bloodPressureFeature)
        #expect(characteristic.features.contains(.bodyMovement))
        #expect(characteristic.features.contains(.cuttFit))
        #expect(characteristic.features.contains(.irregularPulse) == false)
        #expect(characteristic.features.contains(.pulseRateRage) == false)
        #expect(characteristic.features.contains(.measurementPosition) == false)
        #expect(characteristic.features.contains(.multipleBond) == false)

        // all features
        let allFeatures = BitMaskOptionSet<GATTBloodPressureFeature.Feature>(GATTBloodPressureFeature.Feature.allCases)
        let allFeaturesCharacteristic = GATTBloodPressureFeature(features: allFeatures)
        roundTrip(allFeaturesCharacteristic, encodes: Data([0x3F, 0x00]))
        #expect(GATTBloodPressureFeature.Feature.allCases.count == 6)
        #expect(GATTBloodPressureFeature.Feature.bodyMovement.rawValue == 0b01)
        #expect(GATTBloodPressureFeature.Feature.cuttFit.rawValue == 0b10)
        #expect(GATTBloodPressureFeature.Feature.irregularPulse.rawValue == 0b100)
        #expect(GATTBloodPressureFeature.Feature.pulseRateRage.rawValue == 0b1000)
        #expect(GATTBloodPressureFeature.Feature.measurementPosition.rawValue == 0b10000)
        #expect(GATTBloodPressureFeature.Feature.multipleBond.rawValue == 0b100000)

        // invalid data
        #expect(GATTBloodPressureFeature(data: Data()) == nil, "Empty data")
        #expect(GATTBloodPressureFeature(data: Data([0x00])) == nil, "Invalid length")
    }

    @Test func characteristicFormatType() {

        #expect(GATTCharacteristicFormatType.rfu.rawValue == 0x00)
        #expect(GATTCharacteristicFormatType.boolean.rawValue == 0x01)
        #expect(GATTCharacteristicFormatType.bit2.rawValue == 0x02)
        #expect(GATTCharacteristicFormatType.nibble.rawValue == 0x03)
        #expect(GATTCharacteristicFormatType.uint8.rawValue == 0x04)
        #expect(GATTCharacteristicFormatType.uint128.rawValue == 0x0B)
        #expect(GATTCharacteristicFormatType.sint8.rawValue == 0x0C)
        #expect(GATTCharacteristicFormatType.sfloat.rawValue == 0x16)
        #expect(GATTCharacteristicFormatType.float.rawValue == 0x17)
        #expect(GATTCharacteristicFormatType.duint16.rawValue == 0x18)
        #expect(GATTCharacteristicFormatType.utf8s.rawValue == 0x19)
        #expect(GATTCharacteristicFormatType.utf16s.rawValue == 0x1A)
        #expect(GATTCharacteristicFormatType.struct.rawValue == 0x1B)

        #expect(GATTCharacteristicFormatType(rawValue: 0x1C) == nil, "Invalid raw value")

        #expect(GATTCharacteristicFormatType.uint8.name == "uint8")
        #expect(GATTCharacteristicFormatType.sfloat.name == "SFLOAT")
        #expect(GATTCharacteristicFormatType.float.name == "FLOAT")
        #expect(GATTCharacteristicFormatType.struct.name == "struct")
        #expect(GATTCharacteristicFormatType.boolean.description == "unsigned 1-bit; 0=false, 1=true")
        #expect(GATTCharacteristicFormatType.utf8s.description == "UTF-8 string")

        // all defined format types have a name and description
        let formatTypes = (0x00...0x1B).compactMap { GATTCharacteristicFormatType(rawValue: $0) }
        #expect(formatTypes.count == 0x1C)

        for formatType in formatTypes {
            #expect(formatType.name?.isEmpty == false)
            #expect(formatType.description.isEmpty == false)
        }
    }
}
#endif
