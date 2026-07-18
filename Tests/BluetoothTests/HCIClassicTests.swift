//
//  HCIClassicTests.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 7/17/26.
//

#if canImport(BluetoothHCI)
import Testing
#if canImport(FoundationEssentials)
import FoundationEssentials
#else
import Foundation
#endif
@testable import Bluetooth
@testable import BluetoothHCI

/// Tests for classic (BR/EDR) HCI commands and events.
@Suite struct HCIClassicTests {

    // MARK: - Unit Types

    @Test func connectionAcceptTimeout() {

        #expect(ConnectionAcceptTimeout.length == 2)

        // bounds
        #expect(ConnectionAcceptTimeout.min.rawValue == 0x0001)
        #expect(ConnectionAcceptTimeout.max.rawValue == 0xB540)
        #expect(ConnectionAcceptTimeout(rawValue: 0x0000) == nil)
        #expect(ConnectionAcceptTimeout(rawValue: 0xB541) == nil)
        #expect(ConnectionAcceptTimeout(rawValue: 0xFFFF) == nil)
        #expect(ConnectionAcceptTimeout(rawValue: 0x0001) == .min)
        #expect(ConnectionAcceptTimeout(rawValue: 0xB540) == .max)

        // time conversion
        #expect(ConnectionAcceptTimeout.min.miliseconds == 0.625)
        #expect(ConnectionAcceptTimeout.max.miliseconds == 29000.0)

        guard let timeout = ConnectionAcceptTimeout(rawValue: 0x1FA0)
        else {
            Issue.record("Could not initialize timeout")
            return
        }

        #expect(timeout.rawValue == 0x1FA0)
        #expect(timeout.miliseconds == 5060.0)

        // comparable
        #expect(ConnectionAcceptTimeout.min < ConnectionAcceptTimeout.max)
        #expect(timeout < .max)
        #expect(ConnectionAcceptTimeout.min < timeout)
    }

    @Test func lmpFeature() {

        // all cases must be unique bits
        let rawValues = LMPFeature.allCases.map { $0.rawValue }
        #expect(Set(rawValues).count == rawValues.count)
        #expect(LMPFeature.allCases.count == 54)

        // raw values
        #expect(LMPFeature.slotPackets3.rawValue == 0b01)
        #expect(LMPFeature.slotPackets5.rawValue == 0b10)
        #expect(LMPFeature.encryption.rawValue == 0b100)
        #expect(LMPFeature.extendedFeatures.rawValue == 1 << 63)

        // names
        for feature in LMPFeature.allCases {
            #expect(feature.name.isEmpty == false)
        }

        #expect(LMPFeature.slotPackets3.name == "3 slot packets")
        #expect(LMPFeature.encryption.name == "Encryption")
        #expect(LMPFeature.secureSimplePairing.name == "Secure Simple Pairing")
        #expect(LMPFeature.extendedFeatures.name == "Extended features")

        // bit mask option set
        let features: BitMaskOptionSet<LMPFeature> = [.encryption, .roleSwitch]
        #expect(features.rawValue == 0b100100)
        #expect(features.contains(.encryption))
        #expect(features.contains(.roleSwitch))
        #expect(features.contains(.slotPackets3) == false)

        let allFeatures = BitMaskOptionSet<LMPFeature>.all
        #expect(allFeatures.contains(LMPFeature.allCases))
    }

    // MARK: - Events

    @Test func inquiryComplete() {

        #expect(HCIInquiryComplete.event.rawValue == 0x01)
        #expect(HCIInquiryComplete.length == 1)

        guard let event = HCIInquiryComplete(data: Data([0x00]))
        else {
            Issue.record("Could not decode event")
            return
        }

        #expect(event.status == .success)

        // error status
        #expect(HCIInquiryComplete(data: Data([0x04]))?.status == .error(.pageTimeout))

        // invalid data
        #expect(HCIInquiryComplete(data: Data()) == nil)
        #expect(HCIInquiryComplete(data: Data([0x00, 0x00])) == nil)
        #expect(HCIInquiryComplete(data: Data([0xFF])) == nil)  // invalid status
    }

    @Test func connectionRequest() {

        #expect(HCIConnectionRequest.event.rawValue == 0x04)
        #expect(HCIConnectionRequest.length == 10)

        // link type
        #expect(HCIConnectionRequest.LinkType(rawValue: 0x00) == .sco)
        #expect(HCIConnectionRequest.LinkType(rawValue: 0x01) == .acl)
        #expect(HCIConnectionRequest.LinkType(rawValue: 0x02) == .esco)
        #expect(HCIConnectionRequest.LinkType(rawValue: 0x03) == nil)

        let data = Data([0xAF, 0xD2, 0x06, 0x2D, 0x70, 0xB0, 0x0C, 0x01, 0x38, 0x01])

        guard let event = HCIConnectionRequest(data: data)
        else {
            Issue.record("Could not decode event")
            return
        }

        #expect(event.address == BluetoothAddress(rawValue: "B0:70:2D:06:D2:AF")!)
        #expect(event.classOfDevice == ClassOfDevice(data: Data([0x0C, 0x01, 0x38])))
        #expect(event.linkType == .acl)

        // invalid data
        #expect(HCIConnectionRequest(data: Data()) == nil)
        #expect(HCIConnectionRequest(data: data.prefix(9)) == nil)  // truncated
        #expect(HCIConnectionRequest(data: data + Data([0x00])) == nil)  // extra byte
        #expect(HCIConnectionRequest(data: Data([0xAF, 0xD2, 0x06, 0x2D, 0x70, 0xB0, 0x0C, 0x01, 0x38, 0x03])) == nil)  // invalid link type
    }

    @Test func encryptionKeyRefreshComplete() {

        #expect(HCIEncryptionKeyRefreshComplete.event.rawValue == 0x30)
        #expect(HCIEncryptionKeyRefreshComplete.length == 3)

        guard let event = HCIEncryptionKeyRefreshComplete(data: Data([0x00, 0x01, 0x00]))
        else {
            Issue.record("Could not decode event")
            return
        }

        #expect(event.status == .success)
        #expect(event.handle == 0x0001)

        // error status
        #expect(HCIEncryptionKeyRefreshComplete(data: Data([0x05, 0x02, 0x00]))?.status == .error(.authenticationFailure))

        // invalid data
        #expect(HCIEncryptionKeyRefreshComplete(data: Data()) == nil)
        #expect(HCIEncryptionKeyRefreshComplete(data: Data([0x00, 0x01])) == nil)  // truncated
        #expect(HCIEncryptionKeyRefreshComplete(data: Data([0xFF, 0x01, 0x00])) == nil)  // invalid status
    }

    @Test func readClockOffsetComplete() {

        #expect(HCIReadClockOffsetComplete.event.rawValue == 0x1C)
        #expect(HCIReadClockOffsetComplete.length == 5)
        #expect(HCIReadClockOffsetComplete.ClockOffset.length == 2)

        guard let event = HCIReadClockOffsetComplete(data: Data([0x00, 0x01, 0x00, 0x33, 0x21]))
        else {
            Issue.record("Could not decode event")
            return
        }

        #expect(event.status == .success)
        #expect(event.handle == 0x0001)
        #expect(event.clockOffset.rawValue == 0x2133)

        // invalid data
        #expect(HCIReadClockOffsetComplete(data: Data()) == nil)
        #expect(HCIReadClockOffsetComplete(data: Data([0x00, 0x01, 0x00, 0x33])) == nil)  // truncated
        #expect(HCIReadClockOffsetComplete(data: Data([0xFF, 0x01, 0x00, 0x33, 0x21])) == nil)  // invalid status
    }

    // MARK: - Commands

    @Test func readClockOffset() {

        let parameters = HCIReadClockOffset(handle: 0x0001)

        #expect(HCIReadClockOffset.command.opcode == 0x041F)
        #expect(Data(parameters) == Data([0x01, 0x00]))
    }

    @Test func readLMPHandle() {

        let parameters = HCIReadLMPHandle(handle: 0x0005)

        #expect(HCIReadLMPHandle.command.opcode == 0x0420)
        #expect(Data(parameters) == Data([0x05, 0x00]))

        guard let returnParameter = HCIReadLMPHandleReturn(data: Data([0x01, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00]))
        else {
            Issue.record("Could not decode return parameter")
            return
        }

        #expect(returnParameter.connectionHandle == 0x0001)
        #expect(returnParameter.lmpHandle == 0x02)

        // invalid data
        #expect(HCIReadLMPHandleReturn(data: Data()) == nil)
        #expect(HCIReadLMPHandleReturn(data: Data([0x01, 0x00, 0x02])) == nil)  // truncated
        #expect(HCIReadLMPHandleReturn(data: Data([0x01, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00])) == nil)  // oversized
    }

    @Test func rejectConnectionRequest() {

        let parameters = HCIRejectConnectionRequest(
            address: BluetoothAddress(rawValue: "B0:70:2D:06:D2:AF")!,
            error: .rejectedLimitedResources)

        #expect(HCIRejectConnectionRequest.command.opcode == 0x040A)
        #expect(Data(parameters) == Data([0xAF, 0xD2, 0x06, 0x2D, 0x70, 0xB0, 0x0D]))
    }

    @Test func deleteStoredLinkKey() async throws {

        let address = BluetoothAddress(rawValue: "B0:70:2D:06:D2:AF")!

        #expect(HCIDeleteStoredLinkKey.command.opcode == 0x0C12)
        #expect(HCIDeleteStoredLinkKey.length == 7)

        // delete flag
        #expect(HCIDeleteStoredLinkKey.DeleteFlag.onlySpecifiedKey.rawValue == 0x00)
        #expect(HCIDeleteStoredLinkKey.DeleteFlag.all.rawValue == 0x01)

        let parameters = HCIDeleteStoredLinkKey(address: address, deleteFlag: .all)
        #expect(Data(parameters) == Data([0xAF, 0xD2, 0x06, 0x2D, 0x70, 0xB0, 0x01]))

        let specifiedKeyParameters = HCIDeleteStoredLinkKey(address: address, deleteFlag: .onlySpecifiedKey)
        #expect(Data(specifiedKeyParameters) == Data([0xAF, 0xD2, 0x06, 0x2D, 0x70, 0xB0, 0x00]))

        // return parameter
        #expect(HCIDeleteStoredLinkKeyReturn.length == 2)

        guard let returnParameter = HCIDeleteStoredLinkKeyReturn(data: Data([0x05, 0x00]))
        else {
            Issue.record("Could not decode return parameter")
            return
        }

        #expect(returnParameter.numberKeysDeleted == 5)

        // invalid data
        #expect(HCIDeleteStoredLinkKeyReturn(data: Data()) == nil)
        #expect(HCIDeleteStoredLinkKeyReturn(data: Data([0x05])) == nil)  // truncated

        // mock host controller round trip
        let hostController = TestHostController()

        hostController.queue.append(
            .command(
                HostControllerBasebandCommand.deleteStoredLinkKey.opcode,
                [0x12, 0x0C, 0x07, 0xAF, 0xD2, 0x06, 0x2D, 0x70, 0xB0, 0x01]))

        // command complete: status + Num_Keys_Deleted
        hostController.queue.append(.event([0x0E, 0x06, 0x01, 0x12, 0x0C, 0x00, 0x05, 0x00]))

        let deleteReturn = try await hostController.deleteStoredLinkKey(address: address, deleteFlag: .all)
        #expect(hostController.queue.isEmpty)

        #expect(deleteReturn.numberKeysDeleted == 5)
    }

    @Test func readDataBlockSize() async throws {

        #expect(HCIReadDataBlockSizeReturn.command.opcode == 0x100A)
        #expect(HCIReadDataBlockSizeReturn.length == 7)

        guard let returnParameter = HCIReadDataBlockSizeReturn(data: Data([0x00, 0xEB, 0x03, 0x44, 0x01, 0x10, 0x00]))
        else {
            Issue.record("Could not decode return parameter")
            return
        }

        #expect(returnParameter.status == .success)
        #expect(returnParameter.maxACLDataPacketLength == 0x03EB)
        #expect(returnParameter.dataBlockLength == 0x0144)
        #expect(returnParameter.dataBlocksTotalNumber == 0x0010)

        // invalid data
        #expect(HCIReadDataBlockSizeReturn(data: Data()) == nil)
        #expect(HCIReadDataBlockSizeReturn(data: Data([0x00, 0xEB, 0x03, 0x44, 0x01, 0x10])) == nil)  // truncated
        #expect(HCIReadDataBlockSizeReturn(data: Data([0xFF, 0xEB, 0x03, 0x44, 0x01, 0x10, 0x00])) == nil)  // invalid status

        // mock host controller round trip
        let hostController = TestHostController()

        hostController.queue.append(
            .command(
                InformationalCommand.readDataBlockSize.opcode,
                [0x0A, 0x10, 0x00]))

        // command complete: status + return parameter
        hostController.queue.append(.event([0x0E, 0x0B, 0x01, 0x0A, 0x10, 0x00, 0x00, 0xEB, 0x03, 0x44, 0x01, 0x10, 0x00]))

        let blockSize = try await hostController.readDataBlockSize()
        #expect(hostController.queue.isEmpty)

        #expect(blockSize.status == .success)
        #expect(blockSize.maxACLDataPacketLength == 0x03EB)
        #expect(blockSize.dataBlockLength == 0x0144)
        #expect(blockSize.dataBlocksTotalNumber == 0x0010)
    }

    @Test func readConnectionAcceptTimeout() {

        #expect(HCIReadConnectionAcceptTimeout.command.opcode == 0x0C15)
        #expect(HCIReadConnectionAcceptTimeout.length == 2)

        guard let returnParameter = HCIReadConnectionAcceptTimeout(data: Data([0xA0, 0x1F]))
        else {
            Issue.record("Could not decode return parameter")
            return
        }

        #expect(returnParameter.timeout.rawValue == 0x1FA0)
        #expect(returnParameter.timeout.miliseconds == 5060.0)

        // invalid data
        #expect(HCIReadConnectionAcceptTimeout(data: Data()) == nil)
        #expect(HCIReadConnectionAcceptTimeout(data: Data([0xA0])) == nil)  // truncated
        #expect(HCIReadConnectionAcceptTimeout(data: Data([0x00, 0x00])) == nil)  // below minimum
        #expect(HCIReadConnectionAcceptTimeout(data: Data([0x41, 0xB5])) == nil)  // above maximum
    }

    @Test func writeConnectionAcceptTimeout() {

        guard let timeout = ConnectionAcceptTimeout(rawValue: 0x1FA0)
        else {
            Issue.record("Could not initialize timeout")
            return
        }

        let parameters = HCIWriteConnectionAcceptTimeout(timeout: timeout)

        #expect(HCIWriteConnectionAcceptTimeout.command.opcode == 0x0C16)
        #expect(Data(parameters) == Data([0xA0, 0x1F]))

        #expect(Data(HCIWriteConnectionAcceptTimeout(timeout: .min)) == Data([0x01, 0x00]))
        #expect(Data(HCIWriteConnectionAcceptTimeout(timeout: .max)) == Data([0x40, 0xB5]))
    }

    @Test func holdMode() {

        #expect(HCIHoldMode.command.opcode == 0x0801)
        #expect(HCIHoldMode.length == 6)

        // interval
        #expect(HCIHoldMode.Interval.length == 4)
        #expect(HCIHoldMode.Interval.min == 0x0014)
        #expect(HCIHoldMode.Interval.max == 0x8000)
        #expect(HCIHoldMode.Interval.full.rawValue == 0x0014...0x8000)
        #expect(HCIHoldMode.Interval(rawValue: 0x0010...0x8000) == nil)  // below minimum
        #expect(HCIHoldMode.Interval(rawValue: 0x0014...0x9000) == nil)  // above maximum

        guard let interval = HCIHoldMode.Interval(rawValue: 0x0020...0x0100)
        else {
            Issue.record("Could not initialize interval")
            return
        }

        #expect(interval.rawValue == 0x0020...0x0100)
        #expect(interval.miliseconds == 20.0...160.0)

        // default interval
        let parameters = HCIHoldMode(connectionHandle: 0x0001)
        #expect(parameters.interval == .full)
        #expect(Data(parameters) == Data([0x01, 0x00, 0x00, 0x80, 0x14, 0x00]))

        // custom interval
        let customParameters = HCIHoldMode(connectionHandle: 0x0001, interval: interval)
        #expect(Data(customParameters) == Data([0x01, 0x00, 0x00, 0x01, 0x20, 0x00]))
    }
}
#endif
