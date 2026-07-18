//
//  HCILEPrivacyTests.swift
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

@Suite struct HCILEPrivacyTests {

    // MARK: - Resolving List

    @Test func addDeviceToResolvingList() async throws {

        let peerIrk = UInt128(littleEndian: UInt128(bytes: (0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F, 0x10)))

        let localIrk = UInt128(littleEndian: UInt128(bytes: (0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17, 0x18, 0x19, 0x1A, 0x1B, 0x1C, 0x1D, 0x1E, 0x1F, 0x20)))

        let peerIdentifyAddress: UInt64 = 0x0000_58E2_8F7C_0BB3

        let command = HCILEAddDeviceToResolvingList(
            peerIdentifyAddressType: .public,
            peerIdentifyAddress: peerIdentifyAddress,
            peerIrk: peerIrk,
            localIrk: localIrk)

        #expect(HCILEAddDeviceToResolvingList.command == .addDeviceToResolvedList)
        #expect(command.peerIdentifyAddressType == .public)
        #expect(command.peerIdentifyAddress == peerIdentifyAddress)
        #expect(command.peerIrk == peerIrk)
        #expect(command.localIrk == localIrk)

        let expectedData = Data(
            [
                0x00,  // Peer_Identity_Address_Type
                0xB3, 0x0B, 0x7C, 0x8F, 0xE2, 0x58, 0x00, 0x00,  // Peer_Identity_Address
                0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F, 0x10,  // Peer_IRK
                0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17, 0x18, 0x19, 0x1A, 0x1B, 0x1C, 0x1D, 0x1E, 0x1F, 0x20  // Local_IRK
            ])

        #expect(command.data == expectedData)

        // test controller request
        let hostController = TestHostController()

        hostController.queue.append(
            .command(
                HCILowEnergyCommand.addDeviceToResolvedList.opcode,
                [0x27, 0x20, 0x29] + [UInt8](expectedData))
        )

        hostController.queue.append(.event([0x0E, 0x04, 0x01, 0x27, 0x20, 0x00]))

        try await hostController.lowEnergyAddDeviceToResolvingList(
            peerIdentifyAddressType: .public,
            peerIdentifyAddress: peerIdentifyAddress,
            peerIrk: peerIrk,
            localIrk: localIrk)

        #expect(hostController.queue.isEmpty)
    }

    @Test func removeDeviceFromResolvingList() async throws {

        let peerIdentifyAddress: UInt64 = 0x0000_58E2_8F7C_0BB3

        let command = HCILERemoveDeviceFromResolvingList(
            peerIdentifyAddressType: .random,
            peerIdentifyAddress: peerIdentifyAddress)

        #expect(HCILERemoveDeviceFromResolvingList.command == .removeDeviceFromResolvedList)
        #expect(command.peerIdentifyAddressType == .random)
        #expect(command.peerIdentifyAddress == peerIdentifyAddress)

        let expectedData = Data([0x01, 0xB3, 0x0B, 0x7C, 0x8F, 0xE2, 0x58, 0x00, 0x00])

        #expect(command.data == expectedData)

        // test controller request
        let hostController = TestHostController()

        hostController.queue.append(
            .command(
                HCILowEnergyCommand.removeDeviceFromResolvedList.opcode,
                [0x28, 0x20, 0x09] + [UInt8](expectedData))
        )

        hostController.queue.append(.event([0x0E, 0x04, 0x01, 0x28, 0x20, 0x00]))

        try await hostController.lowEnergyRemoveDeviceFromResolvingList(
            peerIdentifyAddressType: .random,
            peerIdentifyAddress: peerIdentifyAddress)

        #expect(hostController.queue.isEmpty)
    }

    @Test func clearResolvingList() async throws {

        let hostController = TestHostController()

        /// SEND  [2029] LE Clear Resolving List  29 20 00
        hostController.queue.append(
            .command(
                HCILowEnergyCommand.clearResolvedList.opcode,
                [0x29, 0x20, 0x00])
        )

        /// RECV  Command Complete [2029] - LE Clear Resolving List  0E 04 01 29 20 00
        hostController.queue.append(.event([0x0E, 0x04, 0x01, 0x29, 0x20, 0x00]))

        try await hostController.lowEnergyClearResolvingList()

        #expect(hostController.queue.isEmpty)
    }

    @Test func readResolvingListSize() async throws {

        // valid data
        #expect(HCILEReadResolvingListSize(data: Data([0x08]))?.resolvingListSize == 0x08)

        // invalid data
        #expect(HCILEReadResolvingListSize(data: Data()) == nil)
        #expect(HCILEReadResolvingListSize(data: Data([0x08, 0x00])) == nil)

        // test controller request
        let hostController = TestHostController()

        /// SEND  [202A] LE Read Resolving List Size  2A 20 00
        hostController.queue.append(
            .command(
                HCILowEnergyCommand.readResolvedListSize.opcode,
                [0x2A, 0x20, 0x00])
        )

        /// RECV  Command Complete [202A] - LE Read Resolving List Size  0E 05 01 2A 20 00 08
        hostController.queue.append(.event([0x0E, 0x05, 0x01, 0x2A, 0x20, 0x00, 0x08]))

        let resolvingListSize = try await hostController.lowEnergyReadResolvingListSize()

        #expect(hostController.queue.isEmpty)
        #expect(resolvingListSize == 0x08)
    }

    @Test func readPeerResolvableAddress() {

        let command = HCILEReadPeerResolvableAddress(
            peerIdentifyAddressType: .public,
            peerIdentifyAddress: 0x0000_58E2_8F7C_0BB3)

        #expect(HCILEReadPeerResolvableAddress.command == .readPeerResolvableAddress)
        #expect(command.data == Data([0x00, 0xB3, 0x0B, 0x7C, 0x8F, 0xE2, 0x58, 0x00, 0x00]))

        // return parameter (6-octet Peer_Resolvable_Address)
        guard let returnParameter = HCILEReadPeerResolvableAddressReturn(data: Data([0xB3, 0x0B, 0x7C, 0x8F, 0xE2, 0x58]))
        else {
            Issue.record("Could not decode return parameter")
            return
        }
        #expect(returnParameter.peerResolvableAddress == 0x0000_58E2_8F7C_0BB3)

        // invalid return parameter data
        #expect(HCILEReadPeerResolvableAddressReturn(data: Data()) == nil)
        #expect(HCILEReadPeerResolvableAddressReturn(data: Data([0xB3, 0x0B, 0x7C, 0x8F, 0xE2])) == nil)  // truncated
        #expect(HCILEReadPeerResolvableAddressReturn(data: Data([0xB3, 0x0B, 0x7C, 0x8F, 0xE2, 0x58, 0x00, 0x00])) == nil)  // oversized
    }

    @Test func readLocalResolvableAddress() {

        let command = HCILEReadLocalResolvableAddress(
            peerIdentifyAddressType: .random,
            peerIdentifyAddress: 0x0000_58E2_8F7C_0BB3)

        #expect(HCILEReadLocalResolvableAddress.command == .readLocalResolvableAddress)
        #expect(command.data == Data([0x01, 0xB3, 0x0B, 0x7C, 0x8F, 0xE2, 0x58, 0x00, 0x00]))

        // return parameter (6-octet Local_Resolvable_Address)
        guard let returnParameter = HCILEReadLocalResolvableAddressReturn(data: Data([0xB3, 0x0B, 0x7C, 0x8F, 0xE2, 0x58]))
        else {
            Issue.record("Could not decode return parameter")
            return
        }
        #expect(returnParameter.localResolvableAddress == 0x0000_58E2_8F7C_0BB3)

        // invalid return parameter data
        #expect(HCILEReadLocalResolvableAddressReturn(data: Data()) == nil)
        #expect(HCILEReadLocalResolvableAddressReturn(data: Data([0xB3, 0x0B, 0x7C, 0x8F, 0xE2])) == nil)  // truncated
        #expect(HCILEReadLocalResolvableAddressReturn(data: Data([0xB3, 0x0B, 0x7C, 0x8F, 0xE2, 0x58, 0x00, 0x00])) == nil)  // oversized
    }

    @Test func setAddressResolutionEnable() async throws {

        #expect(HCILESetAddressResolutionEnable.AddressResolutionEnable.disabled.rawValue == 0x00)
        #expect(HCILESetAddressResolutionEnable.AddressResolutionEnable.enabled.rawValue == 0x01)

        let command = HCILESetAddressResolutionEnable(addressResolutionEnable: .enabled)

        #expect(HCILESetAddressResolutionEnable.command == .setAddressResolutionEnable)
        #expect(command.data == Data([0x01]))
        #expect(HCILESetAddressResolutionEnable(addressResolutionEnable: .disabled).data == Data([0x00]))

        // test controller request
        let hostController = TestHostController()

        /// SEND  [202D] LE Set Address Resolution Enable  2D 20 01 01
        hostController.queue.append(
            .command(
                HCILowEnergyCommand.setAddressResolutionEnable.opcode,
                [0x2D, 0x20, 0x01, 0x01])
        )

        /// RECV  Command Complete [202D] - LE Set Address Resolution Enable  0E 04 01 2D 20 00
        hostController.queue.append(.event([0x0E, 0x04, 0x01, 0x2D, 0x20, 0x00]))

        try await hostController.lowEnergySetAddressResolutionEnable(addressResolutionEnable: .enabled)

        #expect(hostController.queue.isEmpty)
    }

    @Test func setResolvablePrivateAddressTimeout() async throws {

        typealias RPATimeout = HCILESetResolvablePrivateAddressTimeout.RPATimeout

        // bounds
        #expect(RPATimeout(rawValue: 0x0000) == nil)
        #expect(RPATimeout(rawValue: 0xA1B9) == nil)
        #expect(RPATimeout(rawValue: 0x0001)?.rawValue == RPATimeout.min.rawValue)
        #expect(RPATimeout(rawValue: 0xA1B8)?.rawValue == RPATimeout.max.rawValue)
        #expect(RPATimeout.min < RPATimeout.max)
        #expect(RPATimeout.max > RPATimeout.min)

        // default value (900 seconds)
        let command = HCILESetResolvablePrivateAddressTimeout()
        #expect(HCILESetResolvablePrivateAddressTimeout.command == .setResolvablePrivateAddressTimeout)
        #expect(command.rpaTimeout.rawValue == 0x0384)
        #expect(command.data == Data([0x84, 0x03]))

        // test controller request
        let hostController = TestHostController()

        /// SEND  [202E] LE Set Resolvable Private Address Timeout  2E 20 02 84 03
        hostController.queue.append(
            .command(
                HCILowEnergyCommand.setResolvablePrivateAddressTimeout.opcode,
                [0x2E, 0x20, 0x02, 0x84, 0x03])
        )

        /// RECV  Command Complete [202E] - LE Set Resolvable Private Address Timeout  0E 04 01 2E 20 00
        hostController.queue.append(.event([0x0E, 0x04, 0x01, 0x2E, 0x20, 0x00]))

        try await hostController.lowEnergySetResolvablePrivateAddressTimeout(rpaTimeout: HCILESetResolvablePrivateAddressTimeout.defaultRpaTimeout)

        #expect(hostController.queue.isEmpty)
    }

    @Test func setPrivacyMode() async throws {

        #expect(HCILESetPrivacyMode.PrivacyMode.networkPrivacy.rawValue == 0x00)
        #expect(HCILESetPrivacyMode.PrivacyMode.devicePrivacy.rawValue == 0x01)

        let address = BluetoothAddress(rawValue: "58:E2:8F:7C:0B:B3")!

        let command = HCILESetPrivacyMode(
            peerIdentityAddressType: .public,
            peerIdentityAddress: address,
            privacyMode: .devicePrivacy)

        #expect(HCILESetPrivacyMode.command == .setPrivacyMode)
        #expect(command.data == Data([0x00, 0xB3, 0x0B, 0x7C, 0x8F, 0xE2, 0x58, 0x01]))

        // default privacy mode
        let defaultCommand = HCILESetPrivacyMode(
            peerIdentityAddressType: .public,
            peerIdentityAddress: address)

        #expect(defaultCommand.privacyMode == .networkPrivacy)
        #expect(defaultCommand.data == Data([0x00, 0xB3, 0x0B, 0x7C, 0x8F, 0xE2, 0x58, 0x00]))

        // test controller request
        let hostController = TestHostController()

        /// SEND  [204E] LE Set Privacy Mode  4E 20 08 00 B3 0B 7C 8F E2 58 01
        hostController.queue.append(
            .command(
                HCILowEnergyCommand.setPrivacyMode.opcode,
                [0x4E, 0x20, 0x08, 0x00, 0xB3, 0x0B, 0x7C, 0x8F, 0xE2, 0x58, 0x01])
        )

        /// RECV  Command Complete [204E] - LE Set Privacy Mode  0E 04 01 4E 20 00
        hostController.queue.append(.event([0x0E, 0x04, 0x01, 0x4E, 0x20, 0x00]))

        try await hostController.lowEnergySetPrivacyMode(
            peerIdentityAddressType: .public,
            peerIdentityAddress: address,
            privacyMode: .devicePrivacy)

        #expect(hostController.queue.isEmpty)
    }

    // MARK: - White List

    @Test func clearWhiteList() async throws {

        let hostController = TestHostController()

        /// SEND  [2010] LE Clear White List  10 20 00
        hostController.queue.append(
            .command(
                HCILowEnergyCommand.clearWhiteList.opcode,
                [0x10, 0x20, 0x00])
        )

        /// RECV  Command Complete [2010] - LE Clear White List  0E 04 01 10 20 00
        hostController.queue.append(.event([0x0E, 0x04, 0x01, 0x10, 0x20, 0x00]))

        try await hostController.lowEnergyClearWhiteList()

        #expect(hostController.queue.isEmpty)
    }

    @Test func readWhiteListSize() async throws {

        // valid data
        #expect(HCILEReadWhiteListSize(data: Data([0x19]))?.size == 25)

        // invalid data
        #expect(HCILEReadWhiteListSize(data: Data()) == nil)
        #expect(HCILEReadWhiteListSize(data: Data([0x19, 0x00])) == nil)

        // test controller request
        let hostController = TestHostController()

        /// SEND  [200F] LE Read White List Size  0F 20 00
        hostController.queue.append(
            .command(
                HCILowEnergyCommand.readWhiteListSize.opcode,
                [0x0F, 0x20, 0x00])
        )

        /// RECV  Command Complete [200F] - LE Read White List Size  0E 05 01 0F 20 00 19
        hostController.queue.append(.event([0x0E, 0x05, 0x01, 0x0F, 0x20, 0x00, 0x19]))

        let whiteListSize = try await hostController.lowEnergyReadWhiteListSize()

        #expect(hostController.queue.isEmpty)
        #expect(whiteListSize == 25)
    }

    // MARK: - Test Mode

    @Test func receiverTest() async throws {

        let rxChannel = LowEnergyRxChannel(rawValue: 0x27)!

        let command = HCILEReceiverTest(rxChannel: rxChannel)

        #expect(HCILEReceiverTest.command == .receiverTest)
        #expect(command.rxChannel == rxChannel)
        #expect(command.data == Data([0x27]))

        // test controller request
        let hostController = TestHostController()

        /// SEND  [201D] LE Receiver Test  1D 20 01 27
        hostController.queue.append(
            .command(
                HCILowEnergyCommand.receiverTest.opcode,
                [0x1D, 0x20, 0x01, 0x27])
        )

        /// RECV  Command Complete [201D] - LE Receiver Test  0E 04 01 1D 20 00
        hostController.queue.append(.event([0x0E, 0x04, 0x01, 0x1D, 0x20, 0x00]))

        try await hostController.lowEnergyReceiverTest(rxChannel: rxChannel)

        #expect(hostController.queue.isEmpty)
    }

    @Test func transmitterTest() {

        let txChannel = LowEnergyTxChannel(rawValue: 0x01)!

        let command = HCILETransmitterTest(
            txChannel: txChannel,
            lengthOfTestData: 0x25,
            packetPayload: .repeated11110000)

        #expect(HCILETransmitterTest.command == .transmitterTest)
        #expect(command.txChannel == txChannel)
        #expect(command.lengthOfTestData == 0x25)
        #expect(command.packetPayload == .repeated11110000)

        // Tx_Channel, Length_Of_Test_Data, Packet_Payload
        #expect(command.data == Data([0x01, 0x25, 0x01]))
    }

    @Test func enhancedReceiverTest() async throws {

        #expect(HCILEEnhancedReceiverTest.Phy.le1MPhy.rawValue == 0x01)
        #expect(HCILEEnhancedReceiverTest.Phy.le2MPhy.rawValue == 0x02)
        #expect(HCILEEnhancedReceiverTest.Phy.leCodedPhy.rawValue == 0x03)
        #expect(HCILEEnhancedReceiverTest.ModulationIndex.standard.rawValue == 0x00)
        #expect(HCILEEnhancedReceiverTest.ModulationIndex.stable.rawValue == 0x01)

        let rxChannel = LowEnergyRxChannel(rawValue: 0x00)!

        let command = HCILEEnhancedReceiverTest(
            rxChannel: rxChannel,
            phy: .le2MPhy,
            modulationIndex: .stable)

        #expect(HCILEEnhancedReceiverTest.command == .enhancedReceiverTest)
        #expect(command.data == Data([0x00, 0x02, 0x01]))

        // test controller request
        let hostController = TestHostController()

        /// SEND  [2033] LE Enhanced Receiver Test  33 20 03 00 02 01
        hostController.queue.append(
            .command(
                HCILowEnergyCommand.enhancedReceiverTest.opcode,
                [0x33, 0x20, 0x03, 0x00, 0x02, 0x01])
        )

        /// RECV  Command Complete [2033] - LE Enhanced Receiver Test  0E 04 01 33 20 00
        hostController.queue.append(.event([0x0E, 0x04, 0x01, 0x33, 0x20, 0x00]))

        try await hostController.lowEnergyEnhancedReceiverTest(
            rxChannel: rxChannel,
            phy: .le2MPhy,
            modulationIndex: .stable)

        #expect(hostController.queue.isEmpty)
    }

    @Test func enhancedTransmitterTest() async throws {

        #expect(HCILEEnhancedTransmitterTest.Phy.le1MPhy.rawValue == 0x01)
        #expect(HCILEEnhancedTransmitterTest.Phy.le2MPhy.rawValue == 0x02)
        #expect(HCILEEnhancedTransmitterTest.Phy.leCodedPhywithS8.rawValue == 0x03)
        #expect(HCILEEnhancedTransmitterTest.Phy.leCodedPhywithS2.rawValue == 0x04)

        let txChannel = LowEnergyTxChannel(rawValue: 0x27)!

        let command = HCILEEnhancedTransmitterTest(
            txChannel: txChannel,
            lengthOfTestData: 0x25,
            packetPayload: .repeated10101010,
            phy: .leCodedPhywithS8)

        #expect(HCILEEnhancedTransmitterTest.command == .enhancedTransmitterTest)
        #expect(command.data == Data([0x27, 0x25, 0x02, 0x03]))

        // test controller request
        let hostController = TestHostController()

        /// SEND  [2034] LE Enhanced Transmitter Test  34 20 04 27 25 02 03
        hostController.queue.append(
            .command(
                HCILowEnergyCommand.enhancedTransmitterTest.opcode,
                [0x34, 0x20, 0x04, 0x27, 0x25, 0x02, 0x03])
        )

        /// RECV  Command Complete [2034] - LE Enhanced Transmitter Test  0E 04 01 34 20 00
        hostController.queue.append(.event([0x0E, 0x04, 0x01, 0x34, 0x20, 0x00]))

        try await hostController.lowEnergyEnhancedTransmitterTest(
            txChannel: txChannel,
            lengthOfTestData: 0x25,
            packetPayload: .repeated10101010,
            phy: .leCodedPhywithS8)

        #expect(hostController.queue.isEmpty)
    }

    @Test func testEnd() async throws {

        // valid data
        #expect(HCILETestEnd(data: Data([0x2C, 0x01]))?.numberOfPackets == 0x012C)

        // invalid data
        #expect(HCILETestEnd(data: Data()) == nil)
        #expect(HCILETestEnd(data: Data([0x2C])) == nil)
        #expect(HCILETestEnd(data: Data([0x2C, 0x01, 0x00])) == nil)

        // test controller request
        let hostController = TestHostController()

        /// SEND  [201F] LE Test End  1F 20 00
        hostController.queue.append(
            .command(
                HCILowEnergyCommand.testEnd.opcode,
                [0x1F, 0x20, 0x00])
        )

        /// RECV  Command Complete [201F] - LE Test End  0E 06 01 1F 20 00 2C 01
        hostController.queue.append(.event([0x0E, 0x06, 0x01, 0x1F, 0x20, 0x00, 0x2C, 0x01]))

        let numberOfPackets = try await hostController.lowEnergyTestEnd()

        #expect(hostController.queue.isEmpty)
        #expect(numberOfPackets == 0x012C)
    }

    // MARK: - Encryption / Keys

    @Test func random() async throws {

        // valid data
        let randomData = Data([0xEF, 0xCD, 0xAB, 0x89, 0x67, 0x45, 0x23, 0x01])
        #expect(HCILERandom(data: randomData)?.randomNumber == 0x0123_4567_89AB_CDEF)

        // invalid data
        #expect(HCILERandom(data: Data()) == nil)
        #expect(HCILERandom(data: Data([0xEF, 0xCD, 0xAB, 0x89, 0x67, 0x45, 0x23])) == nil)

        // test controller request
        let hostController = TestHostController()

        /// SEND  [2018] LE Rand  18 20 00
        hostController.queue.append(
            .command(
                HCILowEnergyCommand.random.opcode,
                [0x18, 0x20, 0x00])
        )

        /// RECV  Command Complete [2018] - LE Rand  0E 0C 01 18 20 00 EF CD AB 89 67 45 23 01
        hostController.queue.append(.event([0x0E, 0x0C, 0x01, 0x18, 0x20, 0x00, 0xEF, 0xCD, 0xAB, 0x89, 0x67, 0x45, 0x23, 0x01]))

        let randomNumber = try await hostController.lowEnergyRandom()

        #expect(hostController.queue.isEmpty)
        #expect(randomNumber == 0x0123_4567_89AB_CDEF)
    }

    @Test func generateDHKey() {

        let remoteP256PublicKey: UInt512 = 0x1234_5678_9ABC_DEF0

        let command = HCILEGenerateDHKey(remoteP256PublicKey: remoteP256PublicKey)

        #expect(HCILEGenerateDHKey.command == .generateDHKeyCommand)
        #expect(command.remoteP256PublicKey == remoteP256PublicKey)

        // Remote_P-256_Public_Key: 64 octets, little endian
        let encoded = command.data
        #expect(encoded.count == 64)
        #expect(encoded.prefix(8) == Data([0xF0, 0xDE, 0xBC, 0x9A, 0x78, 0x56, 0x34, 0x12]))
        #expect(encoded.suffix(56) == Data(repeating: 0x00, count: 56))
    }

    @Test func generateDHKeyComplete() {

        let keyBytes: [UInt8] = (0x01...0x20).map { UInt8($0) }

        // valid data
        let data = Data([0x00] + keyBytes)

        let event = HCILEGenerateDHKeyComplete(data: data)

        let expectedKey = UInt256(littleEndian: UInt256(bytes: (0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F, 0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17, 0x18, 0x19, 0x1A, 0x1B, 0x1C, 0x1D, 0x1E, 0x1F, 0x20)))

        #expect(event?.status == .success)
        #expect(event?.dhKey == expectedKey)

        // invalid status byte
        #expect(HCILEGenerateDHKeyComplete(data: Data([0xFF] + keyBytes)) == nil)

        // invalid length
        #expect(HCILEGenerateDHKeyComplete(data: Data()) == nil)
        #expect(HCILEGenerateDHKeyComplete(data: Data(keyBytes)) == nil)
        #expect(HCILEGenerateDHKeyComplete(data: Data([0x00] + keyBytes + [0x00])) == nil)
    }

    @Test func readLocalP256PublicKeyComplete() {

        let keyBytes: [UInt8] = (0x01...0x40).map { UInt8($0) }

        // valid data
        let data = Data([0x00] + keyBytes)

        let event = HCILEReadLocalP256PublicKeyComplete(data: data)

        let expectedKey = UInt512(littleEndian: UInt512(bytes: (0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F, 0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17, 0x18, 0x19, 0x1A, 0x1B, 0x1C, 0x1D, 0x1E, 0x1F, 0x20, 0x21, 0x22, 0x23, 0x24, 0x25, 0x26, 0x27, 0x28, 0x29, 0x2A, 0x2B, 0x2C, 0x2D, 0x2E, 0x2F, 0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39, 0x3A, 0x3B, 0x3C, 0x3D, 0x3E, 0x3F, 0x40)))

        #expect(event?.status == .success)
        #expect(event?.localP256PublicKey == expectedKey)

        // invalid status byte
        #expect(HCILEReadLocalP256PublicKeyComplete(data: Data([0xFF] + keyBytes)) == nil)

        // invalid length
        #expect(HCILEReadLocalP256PublicKeyComplete(data: Data()) == nil)
        #expect(HCILEReadLocalP256PublicKeyComplete(data: Data(keyBytes)) == nil)
    }

    // MARK: - Controller Information

    @Test func readSupportedStates() async throws {

        // valid data
        let data = Data([0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00])
        #expect(HCILEReadSupportedStates(data: data)?.state == .state0)

        // invalid state bitmask
        #expect(HCILEReadSupportedStates(data: Data([0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00])) == nil)

        // invalid length
        #expect(HCILEReadSupportedStates(data: Data()) == nil)
        #expect(HCILEReadSupportedStates(data: Data([0x01])) == nil)

        // test controller request
        let hostController = TestHostController()

        /// SEND  [201C] LE Read Supported States  1C 20 00
        hostController.queue.append(
            .command(
                HCILowEnergyCommand.readSupportedStates.opcode,
                [0x1C, 0x20, 0x00])
        )

        /// RECV  Command Complete [201C] - LE Read Supported States  0E 0C 01 1C 20 00 01 00 00 00 00 00 00 00
        hostController.queue.append(.event([0x0E, 0x0C, 0x01, 0x1C, 0x20, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]))

        let state = try await hostController.readSupportedStates()

        #expect(hostController.queue.isEmpty)
        #expect(state == .state0)
    }

    @Test func readTransmitPower() async throws {

        typealias TxPower = HCILEReadTransmitPower.TxPower

        // bounds
        #expect(TxPower(rawValue: -128) == nil)
        #expect(TxPower(rawValue: 127) == nil)
        #expect(TxPower(rawValue: -127)?.rawValue == TxPower.min.rawValue)
        #expect(TxPower(rawValue: 126)?.rawValue == TxPower.max.rawValue)
        #expect(TxPower.min < TxPower.max)
        #expect(TxPower.max > TxPower.min)

        // valid data (min: -100 dBm, max: 4 dBm)
        let returnParameter = HCILEReadTransmitPower(data: Data([0x9C, 0x04]))
        #expect(returnParameter?.minTxPower.rawValue == -100)
        #expect(returnParameter?.maxTxPower.rawValue == 4)

        // out of range Tx power
        #expect(HCILEReadTransmitPower(data: Data([0x80, 0x04])) == nil)
        #expect(HCILEReadTransmitPower(data: Data([0x9C, 0x7F])) == nil)

        // invalid length
        #expect(HCILEReadTransmitPower(data: Data()) == nil)
        #expect(HCILEReadTransmitPower(data: Data([0x9C])) == nil)

        // test controller request
        let hostController = TestHostController()

        /// SEND  [204B] LE Read Transmit Power  4B 20 00
        hostController.queue.append(
            .command(
                HCILowEnergyCommand.readTransmitPower.opcode,
                [0x4B, 0x20, 0x00])
        )

        /// RECV  Command Complete [204B] - LE Read Transmit Power  0E 06 01 4B 20 00 9C 04
        hostController.queue.append(.event([0x0E, 0x06, 0x01, 0x4B, 0x20, 0x00, 0x9C, 0x04]))

        let transmitPower = try await hostController.lowEnergyReadTransmitPower()

        #expect(hostController.queue.isEmpty)
        #expect(transmitPower.minTxPower.rawValue == -100)
        #expect(transmitPower.maxTxPower.rawValue == 4)
    }

    // MARK: - RF Path Compensation

    @Test func readRfPathCompensation() async throws {

        // valid data (Tx: 10.0 dB, Rx: -10.0 dB)
        let returnParameter = HCILEReadRfPathCompensation(data: Data([0x64, 0x00, 0x9C, 0xFF]))
        #expect(returnParameter?.rfTxPathCompensationValue.rawValue == 100)
        #expect(returnParameter?.rfRxPathCompensationValue.rawValue == -100)

        // out of range compensation value
        #expect(HCILEReadRfPathCompensation(data: Data([0x00, 0x05, 0x00, 0x00])) == nil)
        #expect(HCILEReadRfPathCompensation(data: Data([0x00, 0x00, 0x00, 0x05])) == nil)

        // invalid length
        #expect(HCILEReadRfPathCompensation(data: Data()) == nil)
        #expect(HCILEReadRfPathCompensation(data: Data([0x64, 0x00])) == nil)

        // test controller request
        let hostController = TestHostController()

        /// SEND  [204C] LE Read RF Path Compensation  4C 20 00
        hostController.queue.append(
            .command(
                HCILowEnergyCommand.readRFPathCompensation.opcode,
                [0x4C, 0x20, 0x00])
        )

        /// RECV  Command Complete [204C] - LE Read RF Path Compensation  0E 08 01 4C 20 00 64 00 9C FF
        hostController.queue.append(.event([0x0E, 0x08, 0x01, 0x4C, 0x20, 0x00, 0x64, 0x00, 0x9C, 0xFF]))

        let rfPathCompensation = try await hostController.lowEnergyReadRfPathCompensation()

        #expect(hostController.queue.isEmpty)
        #expect(rfPathCompensation.rfTxPathCompensationValue.rawValue == 100)
        #expect(rfPathCompensation.rfRxPathCompensationValue.rawValue == -100)
    }

    @Test func writeRfPathCompensation() async throws {

        let txValue = LowEnergyRfTxPathCompensationValue(rawValue: -128)!
        let rxValue = LowEnergyRfTxPathCompensationValue(rawValue: 128)!

        let command = HCILEWriteRfPathCompensation(
            rfTxPathCompensationValue: txValue,
            rfRxPathCompensationValue: rxValue)

        #expect(HCILEWriteRfPathCompensation.command == .writeRFPathCompensation)
        #expect(command.data == Data([0x80, 0xFF, 0x80, 0x00]))

        // test controller request
        let hostController = TestHostController()

        /// SEND  [204D] LE Write RF Path Compensation  4D 20 04 80 FF 80 00
        hostController.queue.append(
            .command(
                HCILowEnergyCommand.writeRFPathCompensation.opcode,
                [0x4D, 0x20, 0x04, 0x80, 0xFF, 0x80, 0x00])
        )

        /// RECV  Command Complete [204D] - LE Write RF Path Compensation  0E 04 01 4D 20 00
        hostController.queue.append(.event([0x0E, 0x04, 0x01, 0x4D, 0x20, 0x00]))

        try await hostController.lowEnergyWriteRfPathCompensation(
            rfTxPathCompensationValue: txValue,
            rfRxPathCompensationValue: rxValue)

        #expect(hostController.queue.isEmpty)
    }

    @Test func rfTxPathCompensationValue() {

        typealias Value = LowEnergyRfTxPathCompensationValue

        #expect(Value(rawValue: -129) == nil)
        #expect(Value(rawValue: 129) == nil)
        #expect(Value(rawValue: -128) == Value.min)
        #expect(Value(rawValue: 128) == Value.max)
        #expect(Value(rawValue: 0) != nil)
        #expect(Value.min < Value.max)
        #expect(Value.min.rawValue == -128)
        #expect(Value.max.rawValue == 128)
    }

    @Test func rfRxPathCompensationValue() {

        typealias Value = LowEnergyRfRxPathCompensationValue

        #expect(Value(rawValue: -129) == nil)
        #expect(Value(rawValue: 129) == nil)
        #expect(Value(rawValue: -128) == Value.min)
        #expect(Value(rawValue: 128) == Value.max)
        #expect(Value(rawValue: 0) != nil)
        #expect(Value.min < Value.max)
        #expect(Value.min.rawValue == -128)
        #expect(Value.max.rawValue == 128)
    }

    // MARK: - Unit Types

    @Test func clockAccuracy() {

        let expectedValues: [(LowEnergyClockAccuracy, UInt8, UInt)] = [
            (.ppm500, 0x00, 500),
            (.ppm250, 0x01, 250),
            (.ppm150, 0x02, 150),
            (.ppm100, 0x03, 100),
            (.ppm75, 0x04, 75),
            (.ppm50, 0x05, 50),
            (.ppm30, 0x06, 30),
            (.ppm20, 0x07, 20)
        ]

        for (clockAccuracy, rawValue, ppm) in expectedValues {

            #expect(clockAccuracy.rawValue == rawValue)
            #expect(clockAccuracy.ppm == ppm)
            #expect(LowEnergyClockAccuracy(rawValue: rawValue) == clockAccuracy)
        }

        // invalid raw value
        #expect(LowEnergyClockAccuracy(rawValue: 0x08) == nil)
    }

    @Test func rxChannel() {

        #expect(LowEnergyRxChannel(rawValue: 0x00) == LowEnergyRxChannel.min)
        #expect(LowEnergyRxChannel(rawValue: 0x27) == LowEnergyRxChannel.max)
        #expect(LowEnergyRxChannel(rawValue: 0x28) == nil)
        #expect(LowEnergyRxChannel(rawValue: 0xFF) == nil)
        #expect(LowEnergyRxChannel.min < LowEnergyRxChannel.max)
        #expect(LowEnergyRxChannel.min.rawValue == 0x00)
        #expect(LowEnergyRxChannel.max.rawValue == 0x27)
    }

    @Test func txChannel() {

        #expect(LowEnergyTxChannel(rawValue: 0x00) == LowEnergyTxChannel.min)
        #expect(LowEnergyTxChannel(rawValue: 0x27) == LowEnergyTxChannel.max)
        #expect(LowEnergyTxChannel(rawValue: 0x28) == nil)
        #expect(LowEnergyTxChannel(rawValue: 0xFF) == nil)
        #expect(LowEnergyTxChannel.min < LowEnergyTxChannel.max)
        #expect(LowEnergyTxChannel.min.rawValue == 0x00)
        #expect(LowEnergyTxChannel.max.rawValue == 0x27)
    }

    @Test func vendorCommand() {

        let command = VendorCommand(rawValue: 0x0142)

        #expect(VendorCommand.opcodeGroupField == .vendor)
        #expect(command.rawValue == 0x0142)
        #expect(command == VendorCommand(rawValue: 0x0142))
        #expect(command != VendorCommand(rawValue: 0x0143))

        // default name is hexadecimal representation
        #expect(command.name == "0142")

        // registered name
        let namedCommand = VendorCommand(rawValue: 0xFEDC)
        VendorCommand.names[namedCommand] = "Test Vendor Command"
        #expect(namedCommand.name == "Test Vendor Command")
        VendorCommand.names[namedCommand] = nil
    }
}
#endif
