//
//  HCILEAdvertisingTests.swift
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

@Suite struct HCILEAdvertisingTests {

    // MARK: - Commands

    @Test func addDeviceToPeriodicAdvertiserList() async throws {

        let parameters = HCILEAddDeviceToPeriodicAdvertiserList(
            advertiserAddressType: .public,
            address: BluetoothAddress(rawValue: "54:39:A3:47:D8:77")!,
            advertisingSid: 0x05)

        #expect(HCILEAddDeviceToPeriodicAdvertiserList.command.rawValue == 0x0047)
        #expect(parameters.advertiserAddressType == .public)
        #expect(parameters.advertisingSid == 0x05)
        #expect(
            Data(parameters)
                == Data([
                    0x00,  // Advertiser_Address_Type
                    0x77, 0xD8, 0x47, 0xA3, 0x39, 0x54,  // Advertiser_Address
                    0x05  // Advertising_SID
                ]))

        // mock host controller round trip
        let hostController = TestHostController()

        hostController.queue.append(
            .command(
                HCILowEnergyCommand.addDeviceToPeriodicAdvertiserList.opcode,
                [0x47, 0x20, 0x08, 0x00, 0x77, 0xD8, 0x47, 0xA3, 0x39, 0x54, 0x05])
        )

        hostController.queue.append(.event([0x0E, 0x04, 0x01, 0x47, 0x20, 0x00]))

        try await hostController.addDeviceToPeriodicAdvertiserList(
            advertiserAddressType: .public,
            address: BluetoothAddress(rawValue: "54:39:A3:47:D8:77")!,
            advertisingSid: 0x05)

        #expect(hostController.queue.isEmpty)
    }

    @Test func removeDeviceFromPeriodicAdvertiserList() async throws {

        let parameters = HCILERemoveDeviceToPeriodicAdvertiserList(
            advertiserAddressType: .random,
            address: BluetoothAddress(rawValue: "54:39:A3:47:D8:77")!,
            advertisingSID: 0x05)

        #expect(HCILERemoveDeviceToPeriodicAdvertiserList.command.rawValue == 0x0048)
        #expect(parameters.advertiserAddressType == .random)
        #expect(parameters.advertisingSID == 0x05)
        #expect(
            Data(parameters)
                == Data([
                    0x01,  // Advertiser_Address_Type
                    0x77, 0xD8, 0x47, 0xA3, 0x39, 0x54,  // Advertiser_Address
                    0x05  // Advertising_SID
                ]))

        // mock host controller round trip
        let hostController = TestHostController()

        hostController.queue.append(
            .command(
                HCILowEnergyCommand.removeDeviceFromPeriodicAdvertiserList.opcode,
                [0x48, 0x20, 0x08, 0x01, 0x77, 0xD8, 0x47, 0xA3, 0x39, 0x54, 0x05])
        )

        hostController.queue.append(.event([0x0E, 0x04, 0x01, 0x48, 0x20, 0x00]))

        try await hostController.lowEnergyRemoveDeviceToPeriodicAdvertiserList(
            advertiserAddressType: .random,
            address: BluetoothAddress(rawValue: "54:39:A3:47:D8:77")!,
            advertisingSID: 0x05)

        #expect(hostController.queue.isEmpty)
    }

    @Test func periodicAdvertisingTerminateSync() async throws {

        let parameters = HCILEPeriodicAdvertisingTerminateSync(syncHandle: 0x0002)

        #expect(HCILEPeriodicAdvertisingTerminateSync.command.rawValue == 0x0046)
        #expect(parameters.syncHandle == 0x0002)
        #expect(Data(parameters) == Data([0x02, 0x00]))

        // mock host controller round trip
        let hostController = TestHostController()

        hostController.queue.append(
            .command(
                HCILowEnergyCommand.periodicAdvertisingTerminateSync.opcode,
                [0x46, 0x20, 0x02, 0x02, 0x00])
        )

        hostController.queue.append(.event([0x0E, 0x04, 0x01, 0x46, 0x20, 0x00]))

        try await hostController.setPeriodicAdvertisingTerminateSync(syncHandle: 0x0002)

        #expect(hostController.queue.isEmpty)
    }

    @Test func removeAdvertisingSet() async throws {

        let parameters = HCILERemoveAdvertisingSet(advertisingHandle: 0x01)

        #expect(HCILERemoveAdvertisingSet.command.rawValue == 0x003C)
        #expect(parameters.advertisingHandle == 0x01)
        #expect(Data(parameters) == Data([0x01]))

        // mock host controller round trip
        let hostController = TestHostController()

        hostController.queue.append(
            .command(
                HCILowEnergyCommand.removeAdvertisingSet.opcode,
                [0x3C, 0x20, 0x01, 0x01])
        )

        hostController.queue.append(.event([0x0E, 0x04, 0x01, 0x3C, 0x20, 0x00]))

        try await hostController.setLowEnergyRemoveAdvertisingSet(advertisingHandle: 0x01)

        #expect(hostController.queue.isEmpty)
    }

    @Test func setAdvertisingSetRandomAddress() async throws {

        let parameters = HCILESetAdvertisingSetRandomAddress(
            advertisingHandle: 0x01,
            advertisingRandomAddress: BluetoothAddress(rawValue: "54:39:A3:47:D8:77")!)

        #expect(HCILESetAdvertisingSetRandomAddress.command.rawValue == 0x0035)
        #expect(parameters.advertisingHandle == 0x01)
        #expect(
            Data(parameters)
                == Data([
                    0x01,  // Advertising_Handle
                    0x77, 0xD8, 0x47, 0xA3, 0x39, 0x54  // Random_Address
                ]))

        // mock host controller round trip
        let hostController = TestHostController()

        hostController.queue.append(
            .command(
                HCILowEnergyCommand.setAdvertisingSetRandomAddress.opcode,
                [0x35, 0x20, 0x07, 0x01, 0x77, 0xD8, 0x47, 0xA3, 0x39, 0x54])
        )

        hostController.queue.append(.event([0x0E, 0x04, 0x01, 0x35, 0x20, 0x00]))

        try await hostController.setAdvertisingSetRandomAddress(
            advertisingHandle: 0x01,
            advertisingRandomAddress: BluetoothAddress(rawValue: "54:39:A3:47:D8:77")!)

        #expect(hostController.queue.isEmpty)
    }

    @Test func setExtendedAdvertisingData() async throws {

        let parameters = HCILESetExtendedAdvertisingData(
            advertisingHandle: 0x01,
            operation: .completeExtended,
            fragmentPreference: .shouldNotFragmentHostAdvertisingData,
            advertisingData: [0x02, 0x01, 0x06])

        #expect(HCILESetExtendedAdvertisingData.command.rawValue == 0x0037)
        #expect(
            Data(parameters)
                == Data([
                    0x01,  // Advertising_Handle
                    0x03,  // Operation
                    0x01,  // Fragment_Preference
                    0x03,  // Advertising_Data_Length
                    0x02, 0x01, 0x06  // Advertising_Data
                ]))

        // Operation
        #expect(HCILESetExtendedAdvertisingData.Operation.intermediateFragment.rawValue == 0x00)
        #expect(HCILESetExtendedAdvertisingData.Operation.firstFragment.rawValue == 0x01)
        #expect(HCILESetExtendedAdvertisingData.Operation.lastFragment.rawValue == 0x02)
        #expect(HCILESetExtendedAdvertisingData.Operation.completeExtended.rawValue == 0x03)
        #expect(HCILESetExtendedAdvertisingData.Operation.unchangedData.rawValue == 0x04)
        #expect(HCILESetExtendedAdvertisingData.Operation(rawValue: 0x05) == nil)

        // mock host controller round trip
        let hostController = TestHostController()

        hostController.queue.append(
            .command(
                HCILowEnergyCommand.setExtendedAdvertisingData.opcode,
                [0x37, 0x20, 0x07, 0x01, 0x03, 0x01, 0x03, 0x02, 0x01, 0x06])
        )

        hostController.queue.append(.event([0x0E, 0x04, 0x01, 0x37, 0x20, 0x00]))

        try await hostController.setExtendedAdvertisingData(
            advertisingHandle: 0x01,
            operation: .completeExtended,
            fragmentPreference: .shouldNotFragmentHostAdvertisingData,
            advertisingData: [0x02, 0x01, 0x06])

        #expect(hostController.queue.isEmpty)
    }

    @Test func setExtendedScanResponseData() async throws {

        let parameters = HCILESetExtendedScanResponseData(
            advertisingHandle: 0x01,
            operation: .complete,
            fragmentPreference: .fragmentAllHostAdvertisingData,
            scanResponseData: [0x02, 0x01, 0x06])

        #expect(HCILESetExtendedScanResponseData.command.rawValue == 0x0038)
        #expect(
            Data(parameters)
                == Data([
                    0x01,  // Advertising_Handle
                    0x03,  // Operation
                    0x00,  // Fragment_Preference
                    0x03,  // Scan_Response_Data_Length
                    0x02, 0x01, 0x06  // Scan_Response_Data
                ]))

        // Operation
        #expect(HCILESetExtendedScanResponseData.Operation.intermediateFragment.rawValue == 0x00)
        #expect(HCILESetExtendedScanResponseData.Operation.firstFragment.rawValue == 0x01)
        #expect(HCILESetExtendedScanResponseData.Operation.lastFragment.rawValue == 0x02)
        #expect(HCILESetExtendedScanResponseData.Operation.complete.rawValue == 0x03)
        #expect(HCILESetExtendedScanResponseData.Operation(rawValue: 0x04) == nil)

        // mock host controller round trip
        let hostController = TestHostController()

        hostController.queue.append(
            .command(
                HCILowEnergyCommand.setExtendedScanResponseData.opcode,
                [0x38, 0x20, 0x07, 0x01, 0x03, 0x00, 0x03, 0x02, 0x01, 0x06])
        )

        hostController.queue.append(.event([0x0E, 0x04, 0x01, 0x38, 0x20, 0x00]))

        try await hostController.setLowEnergyExtendedScanResponseData(
            advertisingHandle: 0x01,
            operation: .complete,
            fragmentPreference: .fragmentAllHostAdvertisingData,
            scanResponseData: [0x02, 0x01, 0x06])

        #expect(hostController.queue.isEmpty)
    }

    @Test func setPeriodicAdvertisingData() async throws {

        let parameters = HCILESetPeriodicAdvertisingData(
            advertisingHandle: 0x01,
            operation: .complete,
            advertisingData: [0x02, 0x01, 0x06])

        #expect(HCILESetPeriodicAdvertisingData.command.rawValue == 0x003F)
        #expect(
            Data(parameters)
                == Data([
                    0x01,  // Advertising_Handle
                    0x03,  // Operation
                    0x03,  // Advertising_Data_Length
                    0x02, 0x01, 0x06  // Advertising_Data
                ]))

        // Operation
        #expect(HCILESetPeriodicAdvertisingData.Operation.intermediateFragment.rawValue == 0x00)
        #expect(HCILESetPeriodicAdvertisingData.Operation.firstFragment.rawValue == 0x01)
        #expect(HCILESetPeriodicAdvertisingData.Operation.lastFragment.rawValue == 0x02)
        #expect(HCILESetPeriodicAdvertisingData.Operation.complete.rawValue == 0x03)
        #expect(HCILESetPeriodicAdvertisingData.Operation(rawValue: 0x04) == nil)

        // mock host controller round trip
        let hostController = TestHostController()

        hostController.queue.append(
            .command(
                HCILowEnergyCommand.setPeriodicAdvertisingData.opcode,
                [0x3F, 0x20, 0x06, 0x01, 0x03, 0x03, 0x02, 0x01, 0x06])
        )

        hostController.queue.append(.event([0x0E, 0x04, 0x01, 0x3F, 0x20, 0x00]))

        try await hostController.setSetPeriodicAdvertisingData(
            advertisingHandle: 0x01,
            operation: .complete,
            advertisingData: [0x02, 0x01, 0x06])

        #expect(hostController.queue.isEmpty)
    }

    @Test func setPeriodicAdvertisingEnable() async throws {

        let parameters = HCILESetPeriodicAdvertisingEnable(
            enable: .enabled,
            advertisingHandle: 0x01)

        #expect(HCILESetPeriodicAdvertisingEnable.command.rawValue == 0x0040)
        #expect(Data(parameters) == Data([0x01, 0x01]))

        // Enable
        #expect(HCILESetPeriodicAdvertisingEnable.Enable.disabled.rawValue == 0x00)
        #expect(HCILESetPeriodicAdvertisingEnable.Enable.enabled.rawValue == 0x01)
        #expect(HCILESetPeriodicAdvertisingEnable.Enable(rawValue: 0x02) == nil)

        // mock host controller round trip
        let hostController = TestHostController()

        hostController.queue.append(
            .command(
                HCILowEnergyCommand.setPeriodicAdvertisingEnable.opcode,
                [0x40, 0x20, 0x02, 0x01, 0x01])
        )

        hostController.queue.append(.event([0x0E, 0x04, 0x01, 0x40, 0x20, 0x00]))

        try await hostController.setPeriodicAdvertisingEnable(
            enable: .enabled,
            advertisingHandle: 0x01)

        #expect(hostController.queue.isEmpty)
    }

    @Test func setScanResponseData() async throws {

        let advertisingData: LowEnergyAdvertisingData = [0x02, 0x01, 0x06]

        let parameters = HCILESetScanResponseData(advertisingData: advertisingData)

        #expect(HCILESetScanResponseData.command.rawValue == 0x0009)
        #expect(HCILESetScanResponseData.length == 32)
        #expect(
            Data(parameters)
                == Data([0x03, 0x02, 0x01, 0x06] + [UInt8](repeating: 0x00, count: 28)))

        // empty data
        #expect(Data(HCILESetScanResponseData()) == Data([UInt8](repeating: 0x00, count: 32)))

        // mock host controller round trip
        let hostController = TestHostController()

        hostController.queue.append(
            .command(
                HCILowEnergyCommand.setScanResponseData.opcode,
                [0x09, 0x20, 0x20, 0x03, 0x02, 0x01, 0x06] + [UInt8](repeating: 0x00, count: 28))
        )

        hostController.queue.append(.event([0x0E, 0x04, 0x01, 0x09, 0x20, 0x00]))

        try await hostController.setLowEnergyScanResponse(advertisingData)

        #expect(hostController.queue.isEmpty)
    }

    @Test func setExtendedScanParameters() async throws {

        typealias CommandParameter = HCILESetExtendedScanParameters

        // LE 1M PHY
        let parameters = CommandParameter(
            ownAddressType: .public,
            scanningFilterPolicy: .all,
            scanningPHY: .le1M)

        #expect(CommandParameter.command.rawValue == 0x0041)
        #expect(parameters.scanningPHY.type == .le1M)
        #expect(
            Data(parameters)
                == Data([
                    0x00,  // Own_Address_Type
                    0x00,  // Scanning_Filter_Policy
                    0x00  // Scanning_PHYs
                ]))

        // LE Coded PHY
        let codedParameters = CommandParameter(
            ownAddressType: .random,
            scanningFilterPolicy: .fromWhiteList,
            scanningPHY: .coded(
                scanType: (.active, .passive),
                scanInterval: (
                    LowEnergyScanInterval(rawValue: 0x0100)!,
                    LowEnergyScanInterval(rawValue: 0x0200)!
                ),
                scanWindow: (
                    LowEnergyScanInterval(rawValue: 0x0030)!,
                    LowEnergyScanInterval(rawValue: 0x0050)!
                )))

        #expect(codedParameters.scanningPHY.type == .coded)
        #expect(
            Data(codedParameters)
                == Data([
                    0x01,  // Own_Address_Type
                    0x01,  // Scanning_Filter_Policy
                    0x02,  // Scanning_PHYs
                    0x01, 0x00,  // Scan_Type
                    0x00, 0x01,  // Scan_Interval[0]
                    0x00, 0x02,  // Scan_Interval[1]
                    0x30, 0x00,  // Scan_Window[0]
                    0x50, 0x00  // Scan_Window[1]
                ]))

        // Scanning_Filter_Policy
        #expect(CommandParameter.ScanningFilterPolicy.all.rawValue == 0x00)
        #expect(CommandParameter.ScanningFilterPolicy.fromWhiteList.rawValue == 0x01)
        #expect(CommandParameter.ScanningFilterPolicy.allExceptDirectedAdvertisingPackets.rawValue == 0x02)
        #expect(CommandParameter.ScanningFilterPolicy.allExceptPacketFromWhiteListAndDirectedAdvertising.rawValue == 0x03)
        #expect(CommandParameter.ScanningFilterPolicy(rawValue: 0x04) == nil)

        // Scanning_PHY
        #expect(CommandParameter.ScanningPHYType.le1M.rawValue == 0b00)
        #expect(CommandParameter.ScanningPHYType.coded.rawValue == 0b10)
        #expect(CommandParameter.ScanningPHYType(rawValue: 0b01) == nil)

        // Scan_Type
        #expect(CommandParameter.ScanType.passive.rawValue == 0x00)
        #expect(CommandParameter.ScanType.active.rawValue == 0x01)
        #expect(CommandParameter.ScanType(rawValue: 0x02) == nil)

        // mock host controller round trip
        let hostController = TestHostController()

        hostController.queue.append(
            .command(
                HCILowEnergyCommand.setExtendedScanParameters.opcode,
                [0x41, 0x20, 0x03, 0x00, 0x00, 0x00])
        )

        hostController.queue.append(.event([0x0E, 0x04, 0x01, 0x41, 0x20, 0x00]))

        try await hostController.setLowEnergyExtendedScanParameters(
            ownAddressType: .public,
            scanningFilterPolicy: .all,
            scanningPHY: .le1M)

        #expect(hostController.queue.isEmpty)
    }

    @Test func setExtendedScanEnable() async throws {

        typealias CommandParameter = HCILESetExtendedScanEnable

        let parameters = CommandParameter(
            enable: .enabled,
            filterDuplicates: .enabled,
            duration: CommandParameter.Duration(rawValue: 0x0010)!,
            period: CommandParameter.Period(rawValue: 0x0002)!)

        #expect(CommandParameter.command.rawValue == 0x0042)
        #expect(
            Data(parameters)
                == Data([
                    0x01,  // Enable
                    0x01,  // Filter_Duplicates
                    0x10, 0x00,  // Duration
                    0x02, 0x00  // Period
                ]))

        // Enable
        #expect(CommandParameter.Enable.disabled.rawValue == 0x00)
        #expect(CommandParameter.Enable.enabled.rawValue == 0x01)
        #expect(CommandParameter.Enable(rawValue: 0x02) == nil)

        // Filter_Duplicates
        #expect(CommandParameter.FilterDuplicates.disabled.rawValue == 0x00)
        #expect(CommandParameter.FilterDuplicates.enabled.rawValue == 0x01)
        #expect(CommandParameter.FilterDuplicates.reset.rawValue == 0x02)
        #expect(CommandParameter.FilterDuplicates(rawValue: 0x03) == nil)

        // Duration
        #expect(CommandParameter.Duration(rawValue: 0x0000) == nil)
        #expect(CommandParameter.Duration.min.rawValue == 0x0001)
        #expect(CommandParameter.Duration.max.rawValue == 0xFFFF)
        #expect(CommandParameter.Duration.min.miliseconds == 10)
        #expect(CommandParameter.Duration.min < CommandParameter.Duration.max)
        #expect(CommandParameter.Duration(rawValue: 0x0010)!.miliseconds == 160)

        // Period
        #expect(CommandParameter.Period(rawValue: 0x0000) == nil)
        #expect(CommandParameter.Period.min.rawValue == 0x0001)
        #expect(CommandParameter.Period.max.rawValue == 0xFFFF)
        #expect(CommandParameter.Period(rawValue: 0x0002)!.miliseconds == 2.56)
        #expect(CommandParameter.Period(rawValue: 0x0002)! < CommandParameter.Period(rawValue: 0x0003)!)

        // mock host controller round trip
        let hostController = TestHostController()

        hostController.queue.append(
            .command(
                HCILowEnergyCommand.setExtendedScanEnable.opcode,
                [0x42, 0x20, 0x06, 0x01, 0x01, 0x10, 0x00, 0x02, 0x00])
        )

        hostController.queue.append(.event([0x0E, 0x04, 0x01, 0x42, 0x20, 0x00]))

        try await hostController.setLowEnergyExtendedScanEnable(
            enable: .enabled,
            filterDuplicates: .enabled,
            duration: CommandParameter.Duration(rawValue: 0x0010)!,
            period: CommandParameter.Period(rawValue: 0x0002)!)

        #expect(hostController.queue.isEmpty)
    }

    // MARK: - Return parameters

    @Test func readAdvertisingChannelTxPower() async throws {

        typealias Return = HCILEReadAdvertisingChannelTxPower

        #expect(Return.command.rawValue == 0x0007)
        #expect(Return.length == 1)

        guard let returnParameter = Return(data: Data([0x07]))
        else {
            Issue.record("Could not decode return parameter")
            return
        }

        #expect(returnParameter.transmitPowerLevel.rawValue == 7)

        // negative Tx power
        #expect(Return(data: Data([0xEC]))?.transmitPowerLevel.rawValue == -20)

        // invalid data
        #expect(Return(data: Data()) == nil)
        #expect(Return(data: Data([0x07, 0x00])) == nil)
        #expect(Return(data: Data([0x0B])) == nil)  // 11 dBm out of range

        // TransmitPowerLevel
        #expect(Return.TransmitPowerLevel.min.rawValue == -20)
        #expect(Return.TransmitPowerLevel.max.rawValue == 10)
        #expect(Return.TransmitPowerLevel(rawValue: -21) == nil)
        #expect(Return.TransmitPowerLevel(rawValue: 11) == nil)
        #expect(Return.TransmitPowerLevel.min < Return.TransmitPowerLevel.max)
        #expect(Return.TransmitPowerLevel.max > Return.TransmitPowerLevel.min)

        // mock host controller round trip
        let hostController = TestHostController()

        hostController.queue.append(
            .command(
                HCILowEnergyCommand.readAdvertisingChannelTXPower.opcode,
                [0x07, 0x20, 0x00])
        )

        hostController.queue.append(.event([0x0E, 0x05, 0x01, 0x07, 0x20, 0x00, 0x07]))

        let transmitPowerLevel = try await hostController.readAdvertisingChannelTxPower()

        #expect(transmitPowerLevel.rawValue == 7)
        #expect(hostController.queue.isEmpty)
    }

    @Test func readMaximumAdvertisingDataLength() async throws {

        typealias Return = HCILEReadMaximumAdvertisingDataLength

        #expect(Return.command.rawValue == 0x003A)
        #expect(Return.length == 2)

        guard let returnParameter = Return(data: Data([0xF2, 0x01]))
        else {
            Issue.record("Could not decode return parameter")
            return
        }

        #expect(returnParameter.maximumAdvertisingDataLength == 0x01F2)

        // invalid data
        #expect(Return(data: Data([0xF2])) == nil)
        #expect(Return(data: Data([0xF2, 0x01, 0x00])) == nil)

        // mock host controller round trip
        let hostController = TestHostController()

        hostController.queue.append(
            .command(
                HCILowEnergyCommand.readMaximumAdvertisingDataLength.opcode,
                [0x3A, 0x20, 0x00])
        )

        hostController.queue.append(.event([0x0E, 0x06, 0x01, 0x3A, 0x20, 0x00, 0xF2, 0x01]))

        let maximumDataLength = try await hostController.setReadMaximumAdvertisingDataLength()

        #expect(maximumDataLength == 0x01F2)
        #expect(hostController.queue.isEmpty)
    }

    @Test func readNumberOfSupportedAdvertisingSets() async throws {

        typealias Return = HCILEReadNumberOfSupportedAdvertisingSets

        #expect(Return.command.rawValue == 0x003B)
        #expect(Return.length == 1)

        guard let returnParameter = Return(data: Data([0x10]))
        else {
            Issue.record("Could not decode return parameter")
            return
        }

        #expect(returnParameter.numSupportedAdvertisingSets == 0x10)

        // invalid data
        #expect(Return(data: Data()) == nil)
        #expect(Return(data: Data([0x10, 0x00])) == nil)

        // mock host controller round trip
        let hostController = TestHostController()

        hostController.queue.append(
            .command(
                HCILowEnergyCommand.readNumberOfSupportedAdvertisingSets.opcode,
                [0x3B, 0x20, 0x00])
        )

        hostController.queue.append(.event([0x0E, 0x05, 0x01, 0x3B, 0x20, 0x00, 0x10]))

        let numSupportedAdvertisingSets = try await hostController.readNumberOfSupportedAdvertisingSets()

        #expect(numSupportedAdvertisingSets == 0x10)
        #expect(hostController.queue.isEmpty)
    }

    @Test func readPeriodicAdvertisingListSize() async throws {

        typealias Return = HCILEReadPeriodicAdvertisingListSize

        #expect(Return.command.rawValue == 0x004A)
        #expect(Return.length == 1)

        guard let returnParameter = Return(data: Data([0x08]))
        else {
            Issue.record("Could not decode return parameter")
            return
        }

        #expect(returnParameter.periodicAdvertiserListSize == 0x08)

        // invalid data
        #expect(Return(data: Data()) == nil)
        #expect(Return(data: Data([0x08, 0x00])) == nil)

        // mock host controller round trip
        let hostController = TestHostController()

        hostController.queue.append(
            .command(
                HCILowEnergyCommand.readPeriodicAdvertiserListSize.opcode,
                [0x4A, 0x20, 0x00])
        )

        hostController.queue.append(.event([0x0E, 0x05, 0x01, 0x4A, 0x20, 0x00, 0x08]))

        let listSize = try await hostController.lowEnergyReadPeriodicAdvertisingListSize()

        #expect(listSize == 0x08)
        #expect(hostController.queue.isEmpty)
    }

    // MARK: - Parameterless commands

    @Test func clearAdvertisingSets() async throws {

        let hostController = TestHostController()

        hostController.queue.append(
            .command(
                HCILowEnergyCommand.clearAdvertisingSets.opcode,
                [0x3D, 0x20, 0x00])
        )

        hostController.queue.append(.event([0x0E, 0x04, 0x01, 0x3D, 0x20, 0x00]))

        try await hostController.lowEnergyClearAdvertisingSets()

        #expect(hostController.queue.isEmpty)
    }

    @Test func periodicAdvertisingCreateSyncCancel() async throws {

        let hostController = TestHostController()

        hostController.queue.append(
            .command(
                HCILowEnergyCommand.periodicAdvertisingCreateSyncCancel.opcode,
                [0x45, 0x20, 0x00])
        )

        hostController.queue.append(.event([0x0E, 0x04, 0x01, 0x45, 0x20, 0x00]))

        try await hostController.lowEnergyPeriodicAdvertisingCreateSyncCancel()

        #expect(hostController.queue.isEmpty)
    }

    @Test func clearPeriodicAdvertiserList() async throws {

        let hostController = TestHostController()

        hostController.queue.append(
            .command(
                HCILowEnergyCommand.clearPeriodicAdvertiserList.opcode,
                [0x49, 0x20, 0x00])
        )

        hostController.queue.append(.event([0x0E, 0x04, 0x01, 0x49, 0x20, 0x00]))

        try await hostController.lowEnergyClearPeriodicAdvertiserList()

        #expect(hostController.queue.isEmpty)
    }

    // MARK: - Events

    @Test func advertisingSetTerminated() {

        let data = Data([
            0x00,  // Status
            0x01,  // Advertising_Handle
            0x02, 0x00,  // Connection_Handle
            0x05  // Num_Completed_Extended_Advertising_Events
        ])

        guard let event = HCILEAdvertisingSetTerminated(data: data)
        else {
            Issue.record("Could not decode event")
            return
        }

        #expect(HCILEAdvertisingSetTerminated.event.rawValue == 0x12)
        #expect(HCILEAdvertisingSetTerminated.length == 5)
        #expect(event.status == .success)
        #expect(event.advertisingHandle == 0x01)
        #expect(event.connectionHandle == 0x0002)
        #expect(event.numCompletedExtendedAdvertisingEvents == 0x05)

        // invalid data
        #expect(HCILEAdvertisingSetTerminated(data: Data([0x00])) == nil)  // truncated
        #expect(HCILEAdvertisingSetTerminated(data: data + Data([0x00])) == nil)  // extra byte
        #expect(HCILEAdvertisingSetTerminated(data: Data([0xFF, 0x01, 0x02, 0x00, 0x05])) == nil)  // invalid status
    }

    @Test func scanRequestReceived() {

        let data = Data([
            0x01,  // Advertising_Handle
            0x01,  // Scanner_Address_Type
            0x77, 0xD8, 0x47, 0xA3, 0x39, 0x54  // Scanner_Address
        ])

        guard let event = HCILEScanRequestReceived(data: data)
        else {
            Issue.record("Could not decode event")
            return
        }

        #expect(HCILEScanRequestReceived.event.rawValue == 0x13)
        #expect(HCILEScanRequestReceived.length == 8)
        #expect(event.advertisingHandle == 0x01)
        #expect(event.scannerAddressType == .random)
        #expect(event.scannerAddress == BluetoothAddress(rawValue: "54:39:A3:47:D8:77"))

        // invalid data
        #expect(HCILEScanRequestReceived(data: Data([0x01, 0x01])) == nil)  // truncated
        #expect(HCILEScanRequestReceived(data: Data([0x01, 0x04, 0x77, 0xD8, 0x47, 0xA3, 0x39, 0x54])) == nil)  // invalid address type
    }

    @Test func periodicAdvertisingSyncLost() {

        let data = Data([0x02, 0x00])

        guard let event = HCILEPeriodicAdvertisingSyncLost(data: data)
        else {
            Issue.record("Could not decode event")
            return
        }

        #expect(HCILEPeriodicAdvertisingSyncLost.event.rawValue == 0x10)
        #expect(HCILEPeriodicAdvertisingSyncLost.length == 2)
        #expect(event.syncHandle == 0x0002)

        // invalid data
        #expect(HCILEPeriodicAdvertisingSyncLost(data: Data([0x02])) == nil)
        #expect(HCILEPeriodicAdvertisingSyncLost(data: Data([0x02, 0x00, 0x00])) == nil)
    }

    @Test func directedAdvertisingReport() {

        let reportData: [UInt8] = [
            0x01,  // Event_Type (ADV_DIRECT_IND)
            0x00,  // Address_Type
            0x77, 0xD8, 0x47, 0xA3, 0x39, 0x54,  // Address
            0x01,  // Direct_Address_Type
            0x5D, 0x0B, 0x46, 0xCD, 0x69, 0xC8,  // Direct_Address
            0xC8  // RSSI (-56)
        ]

        let data = Data([0x01] + reportData)

        guard let event = HCILEDirectedAdvertisingReport(data: data)
        else {
            Issue.record("Could not decode event")
            return
        }

        #expect(HCILEDirectedAdvertisingReport.event.rawValue == 0x0B)
        #expect(HCILEDirectedAdvertisingReport.length == 17)
        #expect(HCILEDirectedAdvertisingReport.Report.length == 16)
        #expect(event.reports.count == 1)
        #expect(event.reports[0].event == 0x01)
        #expect(event.reports[0].addressType == .publicDeviceAddress)
        #expect(event.reports[0].address == BluetoothAddress(rawValue: "54:39:A3:47:D8:77"))
        #expect(event.reports[0].directAddressType == 0x01)
        #expect(event.reports[0].directAddress == BluetoothAddress(rawValue: "C8:69:CD:46:0B:5D"))
        #expect(event.reports[0].rssi.rawValue == -56)

        // multiple reports
        guard let multipleReportsEvent = HCILEDirectedAdvertisingReport(data: Data([0x02] + reportData + reportData))
        else {
            Issue.record("Could not decode event")
            return
        }

        #expect(multipleReportsEvent.reports.count == 2)
        #expect(multipleReportsEvent.reports[0].address == multipleReportsEvent.reports[1].address)

        // invalid data
        #expect(HCILEDirectedAdvertisingReport(data: Data()) == nil)  // empty
        #expect(HCILEDirectedAdvertisingReport(data: Data([0x00] + reportData)) == nil)  // zero reports
        #expect(HCILEDirectedAdvertisingReport(data: Data([0x1A] + reportData)) == nil)  // too many reports
        #expect(HCILEDirectedAdvertisingReport(data: Data([0x02] + reportData)) == nil)  // truncated second report
        #expect(HCILEDirectedAdvertisingReport(data: Data([0x01, 0x01, 0x04] + reportData.suffix(from: 2))) == nil)  // invalid address type

        // AddressType
        #expect(HCILEDirectedAdvertisingReport.AddressType.publicDeviceAddress.rawValue == 0x00)
        #expect(HCILEDirectedAdvertisingReport.AddressType.randomDeviceAddress.rawValue == 0x01)
        #expect(HCILEDirectedAdvertisingReport.AddressType.publicIdentityAddress.rawValue == 0x02)
        #expect(HCILEDirectedAdvertisingReport.AddressType.randomIdentyAddress.rawValue == 0x03)
        #expect(HCILEDirectedAdvertisingReport.AddressType.noAddressProvided.rawValue == 0xFF)
        #expect(HCILEDirectedAdvertisingReport.AddressType(rawValue: 0x04) == nil)
    }

    @Test func periodicAdvertisingReport() {

        typealias Event = HCILEPeriodicAdvertisingReport<[UInt8]>

        #expect(Event.event.rawValue == 0x0F)
        #expect(Event.length == 7)

        // truncated
        #expect(Event(data: Data([0x02, 0x00, 0x00])) == nil)

        // invalid Tx power (0x7F is reserved)
        #expect(Event(data: Data([0x02, 0x00, 0x7F, 0x00, 0xFF, 0x00, 0x00])) == nil)

        // invalid RSSI (0x7F is reserved)
        #expect(Event(data: Data([0x02, 0x00, 0x00, 0x7F, 0xFF, 0x00, 0x00])) == nil)

        // invalid data status
        #expect(Event(data: Data([0x02, 0x00, 0x00, 0xC4, 0xFF, 0x03, 0x00])) == nil)

        // DataStatus
        #expect(Event.DataStatus.complete.rawValue == 0x00)
        #expect(Event.DataStatus.incomplete.rawValue == 0x01)
        #expect(Event.DataStatus.truncated.rawValue == 0x02)
        #expect(Event.DataStatus(rawValue: 0x03) == nil)
    }

    // MARK: - Unit types

    @Test func lowEnergyScanInterval() {

        #expect(LowEnergyScanInterval.min.rawValue == 0x0004)
        #expect(LowEnergyScanInterval.max.rawValue == 0xFFFF)

        // out of range
        #expect(LowEnergyScanInterval(rawValue: 0x0000) == nil)
        #expect(LowEnergyScanInterval(rawValue: 0x0003) == nil)

        guard let interval = LowEnergyScanInterval(rawValue: 0x0010)
        else {
            Issue.record("Could not create scan interval")
            return
        }

        #expect(interval.rawValue == 0x0010)

        // Time = N * 0.625 msec
        #expect(LowEnergyScanInterval.min.miliseconds == 2.5)
        #expect(LowEnergyScanInterval.max.miliseconds == 40959.375)
        #expect(interval.miliseconds == 10)

        // Comparable / Equatable
        #expect(LowEnergyScanInterval.min < LowEnergyScanInterval.max)
        #expect(interval == LowEnergyScanInterval(rawValue: 0x0010))
        #expect(interval != LowEnergyScanInterval.min)
    }
}

#endif
