//
//  AttributeProtocolTests.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 12/3/17.
//
//

#if canImport(BluetoothGATT)
import Testing
import Foundation
@testable import Bluetooth
@testable import BluetoothGATT

@Suite struct AttributeProtocolTests {

    @Test func opcode() {

        #expect(ATTOpcode.maximumTransmissionUnitRequest.request == nil)
        #expect(ATTOpcode.maximumTransmissionUnitRequest.response == .maximumTransmissionUnitResponse)
        #expect(ATTOpcode.maximumTransmissionUnitRequest.type == .request)

        #expect(ATTOpcode.maximumTransmissionUnitResponse.response == nil)
        #expect(ATTOpcode.maximumTransmissionUnitResponse.request == .maximumTransmissionUnitRequest)
        #expect(ATTOpcode.maximumTransmissionUnitResponse.type == .response)
    }

    @Test func error() {

        #expect(ATTError.invalidHandle.name == "Invalid Handle")
        #expect(ATTError.invalidHandle.errorDescription == "The attribute handle given was not valid on this server.")
        #expect(ATTError.invalidHandle.description == ATTError.invalidHandle.name)

        let errors = (1 ... .max).compactMap { ATTError(rawValue: $0) }
        #expect(errors.count == 0x11)

        for error in errors {

            #expect(error.name.isEmpty == false)
            #expect(error.errorDescription.isEmpty == false)
            #expect(error.description.isEmpty == false)
            #expect(error.description == error.name)

            #if os(macOS)
            let nsError = error as NSError
            #expect(nsError.code == Int(error.rawValue))
            #expect(nsError.domain == "org.pureswift.Bluetooth.ATTError")
            #expect(nsError.userInfo[NSLocalizedDescriptionKey] as? String == error.description)
            #expect(nsError.userInfo[NSLocalizedDescriptionKey] as? String == error.name)
            #expect(nsError.userInfo[NSLocalizedFailureReasonErrorKey] as? String == error.errorDescription)

            print(nsError)
            #endif
        }
    }

    @Test func errorResponse() {

        do {

            let data = Data([1, 16, 1, 0, 10])

            guard let errorResponse = ATTErrorResponse(data: data)
            else {
                Issue.record("Could not parse")
                return
            }

            #expect(errorResponse.data == data)
            #expect(errorResponse.dataLength == data.count)
            #expect(errorResponse.request == .readByGroupTypeRequest)
            #expect(errorResponse.attributeHandle == 0x0001)
            #expect(errorResponse.error == .attributeNotFound)
            #expect(errorResponse.data == data)
        }

        do {

            let data = Data([1, 8, 0, 0, 6])

            guard let errorResponse = ATTErrorResponse(data: data)
            else {
                Issue.record("Could not parse")
                return
            }

            #expect(errorResponse.data == data)
            #expect(errorResponse.dataLength == data.count)
            #expect(errorResponse.request == .readByTypeRequest)
            #expect(errorResponse.attributeHandle == 0x0000)
            #expect(errorResponse.error == .requestNotSupported)
        }

        do {

            let data = Data([1, 16, 49, 0, 10])

            guard let errorResponse = ATTErrorResponse(data: data)
            else {
                Issue.record("Could not parse")
                return
            }

            #expect(errorResponse.data == data)
            #expect(errorResponse.dataLength == data.count)
            #expect(errorResponse.request == .readByGroupTypeRequest)
            #expect(errorResponse.attributeHandle == 49)
            #expect(errorResponse.error == .attributeNotFound)
        }
    }

    @Test func mtu() {

        do {

            #expect(ATTMaximumTransmissionUnit.default == .min, "Default MTU is the minimum MTU")
            #expect(ATTMaximumTransmissionUnit.min != .max, "ATT MTU minimum value is less than maximum value")
            #expect(ATTMaximumTransmissionUnit.min < .max, "ATT MTU maximum value is greater than minimum value")
            #expect(ATTMaximumTransmissionUnit.max > .min, "ATT MTU maximum value is not equal to minimum value")

            #expect(ATTMaximumTransmissionUnit(rawValue: 23) != nil, "Valid MTU value")
            #expect(ATTMaximumTransmissionUnit(rawValue: 517) != nil, "Valid MTU value")
            #expect(ATTMaximumTransmissionUnit(rawValue: ATTMaximumTransmissionUnit.min.rawValue) != nil, "Valid MTU value")
            #expect(ATTMaximumTransmissionUnit(rawValue: ATTMaximumTransmissionUnit.max.rawValue) != nil, "Valid MTU value")
            #expect(ATTMaximumTransmissionUnit(rawValue: ATTMaximumTransmissionUnit.default.rawValue) != nil, "Valid MTU value")

            #expect(ATTMaximumTransmissionUnit(rawValue: 20) == nil, "Invalid MTU value")

            #expect(ATTMaximumTransmissionUnit(rawValue: ATTMaximumTransmissionUnit.min.rawValue - 1) == nil, "Invalid MTU value")
            #expect(ATTMaximumTransmissionUnit(rawValue: ATTMaximumTransmissionUnit.max.rawValue + 1) == nil, "Invalid MTU value")

            #expect(ATTMaximumTransmissionUnit(server: 23, client: 512).rawValue == 23, "The server and client shall set ATT_MTU to the minimum of the Client Rx MTU and the Server Rx MTU.")
            #expect(ATTMaximumTransmissionUnit(server: 512, client: 23).rawValue == 23, "The server and client shall set ATT_MTU to the minimum of the Client Rx MTU and the Server Rx MTU.")
            #expect(ATTMaximumTransmissionUnit(server: 512, client: 256).rawValue == 256, "The server and client shall set ATT_MTU to the minimum of the Client Rx MTU and the Server Rx MTU.")
            #expect(ATTMaximumTransmissionUnit(server: 20, client: 23) == .default, "If either Client Rx MTU or Service Rx MTU are incorrectly less than the default ATT_MTU, then the ATT_MTU shall not be changed and the ATT_MTU shall be the default ATT_MTU.")
            #expect(ATTMaximumTransmissionUnit(server: .max, client: .max) == .max, "Cannot be larger than max ATT_MTU")
        }

        do {

            let data = Data([2, 23, 0])

            guard let pdu = ATTMaximumTransmissionUnitRequest(data: data)
            else {
                Issue.record("Could not parse")
                return
            }

            #expect(pdu.clientMTU == 23)
            #expect(pdu.data == data)
            #expect(pdu.dataLength == data.count)
        }

        do {

            let data = Data([3, 23, 0])

            guard let pdu = ATTMaximumTransmissionUnitResponse(data: data)
            else {
                Issue.record("Could not parse")
                return
            }

            #expect(pdu.serverMTU == 23)
            #expect(pdu.data == data)
            #expect(pdu.dataLength == data.count)
        }
    }

    @Test func readByGroupTypeRequest() {

        do {

            let data = Data([0x10, 0x01, 0x00, 0xFF, 0xFF, 0x00, 0x28])

            guard let pdu = ATTReadByGroupTypeRequest(data: data)
            else {
                Issue.record("Could not parse")
                return
            }

            #expect(pdu.startHandle == 0x0001)
            #expect(pdu.endHandle == 0xFFFF)
            #expect(pdu.type == .bit16(0x2800))
            #expect(pdu.data == data)
            #expect(pdu.dataLength == data.count)

            // correct values
            #expect(pdu.type == BluetoothUUID.Declaration.primaryService)
            #expect(pdu.type == .bit16(0x2800))
        }

        do {

            // bad response / malformed data
            let data = Data([16, 1, 0, 255, 255, 40, 0])

            guard let pdu = ATTReadByGroupTypeRequest(data: data)
            else {
                Issue.record("Could not parse")
                return
            }

            #expect(pdu.startHandle == 0x0001)
            #expect(pdu.endHandle == 0xFFFF)
            #expect(pdu.type == .bit16(0x0028))
            #expect(pdu.data == data)
            #expect(pdu.dataLength == data.count)
        }

        do {

            // discover all primary services
            let pdu = ATTReadByGroupTypeRequest(
                startHandle: 0x0001,
                endHandle: 0xFFFF,
                type: GATTUUID.primaryService.uuid)

            #expect(pdu.type == GATTUUID.primaryService.uuid, "\(pdu.type)")
            #expect(pdu.type == .bit16(0x2800))
            #expect(pdu.type != .bit16(0x0028))

            let data: Data = pdu.data

            #expect(data != Data([16, 1, 0, 255, 255, 40, 0]), "Produced malformed data")
            #expect(data == Data([16, 1, 0, 255, 255, 0, 40]))

            guard let decoded = ATTReadByGroupTypeRequest(data: pdu.data)
            else {
                Issue.record("Could not parse")
                return
            }

            #expect(decoded.startHandle == pdu.startHandle)
            #expect(decoded.endHandle == pdu.endHandle)
            #expect(decoded.type == pdu.type)
            #expect(Data(decoded.type) == Data(pdu.type))
            #expect(decoded.type.littleEndian == pdu.type.littleEndian)
            #expect(decoded.type == GATTUUID.primaryService.uuid, "\(decoded.type)")
            #expect(decoded.type == .bit16(0x2800))
            #expect(decoded.type != .bit16(0x0028))
            #expect(decoded.data == pdu.data)
            #expect(decoded.dataLength == data.count)
        }
    }

    @Test func readByGroupTypeResponse() {

        do {

            let data = Data([17, 6, 1, 0, 5, 0, 0, 24, 6, 0, 9, 0, 1, 24, 16, 0, 20, 0, 10, 24])

            guard let pdu = ATTReadByGroupTypeResponse<Data>(data: data)
            else {
                Issue.record("Could not parse")
                return
            }

            #expect(pdu.attributeData.isEmpty == false)
            #expect(pdu.data == data)
            #expect(pdu.dataLength == data.count)
        }

        do {

            // service UUID
            let uuidString = "60F14FE2-F972-11E5-B84F-23E070D5A8C7"

            let data = Data([17, 20, 40, 0, 48, 0, 199, 168, 213, 112, 224, 35, 79, 184, 229, 17, 114, 249, 226, 79, 241, 96])

            guard let pdu = ATTReadByGroupTypeResponse<Data>(data: data)
            else {
                Issue.record("Could not parse")
                return
            }

            #expect(pdu.data == data)
            #expect(pdu.dataLength == data.count)
            #expect(pdu.attributeData.count == 1)
            #expect(pdu.attributeData.first?.attributeHandle == 40)
            #expect(pdu.attributeData.first?.endGroupHandle == 48)
            #expect(pdu.attributeData[0].value == Data([0xC7, 0xA8, 0xD5, 0x70, 0xE0, 0x23, 0x4F, 0xB8, 0xE5, 0x11, 0x72, 0xF9, 0xE2, 0x4F, 0xF1, 0x60]))  // proper little endian representation // proper little endian representation
            #expect(pdu.attributeData[0].value != Data([0x60, 0xF1, 0x4F, 0xE2, 0xF9, 0x72, 0x11, 0xE5, 0xB8, 0x4F, 0x23, 0xE0, 0x70, 0xD5, 0xA8, 0xC7]))  // invalid data // invalid data
            #expect(pdu.attributeData[0].value == Data(BluetoothUUID(rawValue: uuidString)!.littleEndian))
            #expect(
                BluetoothUUID(
                    littleEndian:
                        BluetoothUUID(data: Data(pdu.attributeData[0].value))!
                ).rawValue == uuidString)
        }
    }

    @Test func findByType() {

        do {

            // find C7A8D570-E023-4FB8-E511-72F9E24FF160
            let data = Data([6, 1, 0, 255, 255, 0, 40, 96, 241, 79, 226, 249, 114, 17, 229, 184, 79, 35, 224, 112, 213, 168, 199])

            guard let pdu = ATTFindByTypeRequest<Data>(data: data)
            else {
                Issue.record("Could not parse")
                return
            }

            #expect(pdu.data == data)
            #expect(pdu.dataLength == data.count)
            #expect(pdu.startHandle == 0x0001)
            #expect(pdu.endHandle == 0xFFFF)
            #expect(Data(pdu.attributeValue) == Data(BluetoothUUID(rawValue: "C7A8D570-E023-4FB8-E511-72F9E24FF160")!.littleEndian))
        }

        do {

            // find 60F14FE2-F972-11E5-B84F-23E070D5A8C7
            let data = Data([6, 1, 0, 255, 255, 0, 40, 199, 168, 213, 112, 224, 35, 79, 184, 229, 17, 114, 249, 226, 79, 241, 96])

            guard let pdu = ATTFindByTypeRequest<Data>(data: data)
            else {
                Issue.record("Could not parse")
                return
            }

            #expect(pdu.data == data)
            #expect(pdu.dataLength == data.count)
            #expect(pdu.startHandle == 0x0001)
            #expect(pdu.endHandle == 0xFFFF)
            #expect(Data(pdu.attributeValue) == Data(BluetoothUUID(rawValue: "60F14FE2-F972-11E5-B84F-23E070D5A8C7")!.littleEndian))
        }

        do {

            let data = Data([7, 40, 0, 48, 0])

            let handle = ATTFindByTypeResponse.HandlesInformation(foundAttribute: 40, groupEnd: 48)

            guard let pdu = ATTFindByTypeResponse(data: data)
            else {
                Issue.record("Could not parse")
                return
            }

            #expect(pdu == ATTFindByTypeResponse(handles: [handle]))
            #expect(pdu.data == data)
            #expect(pdu.dataLength == data.count)

            guard let foundHandle = pdu.handles.first,
                pdu.handles.count == 1
            else {
                Issue.record("Invalid response")
                return
            }

            #expect(foundHandle == handle)
            #expect(Data(foundHandle) == Data([40, 0, 48, 0]))
        }
    }

    @Test func readByTypeRequest() {

        // GATT database hash
        // Read by Type (2B2A) (1 - 65535)
        let data = Data([0x08, 0x01, 0x00, 0xFF, 0xFF, 0x2A, 0x2B])

        guard let value = ATTReadByTypeRequest(data: data) else {
            Issue.record()
            return
        }

        #expect(value.startHandle == 1)
        #expect(value.endHandle == 0xFFFF)
        #expect(value.attributeType == .bit16(0x2B2A))
    }

    @Test func readByTypeResponse() {

        typealias DeclarationAttribute = GATTDatabase<Data>.CharacteristicDeclarationAttribute

        typealias Attribute = GATTDatabase<Data>.Attribute

        do {

            let data = Data([9, 21, 41, 0, 2, 42, 0, 199, 168, 213, 112, 224, 35, 224, 128, 229, 17, 111, 249, 76, 38, 125, 231])

            guard let pdu = ATTReadByTypeResponse<Data>(data: data)
            else {
                Issue.record("Could not parse")
                return
            }

            #expect(pdu.data == data)
            #expect(pdu.dataLength == data.count)
            #expect(ATTReadByTypeResponse<Data>(attributeData: pdu.attributeData) == pdu)

            guard let foundCharacteristicData = pdu.attributeData.first,
                pdu.attributeData.count == 1
            else {
                Issue.record("Invalid response")
                return
            }

            #expect(foundCharacteristicData.handle == 41)
            #expect(foundCharacteristicData.value.isEmpty == false)
        }

        do {

            let data = Data([9, 21, 41, 0, 2, 42, 0, 199, 168, 213, 112, 224, 35, 224, 128, 229, 17, 111, 249, 76, 38, 125, 231])

            guard let pdu = ATTReadByTypeResponse<Data>(data: data)
            else {
                Issue.record("Could not parse")
                return
            }

            #expect(pdu.data == data)
            #expect(pdu.dataLength == data.count)
            #expect(ATTReadByTypeResponse(attributeData: pdu.attributeData) == pdu)

            guard let characteristicData = pdu.attributeData.first,
                pdu.attributeData.count == 1
            else {
                Issue.record("Invalid response")
                return
            }

            #expect(characteristicData.handle == 41)
            #expect(characteristicData.value.isEmpty == false)

            let attribute = Attribute(
                handle: characteristicData.handle,
                uuid: BluetoothUUID.Declaration.characteristic,
                value: Data(characteristicData.value),
                permissions: [.read])

            guard let declaration = DeclarationAttribute(attribute: attribute)
            else {
                Issue.record("Could not parse")
                return
            }

            let characteristic = TestProfile.Read

            #expect(declaration.valueHandle == 42)
            #expect(declaration.uuid == characteristic.uuid)
            #expect(declaration.properties == characteristic.properties)
        }
    }

    @Test func handleValueIndication() {

        do {

            /**
             Handle Value Indication
             Opcode: 0x1d
             Attribute Handle: 0x0008 (8)
             Value: 0a 00 ff ff

             L2CAP Receive    0x0041  RECV  Channel ID: 0x0004  Length: 0x0007 (07) [ 1D 08 00 0A 00 FF FF ]
             */

            let data = Data([0x1D, 0x08, 0x00, 0x0A, 0x00, 0xFF, 0xFF])

            guard let pdu = ATTHandleValueIndication<Data>(data: data)
            else {
                Issue.record("Could not parse")
                return
            }

            #expect(type(of: pdu).attributeOpcode.rawValue == 0x1d)
            #expect(pdu.data == data)
            #expect(pdu.dataLength == data.count)
            #expect(pdu.handle == 0x0008)
            #expect(pdu.value == Data([0x0a, 0x00, 0xff, 0xff]))
            #expect(ATTHandleValueIndication(handle: 0x0008, value: Data([0x0a, 0x00, 0xff, 0xff])).data == data)
        }

        do {

            /**
             Handle Value Indication
             Opcode: 0x1d
             Attribute Handle: 0x0008 (8)
             */

            let data = Data([0x1D, 0x08, 0x00])

            guard let pdu = ATTHandleValueIndication<Data>(data: data)
            else {
                Issue.record("Could not parse")
                return
            }

            #expect(type(of: pdu).attributeOpcode.rawValue == 0x1D)
            #expect(pdu.data == data)
            #expect(pdu.dataLength == data.count)
            #expect(pdu.handle == 0x0008)
            #expect(pdu.value == Data())
            #expect(ATTHandleValueIndication(handle: 0x0008, value: Data()).data == data)
        }
    }

    @Test func handleValueConfirmation() {

        do {

            /**
             Handle Value Confirmation
             Opcode: 0x1e

             L2CAP Send       0x0041  SEND  Channel ID: 0x0004  Length: 0x0001 (01) [ 1E ]
             */

            let data = Data([0x1E])

            guard let pdu = ATTHandleValueConfirmation(data: data)
            else {
                Issue.record("Could not parse")
                return
            }

            #expect(type(of: pdu).attributeOpcode.rawValue == 0x1e)
            #expect(pdu.data == data)
        }
    }

    @Test func handleValueNotification() {

        do {

            /**
             RECV  Handle Value Notification - Handle:0x0016 - Value:64
             Handle Value Notification - Handle:0x0016 - Value:64
             Opcode: 0x1b
             Attribute Handle: 0x0016 (22)

             L2CAP Receive    0x0042  RECV  Channel ID: 0x0004  Length: 0x0004 (04) [ 1B 16 00 64 ]
             */

            let data = Data([0x1B, 0x16, 0x00, 0x64])

            guard let pdu = ATTHandleValueNotification<Data>(data: data)
            else {
                Issue.record("Could not parse")
                return
            }

            #expect(pdu.data == data)
            #expect(pdu.dataLength == data.count)
            #expect(pdu.handle == 0x0016)
            #expect(pdu.value == Data([0x64]))

            #expect(ATTHandleValueNotification(handle: 0x0016, value: Data([0x64])).data == data)
        }
    }

    @Test func read() {

        do {

            /**
             ATT Send - Read Request - Handle:0x0016
             Read Request - Handle:0x0016
             Opcode: 0x0a
             Attribute Handle: 0x0016 (22)

             L2CAP Send       0x0042  SEND  Channel ID: 0x0004  Length: 0x0003 (03) [ 0A 16 00 ]
             */
            let data = Data([0x0A, 0x16, 0x00])

            guard let pdu = ATTReadRequest(data: data)
            else {
                Issue.record("Could not parse")
                return
            }

            #expect(type(of: pdu).attributeOpcode.rawValue == 0x0a)
            #expect(pdu.data == data)
            #expect(pdu.dataLength == data.count)
            #expect(pdu.handle == 0x0016)
        }

        do {

            /**
             ATT Receive - Read Response - Value:64
             Read Response - Value:64
             Opcode: 0x0b
             Value: 64

             L2CAP Receive    0x0042  RECV  Channel ID: 0x0004  Length: 0x0002 (02) [ 0B 64 ]
             */

            let data = Data([0x0B, 0x64])

            guard let pdu = ATTReadResponse<Data>(data: data)
            else {
                Issue.record("Could not parse")
                return
            }

            #expect(type(of: pdu).attributeOpcode.rawValue == 0x0b)
            #expect(pdu.data == data)
            #expect(pdu.dataLength == data.count)
            #expect(pdu.attributeValue == Data([0x64]))
        }
    }

    @Test func readMultiple() {

        guard let request = ATTReadMultipleRequest(handles: [0x01, 0x02])
        else {
            Issue.record()
            return
        }

        #expect(request.data == request.data)
        #expect(request.dataLength == request.data.count)
        #expect(ATTReadMultipleRequest(data: request.data) == request)

        let response = ATTReadMultipleResponse(values: Data([0x00, 0x00]))
        #expect(response.data == response.data)
        #expect(ATTReadMultipleResponse(data: response.data) == response)
    }

    @Test func write() {

        do {

            /**
             Write Request - Handle:0x0017 - Value:0100
             Opcode: 0x12
             Attribute Handle: 0x0017 (23)
             Value: 01 00

             L2CAP Send       0x0042  SEND  Channel ID: 0x0004  Length: 0x0005 (05) [ 12 17 00 01 00 ]
             */

            let data = Data([0x12, 0x17, 0x00, 0x01, 0x00])

            guard let pdu = ATTWriteRequest<Data>(data: data)
            else {
                Issue.record("Could not parse")
                return
            }

            #expect(type(of: pdu).attributeOpcode.rawValue == 0x12)
            #expect(pdu.data == data)
            #expect(pdu.dataLength == data.count)
            #expect(pdu.handle == 0x0017)
            #expect(pdu.value == Data([0x01, 0x00]))
        }

        do {

            /**
             Write Response
             Opcode: 0x13

             L2CAP Receive    0x0042  RECV  Channel ID: 0x0004  Length: 0x0001 (01) [ 13 ]
             */

            let data = Data([0x13])

            guard let pdu = ATTWriteResponse(data: data)
            else {
                Issue.record("Could not parse")
                return
            }

            #expect(type(of: pdu).attributeOpcode.rawValue == 0x13)
            #expect(pdu.data == data)
        }
    }

    @Test func findInformation() {

        do {

            /**
             Find Information Request - Start Handle:0x0017 - End Handle:0x0017
             Opcode: 0x04
             Start Handle: 0x0017
             End Handle: 0x0017
             L2CAP Send Channel ID: 0x0004  Length: 0x0005 (05) [ 04 17 00 17 00 ]
             */

            let data = Data([0x04, 0x17, 0x00, 0x17, 0x00])

            guard let pdu = ATTFindInformationRequest(data: data)
            else {
                Issue.record("Could not parse")
                return
            }

            #expect(pdu.data == data)
            #expect(pdu.dataLength == data.count)
            #expect(type(of: pdu).attributeOpcode.rawValue == 0x04)
            #expect(pdu.startHandle == 0x0017)
            #expect(pdu.endHandle == 0x0017)
        }

        do {

            /**
             Find Information Response
             Opcode: 0x05
             Format: 1 (Handles and 16 byte UUIDs)
             Handle: 0x0017 UUID: 2902 (Client Characteristic Configuration)

             L2CAP Receive    0x0042  RECV  Channel ID: 0x0004  Length: 0x0006 (06) [ 05 01 17 00 02 29 ]
             */

            let data = Data([0x05, 0x01, 0x17, 0x00, 0x02, 0x29])

            guard let pdu = ATTFindInformationResponse(data: data)
            else {
                Issue.record("Could not parse")
                return
            }

            let foundData = ATTFindInformationResponse.AttributeData.bit16([
                ATTFindInformationResponse.Attribute16Bit(handle: 0x0017, uuid: 0x2902)
            ])

            #expect(type(of: pdu).attributeOpcode.rawValue == 0x05)
            #expect(pdu.data == data)
            #expect(pdu.dataLength == data.count)
            #expect("\(pdu.attributeData)" == "\(foundData)")
            #expect(pdu.attributeData.count == 1)
        }

        do {

            // Find Information Request - Start Handle:0x0004 - End Handle:0x0004
            let data = Data([4, 4, 0, 4, 0])

            guard let pdu = ATTFindInformationRequest(data: data)
            else {
                Issue.record("Could not parse")
                return
            }

            #expect(pdu.data == data)
            #expect(pdu.dataLength == data.count)
            #expect(pdu.startHandle == 0x04)
            #expect(pdu.endHandle == 0x04)
        }

        do {

            // Find Information Response
            // Opcode: 0x05
            // Format: 1 (Handles and 16 byte UUIDs)
            // Handle: 0x0004 UUID: 2902 (Client Characteristic Configuration)
            let data = Data([5, 1, 4, 0, 2, 41])

            guard let pdu = ATTFindInformationResponse(data: data)
            else {
                Issue.record("Could not parse")
                return
            }

            #expect(pdu.data == data)
            #expect(pdu.dataLength == data.count)

            guard case let .bit16(attributeData) = pdu.attributeData
            else {
                Issue.record("Invalid data")
                return
            }

            #expect(attributeData.count == 1)
            #expect(attributeData[0].handle == 0x0004)
            #expect(BluetoothUUID.bit16(attributeData[0].uuid) == BluetoothUUID.Descriptor.clientCharacteristicConfiguration)
        }
    }

    @Test func configureClientDescriptor() {

        /**
         Read: [2, 185, 0]
         Send: [3, 200, 0]
         Read: [18, 4, 0, 1, 0]
         Send: [19]
         */

        do {

            let data = Data([2, 185, 0])

            guard let pdu = ATTMaximumTransmissionUnitRequest(data: data)
            else {
                Issue.record("Could not parse")
                return
            }

            #expect(pdu.data == data)
            #expect(pdu.dataLength == data.count)
            #expect(pdu.clientMTU == 185)
        }

        do {

            let data = Data([3, 200, 0])

            guard let pdu = ATTMaximumTransmissionUnitResponse(data: data)
            else {
                Issue.record("Could not parse")
                return
            }

            #expect(pdu.data == data)
            #expect(pdu.dataLength == data.count)
            #expect(pdu.serverMTU == 200)
        }

        do {

            let data = Data([18, 4, 0, 1, 0])

            guard let pdu = ATTWriteRequest<Data>(data: data)
            else {
                Issue.record("Could not parse")
                return
            }

            #expect(pdu.data == data)
            #expect(pdu.dataLength == data.count)
            #expect(pdu.handle == 0x04)
            #expect(pdu.value == Data([1, 0]))

            guard let clientConfiguration = GATTClientCharacteristicConfiguration(data: Data(pdu.value))
            else {
                Issue.record("Could not parse")
                return
            }

            #expect(Data(clientConfiguration) == Data(pdu.value))
            #expect(clientConfiguration == [.notify])
            #expect(clientConfiguration != [.notify, .indicate])
            #expect(clientConfiguration != [])
        }

        do {

            let data = Data([19])

            guard let pdu = ATTWriteResponse(data: data)
            else {
                Issue.record("Could not parse")
                return
            }

            #expect(pdu.data == data)
        }
    }

    @Test func discovery() {

        // MTU Exchange
        do {

            let data = Data([2, 185, 0])

            guard let pdu = ATTMaximumTransmissionUnitRequest(data: data)
            else {
                Issue.record("Could not parse")
                return
            }

            #expect(pdu.data == data)
            #expect(pdu.dataLength == data.count)
            #expect(pdu.clientMTU == 185)
        }

        do {

            let data = Data([3, 200, 0])

            guard let pdu = ATTMaximumTransmissionUnitResponse(data: data)
            else {
                Issue.record("Could not parse")
                return
            }

            #expect(pdu.data == data)
            #expect(pdu.dataLength == data.count)
            #expect(pdu.serverMTU == 200)
        }

        // Service Discovery
        do {

            let data = Data([16, 1, 0, 255, 255, 0, 40])

            guard let pdu = ATTReadByGroupTypeRequest(data: data)
            else {
                Issue.record("Could not parse")
                return
            }

            #expect(pdu.data == data)
            #expect(pdu.dataLength == data.count)
            #expect(pdu.type == BluetoothUUID.Declaration.primaryService)
            #expect(pdu.startHandle == 0x0001)
            #expect(pdu.endHandle == .max)
        }

        do {

            let data = Data([17, 20, 1, 0, 6, 0, 231, 207, 159, 173, 34, 222, 166, 180, 145, 78, 37, 213, 23, 49, 212, 52, 7, 0, 12, 0, 251, 52, 155, 95, 128, 0, 0, 128, 0, 16, 0, 0, 169, 254, 0, 0, 13, 0, 18, 0, 178, 26, 190, 138, 180, 130, 146, 145, 222, 73, 117, 102, 201, 67, 100, 139])

            guard let pdu = ATTReadByGroupTypeResponse<Data>(data: data)
            else {
                Issue.record("Could not parse")
                return
            }

            #expect(pdu.data == data)
            #expect(pdu.dataLength == data.count)
            #expect(pdu.attributeData.count == 3)

            #expect(pdu.attributeData[0].attributeHandle == 1)
            #expect(pdu.attributeData[0].endGroupHandle == 6)
            #expect(BluetoothUUID(littleEndian: BluetoothUUID(data: Data(pdu.attributeData[0].value))!).rawValue == "34D43117-D525-4E91-B4A6-DE22AD9FCFE7")

            #expect(pdu.attributeData[1].attributeHandle == 7)
            #expect(pdu.attributeData[1].endGroupHandle == 12)
            #expect(BluetoothUUID(littleEndian: BluetoothUUID(data: Data(pdu.attributeData[1].value))!).rawValue == "0000FEA9-0000-1000-8000-00805F9B34FB")

            #expect(pdu.attributeData[2].attributeHandle == 13)
            #expect(pdu.attributeData[2].endGroupHandle == 18)
            #expect(BluetoothUUID(littleEndian: BluetoothUUID(data: Data(pdu.attributeData[2].value))!).rawValue == "8B6443C9-6675-49DE-9192-82B48ABE1AB2")
        }

        do {

            let data = Data([16, 19, 0, 255, 255, 0, 40])

            guard let pdu = ATTReadByGroupTypeRequest(data: data)
            else {
                Issue.record("Could not parse")
                return
            }

            #expect(pdu.data == data)
            #expect(pdu.dataLength == data.count)
            #expect(pdu.type == BluetoothUUID.Declaration.primaryService)
            #expect(pdu.startHandle == 19)
            #expect(pdu.endHandle == .max)
        }

        do {

            let data = Data([1, 16, 19, 0, 10])

            guard let pdu = ATTErrorResponse(data: data)
            else {
                Issue.record("Could not parse")
                return
            }

            #expect(pdu.data == data)
            #expect(pdu.dataLength == data.count)
            #expect(pdu.error == .attributeNotFound)
            #expect(pdu.attributeHandle == 19)
            #expect(pdu.request == .readByGroupTypeRequest)
        }

        /// Characteristic Discovery
        do {

            let data = Data([8, 1, 0, 6, 0, 3, 40])

            guard let pdu = ATTReadByTypeRequest(data: data)
            else {
                Issue.record("Could not parse")
                return
            }

            #expect(pdu.data == data)
            #expect(pdu.dataLength == data.count)
            #expect(pdu.startHandle == 1)
            #expect(pdu.endHandle == 6)
            #expect(pdu.attributeType == BluetoothUUID.Declaration.characteristic)
        }

        do {

            let data = Data([9, 21, 2, 0, 16, 3, 0, 153, 234, 51, 69, 164, 205, 80, 147, 177, 76, 242, 125, 196, 139, 229, 43, 5, 0, 8, 6, 0, 174, 253, 204, 198, 23, 135, 52, 155, 155, 75, 219, 59, 176, 229, 202, 148])

            guard let pdu = ATTReadByTypeResponse<Data>(data: data)
            else {
                Issue.record("Could not parse")
                return
            }

            #expect(pdu.data == data)
            #expect(pdu.dataLength == data.count)
            #expect(pdu.attributeData.count == 2)
            #expect(pdu.attributeData[0].handle == 2)
            #expect(pdu.attributeData[1].handle == 5)

            do {

                let attribute = GATTDatabase<Data>.Attribute(
                    handle: pdu.attributeData[0].handle,
                    uuid: BluetoothUUID.Declaration.characteristic,
                    value: Data(pdu.attributeData[0].value),
                    permissions: [.read])

                guard let declaration = GATTDatabase<Data>.CharacteristicDeclarationAttribute(attribute: attribute)
                else {
                    Issue.record()
                    return
                }

                #expect(declaration.attribute.value == attribute.value)
                #expect(declaration.uuid.rawValue == "2BE58BC4-7DF2-4CB1-9350-CDA44533EA99")
                #expect(declaration.valueHandle == 3)
                #expect(declaration.properties == [.notify])
            }

            do {

                let attribute = GATTDatabase<Data>.Attribute(
                    handle: pdu.attributeData[1].handle,
                    uuid: BluetoothUUID.Declaration.characteristic,
                    value: Data(pdu.attributeData[1].value),
                    permissions: [.read])

                guard let characteristicDeclarationAttribute = GATTDatabase<Data>.CharacteristicDeclarationAttribute(attribute: attribute)
                else {
                    Issue.record()
                    return
                }

                #expect(characteristicDeclarationAttribute.attribute.value == attribute.value)
                #expect(characteristicDeclarationAttribute.uuid.rawValue == "94CAE5B0-3BDB-4B9B-9B34-8717C6CCFDAE")
                #expect(characteristicDeclarationAttribute.properties == [.write])
                #expect(characteristicDeclarationAttribute.valueHandle == 6)
            }
        }

        /// Characteristic Discovery
        do {

            let data = Data([8, 7, 0, 12, 0, 3, 40])

            guard let pdu = ATTReadByTypeRequest(data: data)
            else {
                Issue.record("Could not parse")
                return
            }

            #expect(pdu.data == data)
            #expect(pdu.dataLength == data.count)
            #expect(pdu.startHandle == 7)
            #expect(pdu.endHandle == 12)
            #expect(pdu.attributeType == BluetoothUUID.Declaration.characteristic)
        }

        do {

            let data = Data([9, 21, 8, 0, 18, 9, 0, 1, 0, 0, 87, 39, 220, 216, 142, 254, 77, 227, 3, 128, 24, 131, 204, 11, 0, 8, 12, 0, 2, 0, 0, 87, 39, 220, 216, 142, 254, 77, 227, 3, 128, 24, 131, 204])

            guard let pdu = ATTReadByTypeResponse<Data>(data: data)
            else {
                Issue.record("Could not parse")
                return
            }

            #expect(pdu.data == data)
            #expect(pdu.dataLength == data.count)
            #expect(pdu.attributeData.count == 2)
            #expect(pdu.attributeData[0].handle == 8)
            #expect(pdu.attributeData[1].handle == 11)

            do {

                let attribute = GATTDatabase<Data>.Attribute(
                    handle: pdu.attributeData[0].handle,
                    uuid: BluetoothUUID.Declaration.characteristic,
                    value: Data(pdu.attributeData[0].value),
                    permissions: [.read])

                guard let characteristicDeclarationAttribute = GATTDatabase<Data>.CharacteristicDeclarationAttribute(attribute: attribute)
                else {
                    Issue.record()
                    return
                }

                #expect(characteristicDeclarationAttribute.attribute.value == attribute.value)
                #expect(characteristicDeclarationAttribute.uuid.rawValue == "CC831880-03E3-4DFE-8ED8-DC2757000001")
                #expect(characteristicDeclarationAttribute.properties == [.read, .notify])
            }

            do {

                let attribute = GATTDatabase<Data>.Attribute(
                    handle: pdu.attributeData[1].handle,
                    uuid: BluetoothUUID.Declaration.characteristic,
                    value: pdu.attributeData[1].value,
                    permissions: [.read])

                guard let characteristicDeclarationAttribute = GATTDatabase<Data>.CharacteristicDeclarationAttribute(attribute: attribute)
                else {
                    Issue.record()
                    return
                }

                #expect(characteristicDeclarationAttribute.attribute.value == attribute.value)
                #expect(characteristicDeclarationAttribute.uuid.rawValue == "CC831880-03E3-4DFE-8ED8-DC2757000002")
                #expect(characteristicDeclarationAttribute.properties == [.write])
            }
        }

        /// Characteristic Discovery
        do {

            let data = Data([8, 13, 0, 18, 0, 3, 40])

            guard let pdu = ATTReadByTypeRequest(data: data)
            else {
                Issue.record("Could not parse")
                return
            }

            #expect(pdu.data == data)
            #expect(pdu.dataLength == data.count)
            #expect(pdu.startHandle == 13)
            #expect(pdu.endHandle == 18)
            #expect(pdu.attributeType == BluetoothUUID.Declaration.characteristic)
        }

        do {

            let data = Data([9, 21, 14, 0, 16, 15, 0, 148, 89, 241, 12, 105, 23, 110, 137, 175, 75, 151, 213, 45, 106, 139, 210, 17, 0, 8, 18, 0, 231, 116, 224, 184, 128, 249, 130, 161, 110, 70, 164, 15, 236, 148, 235, 104])

            guard let pdu = ATTReadByTypeResponse<Data>(data: data)
            else {
                Issue.record("Could not parse")
                return
            }

            #expect(pdu.data == data)
            #expect(pdu.dataLength == data.count)
            #expect(pdu.attributeData.count == 2)
            #expect(pdu.attributeData[0].handle == 14)
            #expect(pdu.attributeData[1].handle == 17)

            do {

                let attribute = GATTDatabase<Data>.Attribute(
                    handle: pdu.attributeData[0].handle,
                    uuid: BluetoothUUID.Declaration.characteristic,
                    value: pdu.attributeData[0].value,
                    permissions: [.read])

                guard let characteristicDeclarationAttribute = GATTDatabase<Data>.CharacteristicDeclarationAttribute(attribute: attribute)
                else {
                    Issue.record()
                    return
                }

                #expect(characteristicDeclarationAttribute.attribute.value == attribute.value)
                #expect(characteristicDeclarationAttribute.uuid.rawValue == "D28B6A2D-D597-4BAF-896E-17690CF15994")
                #expect(characteristicDeclarationAttribute.properties == [.notify])
            }

            do {

                let attribute = GATTDatabase<Data>.Attribute(
                    handle: pdu.attributeData[1].handle,
                    uuid: BluetoothUUID.Declaration.characteristic,
                    value: Data(pdu.attributeData[1].value),
                    permissions: [.read])

                guard let characteristicDeclarationAttribute = GATTDatabase<Data>.CharacteristicDeclarationAttribute(attribute: attribute)
                else {
                    Issue.record()
                    return
                }

                #expect(characteristicDeclarationAttribute.attribute.value == attribute.value)
                #expect(characteristicDeclarationAttribute.uuid.rawValue == "68EB94EC-0FA4-466E-A182-F980B8E074E7")
                #expect(characteristicDeclarationAttribute.properties == [.write])
            }
        }
    }
}

internal extension ATTProtocolDataUnit {

    var data: Data {
        Data(self)
    }
}

#endif
