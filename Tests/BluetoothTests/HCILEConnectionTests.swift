//
//  HCILEConnectionTests.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 7/17/26.
//  Copyright © 2026 PureSwift. All rights reserved.
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

@Suite struct HCILEConnectionTests {

    // MARK: - Events

    @Test func channelSelectionAlgorithmEvent() {

        let data = Data([0x41, 0x00, 0x01])

        guard let event = HCILEChannelSelectionAlgorithm(data: data)
        else {
            Issue.record("Could not parse HCI Event")
            return
        }

        #expect(event.connectionHandle == 0x0041)
        #expect(event.channelSelectionAlgorithm == .algorithm2)

        #expect(HCILEChannelSelectionAlgorithm(data: Data([0x41, 0x00, 0x00]))?.channelSelectionAlgorithm == .algorithm1)

        // invalid channel selection algorithm
        #expect(HCILEChannelSelectionAlgorithm(data: Data([0x41, 0x00, 0x02])) == nil)

        // invalid length
        #expect(HCILEChannelSelectionAlgorithm(data: Data([0x41, 0x00])) == nil)
        #expect(HCILEChannelSelectionAlgorithm(data: Data()) == nil)
    }

    @Test func connectionUpdateCompleteEvent() {

        /**
         Status: 0x00 - Success
         Connection Handle: 0x0041
         Connection Interval: 0x0050 (100 ms)
         Connection Latency: 0x0000
         Supervision Timeout: 0x00C8 (2000 ms)
         */
        let data = Data([0x00, 0x41, 0x00, 0x50, 0x00, 0x00, 0x00, 0xC8, 0x00])

        guard let event = HCILEConnectionUpdateComplete(data: data)
        else {
            Issue.record("Could not parse HCI Event")
            return
        }

        #expect(event.status == .success)
        #expect(event.handle == 0x0041)
        #expect(event.connInterval.rawValue == 0x0050)
        #expect(event.connInterval.miliseconds == 100.0)
        #expect(event.connLatency == .zero)
        #expect(event.supervisionTimeout.rawValue == 0x00C8)
        #expect(event.supervisionTimeout.miliseconds == 2000.0)

        // invalid supervision timeout (below 0x000A)
        #expect(HCILEConnectionUpdateComplete(data: Data([0x00, 0x41, 0x00, 0x50, 0x00, 0x00, 0x00, 0x00, 0x00])) == nil)

        // invalid connection latency (above 0x01F3)
        #expect(HCILEConnectionUpdateComplete(data: Data([0x00, 0x41, 0x00, 0x50, 0x00, 0xF4, 0x01, 0xC8, 0x00])) == nil)

        // invalid length
        #expect(HCILEConnectionUpdateComplete(data: Data([0x00, 0x41, 0x00, 0x50, 0x00, 0x00, 0x00, 0xC8])) == nil)
    }

    @Test func dataLengthChangeEvent() {

        /**
         Connection Handle: 0x0041
         MaxTxOctets: 0x00FB
         MaxTxTime: 0x0848
         MaxRxOctets: 0x00FB
         MaxRxTime: 0x0848
         */
        let data = Data([0x41, 0x00, 0xFB, 0x00, 0x48, 0x08, 0xFB, 0x00, 0x48, 0x08])

        guard let event = HCILEDataLengthChange(data: data)
        else {
            Issue.record("Could not parse HCI Event")
            return
        }

        #expect(event.handle == 0x0041)
        #expect(event.maxTxOctets == 0x00FB)
        #expect(event.maxTxTime == 0x0848)
        #expect(event.maxRxOctets == 0x00FB)
        #expect(event.maxRxTime == 0x0848)

        // invalid length
        #expect(HCILEDataLengthChange(data: Data([0x41, 0x00, 0xFB, 0x00, 0x48, 0x08, 0xFB, 0x00, 0x48])) == nil)
        #expect(HCILEDataLengthChange(data: Data()) == nil)
    }

    @Test func enhancedConnectionCompleteEvent() {

        /**
         Status: 0x00 - Success
         Connection Handle: 0x0041
         Role: 0x00 - Master
         Peer Address Type: 0x01 - Random
         Peer Address: 54:39:A3:47:D8:77
         Local Resolvable Private Address: (null)
         Peer Resolvable Private Address: (null)
         Connection Interval: 0x0050 (100 ms)
         Connection Latency: 0x0000
         Supervision Timeout: 0x00C8 (2000 ms)
         Master Clock Accuracy: 0x05 - 50 ppm
         */
        let data = Data([
            0x00,
            0x41, 0x00,
            0x00,
            0x01,
            0x77, 0xD8, 0x47, 0xA3, 0x39, 0x54,
            0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
            0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
            0x50, 0x00,
            0x00, 0x00,
            0xC8, 0x00,
            0x05
        ])

        guard let event = HCILEEnhancedConnectionComplete(data: data)
        else {
            Issue.record("Could not parse HCI Event")
            return
        }

        #expect(event.status == .success)
        #expect(event.connectionHandle == 0x0041)
        #expect(event.role == .master)
        #expect(event.peerAddressType == .random)
        #expect(event.peerAddress == BluetoothAddress(rawValue: "54:39:A3:47:D8:77"))
        #expect(event.localResolvablePrivateAddress == .zero)
        #expect(event.peerResolvablePrivateAddress == .zero)
        #expect(event.interval.rawValue == 0x0050)
        #expect(event.interval.miliseconds == 100.0)
        #expect(event.latency == .zero)
        #expect(event.supervisionTimeout.rawValue == 0x00C8)
        #expect(event.masterClockAccuracy == .ppm50)

        // invalid role
        var invalidData = data
        invalidData[3] = 0x02
        #expect(HCILEEnhancedConnectionComplete(data: invalidData) == nil)

        // invalid master clock accuracy
        invalidData = data
        invalidData[29] = 0x08
        #expect(HCILEEnhancedConnectionComplete(data: invalidData) == nil)

        // invalid length
        #expect(HCILEEnhancedConnectionComplete(data: data.prefix(29)) == nil)
    }

    @Test func longTermKeyRequestEvent() {

        /**
         Connection Handle: 0x0041
         Random Number: 0x0807060504030201
         Encrypted Diversifier: 0x1234
         */
        let data = Data([0x41, 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x34, 0x12])

        guard let event = HCILELongTermKeyRequest(data: data)
        else {
            Issue.record("Could not parse HCI Event")
            return
        }

        #expect(event.handle == 0x0041)
        #expect(event.randomNumber == 0x0807_0605_0403_0201)
        #expect(event.encryptedDiversifier == 0x1234)

        // invalid length
        #expect(HCILELongTermKeyRequest(data: data.prefix(11)) == nil)
        #expect(HCILELongTermKeyRequest(data: Data()) == nil)
    }

    @Test func phyUpdateCompleteEvent() {

        /**
         Status: 0x00 - Success
         Connection Handle: 0x0041
         TX PHY: 0x02 - LE 2M
         RX PHY: 0x03 - LE Coded
         */
        let data = Data([0x00, 0x41, 0x00, 0x02, 0x03])

        guard let event = HCILEPhyUpdateComplete(data: data)
        else {
            Issue.record("Could not parse HCI Event")
            return
        }

        #expect(event.status == .success)
        #expect(event.handle == 0x0041)
        #expect(event.txPhy == .le2m)
        #expect(event.rxPhy == .leCoded)

        // invalid TX PHY
        #expect(HCILEPhyUpdateComplete(data: Data([0x00, 0x41, 0x00, 0x00, 0x03])) == nil)

        // invalid RX PHY
        #expect(HCILEPhyUpdateComplete(data: Data([0x00, 0x41, 0x00, 0x02, 0x04])) == nil)

        // invalid length
        #expect(HCILEPhyUpdateComplete(data: Data([0x00, 0x41, 0x00, 0x02])) == nil)
    }

    @Test func remoteConnectionParameterRequestEvent() {

        /**
         Connection Handle: 0x0041
         Interval Min: 0x0006 (7.5 ms)
         Interval Max: 0x000C (15 ms)
         Connection Latency: 0x0000
         Supervision Timeout: 0x00C8 (2000 ms)
         */
        let data = Data([0x41, 0x00, 0x06, 0x00, 0x0C, 0x00, 0x00, 0x00, 0xC8, 0x00])

        guard let event = HCILERemoteConnectionParameterRequest(data: data)
        else {
            Issue.record("Could not parse HCI Event")
            return
        }

        #expect(event.handle == 0x0041)
        #expect(event.interval == LowEnergyConnectionIntervalRange(rawValue: 0x0006...0x000C))
        #expect(event.interval.miliseconds == 7.5...15)
        #expect(event.connLatency == .zero)
        #expect(event.supervisionTimeout.rawValue == 0x00C8)

        // invalid interval (minimum below 0x0006)
        #expect(HCILERemoteConnectionParameterRequest(data: Data([0x41, 0x00, 0x05, 0x00, 0x0C, 0x00, 0x00, 0x00, 0xC8, 0x00])) == nil)

        // invalid length
        #expect(HCILERemoteConnectionParameterRequest(data: data.prefix(9)) == nil)
    }

    // MARK: - Commands

    @Test func longTermKeyRequestReply() {

        typealias CommandParameter = HCILELongTermKeyRequestReply

        let longTermKey = UInt128(bigEndian: UInt128(bytes: (0x4C, 0x68, 0x38, 0x41, 0x39, 0xF5, 0x74, 0xD8, 0x36, 0xBC, 0xF3, 0x4E, 0x9D, 0xFB, 0x01, 0xBF)))
        #expect(longTermKey.hexadecimal == "4C68384139F574D836BCF34E9DFB01BF")

        let parameters = CommandParameter(
            connectionHandle: 0x0041,
            longTermKey: longTermKey)

        #expect(
            parameters.data
                == Data([
                    0x41, 0x00,
                    0xBF, 0x01, 0xFB, 0x9D, 0x4E, 0xF3, 0xBC, 0x36, 0xD8, 0x74, 0xF5, 0x39, 0x41, 0x38, 0x68, 0x4C
                ]))

        guard let returnParameter = HCILELongTermKeyRequestReplyReturn(data: Data([0x41, 0x00]))
        else {
            Issue.record("Could not parse return parameter")
            return
        }

        #expect(returnParameter.connectionHandle == 0x0041)
        #expect(HCILELongTermKeyRequestReplyReturn(data: Data([0x41])) == nil)
    }

    @Test func longTermKeyRequestNegativeReply() {

        typealias CommandParameter = HCILELongTermKeyRequestNegativeReply

        let parameters = CommandParameter(connectionHandle: 0x0041)

        #expect(parameters.data == Data([0x41, 0x00]))

        guard let returnParameter = HCILELongTermKeyRequestNegativeReplyReturn(data: Data([0x41, 0x00]))
        else {
            Issue.record("Could not parse return parameter")
            return
        }

        #expect(returnParameter.connectionHandle == 0x0041)
        #expect(HCILELongTermKeyRequestNegativeReplyReturn(data: Data([0x41, 0x00, 0x00])) == nil)
    }

    @Test func readChannelMap() {

        typealias CommandParameter = HCILEReadChannelMap

        let parameters = CommandParameter(connectionHandle: 0x0041)

        #expect(parameters.data == Data([0x41, 0x00]))

        /**
         Connection Handle: 0x0041
         Channel Map: 0x1FFFFFFFFF (all 37 channels used)
         */
        guard let returnParameter = HCILEReadChannelMap.ReturnParameter(data: Data([0x41, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0x1F]))
        else {
            Issue.record("Could not parse return parameter")
            return
        }

        #expect(returnParameter.connectionHandle == 0x0041)
        #expect(returnParameter.channelMap.0 == 0xFF)
        #expect(returnParameter.channelMap.1 == 0xFF)
        #expect(returnParameter.channelMap.2 == 0xFF)
        #expect(returnParameter.channelMap.3 == 0xFF)
        #expect(returnParameter.channelMap.4 == 0x1F)

        #expect(HCILEReadChannelMap.ReturnParameter(data: Data([0x41, 0x00, 0xFF, 0xFF, 0xFF, 0xFF])) == nil)
    }

    @Test func readMaximumDataLength() {

        /**
         Supported Max TX Octets: 0x00FB
         Supported Max TX Time: 0x0848
         Supported Max RX Octets: 0x00FB
         Supported Max RX Time: 0x0848
         */
        let data = Data([0xFB, 0x00, 0x48, 0x08, 0xFB, 0x00, 0x48, 0x08])

        guard let returnParameter = HCILEReadMaximumDataLength(data: data)
        else {
            Issue.record("Could not parse return parameter")
            return
        }

        #expect(returnParameter.supportedMaxTxOctets.rawValue == 0x00FB)
        #expect(returnParameter.supportedMaxTxOctets == .max)
        #expect(returnParameter.supportedMaxTxTime.rawValue == 0x0848)
        #expect(returnParameter.supportedMaxRxOctets.rawValue == 0x00FB)
        #expect(returnParameter.supportedMaxRxTime.rawValue == 0x0848)

        // invalid TX octets (below 0x001B)
        #expect(HCILEReadMaximumDataLength(data: Data([0x1A, 0x00, 0x48, 0x08, 0xFB, 0x00, 0x48, 0x08])) == nil)

        // invalid TX time (below 0x0148)
        #expect(HCILEReadMaximumDataLength(data: Data([0xFB, 0x00, 0x47, 0x01, 0xFB, 0x00, 0x48, 0x08])) == nil)

        // invalid RX octets (above 0x00FB)
        #expect(HCILEReadMaximumDataLength(data: Data([0xFB, 0x00, 0x48, 0x08, 0xFC, 0x00, 0x48, 0x08])) == nil)

        // invalid RX time (above 0x4290)
        #expect(HCILEReadMaximumDataLength(data: Data([0xFB, 0x00, 0x48, 0x08, 0xFB, 0x00, 0x91, 0x42])) == nil)

        // invalid length
        #expect(HCILEReadMaximumDataLength(data: data.prefix(7)) == nil)
    }

    @Test func supportedMaxRxOctets() {

        typealias SupportedMaxRxOctets = HCILEReadMaximumDataLength.SupportedMaxRxOctets

        #expect(SupportedMaxRxOctets.min.rawValue == 0x001B)
        #expect(SupportedMaxRxOctets.max.rawValue == 0x00FB)
        #expect(SupportedMaxRxOctets(rawValue: 0x001B) == SupportedMaxRxOctets.min)
        #expect(SupportedMaxRxOctets(rawValue: 0x00FB) == SupportedMaxRxOctets.max)
        #expect(SupportedMaxRxOctets(rawValue: 0x001A) == nil)
        #expect(SupportedMaxRxOctets(rawValue: 0x00FC) == nil)
        #expect(SupportedMaxRxOctets.min < SupportedMaxRxOctets.max)
    }

    @Test func supportedMaxRxTime() {

        typealias SupportedMaxRxTime = HCILEReadMaximumDataLength.SupportedMaxRxTime

        #expect(SupportedMaxRxTime.min.rawValue == 0x0148)
        #expect(SupportedMaxRxTime.max.rawValue == 0x4290)
        #expect(SupportedMaxRxTime(rawValue: 0x0148) == SupportedMaxRxTime.min)
        #expect(SupportedMaxRxTime(rawValue: 0x4290) == SupportedMaxRxTime.max)
        #expect(SupportedMaxRxTime(rawValue: 0x0147) == nil)
        #expect(SupportedMaxRxTime(rawValue: 0x4291) == nil)
        #expect(SupportedMaxRxTime.min < SupportedMaxRxTime.max)
    }

    @Test func readPhy() {

        typealias CommandParameter = HCILEReadPHY

        let parameters = CommandParameter(connectionHandle: 0x0041)

        #expect(parameters.data == Data([0x41, 0x00]))

        /**
         Connection Handle: 0x0041
         TX PHY: 0x01 - LE 1M
         RX PHY: 0x02 - LE 2M
         */
        guard let returnParameter = HCILEReadPHYReturn(data: Data([0x41, 0x00, 0x01, 0x02]))
        else {
            Issue.record("Could not parse return parameter")
            return
        }

        #expect(returnParameter.connectionHandle == 0x0041)
        #expect(returnParameter.txPhy == .le1m)
        #expect(returnParameter.rxPhy == .le2m)

        // invalid TX PHY
        #expect(HCILEReadPHYReturn(data: Data([0x41, 0x00, 0x00, 0x02])) == nil)

        // invalid RX PHY
        #expect(HCILEReadPHYReturn(data: Data([0x41, 0x00, 0x01, 0x04])) == nil)

        // invalid length
        #expect(HCILEReadPHYReturn(data: Data([0x41, 0x00, 0x01])) == nil)
    }

    @Test func readSuggestedDefaultDataLength() {

        /**
         Suggested Max TX Octets: 0x001B
         Suggested Max TX Time: 0x0148
         */
        guard let returnParameter = HCILEReadSuggestedDefaultDataLength(data: Data([0x1B, 0x00, 0x48, 0x01]))
        else {
            Issue.record("Could not parse return parameter")
            return
        }

        #expect(returnParameter.suggestedMaxTxOctets == .min)
        #expect(returnParameter.suggestedMaxTxTime == .min)

        // invalid TX octets
        #expect(HCILEReadSuggestedDefaultDataLength(data: Data([0x1A, 0x00, 0x48, 0x01])) == nil)

        // invalid TX time
        #expect(HCILEReadSuggestedDefaultDataLength(data: Data([0x1B, 0x00, 0x47, 0x01])) == nil)

        // invalid length
        #expect(HCILEReadSuggestedDefaultDataLength(data: Data([0x1B, 0x00, 0x48])) == nil)
    }

    @Test func remoteConnectionParameterRequestReply() {

        typealias CommandParameter = HCILERemoteConnectionParameterRequestReply

        let parameters = CommandParameter(
            connectionHandle: 0x0041,
            interval: LowEnergyConnectionIntervalRange(rawValue: 0x0006...0x000C)!,
            latency: .zero,
            timeOut: LowEnergySupervisionTimeout(rawValue: 0x00C8)!,
            length: LowEnergyConnectionLength(rawValue: 0x0004...0x0006))

        #expect(
            parameters.data
                == Data([
                    0x41, 0x00,
                    0x06, 0x00,
                    0x0C, 0x00,
                    0x00, 0x00,
                    0xC8, 0x00,
                    0x04, 0x00,
                    0x06, 0x00
                ]))

        guard let returnParameter = HCILERemoteConnectionParameterRequestReplyReturn(data: Data([0x41, 0x00]))
        else {
            Issue.record("Could not parse return parameter")
            return
        }

        #expect(returnParameter.connectionHandle == 0x0041)
        #expect(HCILERemoteConnectionParameterRequestReplyReturn(data: Data([0x41])) == nil)
    }

    @Test func remoteConnectionParameterRequestNegativeReply() {

        typealias CommandParameter = HCILERemoteConnectionParameterRequestNegativeReply

        let parameters = CommandParameter(
            connectionHandle: 0x0041,
            reason: HCIError.unacceptableConnectionInterval.rawValue)

        #expect(parameters.data == Data([0x41, 0x00, 0x3B]))

        guard let returnParameter = HCILERemoteConnectionParameterRequestNegativeReplyReturn(data: Data([0x41, 0x00]))
        else {
            Issue.record("Could not parse return parameter")
            return
        }

        #expect(returnParameter.connectionHandle == 0x0041)
        #expect(HCILERemoteConnectionParameterRequestNegativeReplyReturn(data: Data()) == nil)
    }

    @Test func setDataLength() {

        typealias CommandParameter = HCILESetDataLength

        let parameters = CommandParameter(
            connectionHandle: 0x0041,
            txOctets: LowEnergyMaxTxOctets(rawValue: 0x00FB)!,
            txTime: LowEnergyMaxTxTime(rawValue: 0x0848)!)

        #expect(parameters.data == Data([0x41, 0x00, 0xFB, 0x00, 0x48, 0x08]))

        guard let returnParameter = HCILESetDataLengthReturn(data: Data([0x41, 0x00]))
        else {
            Issue.record("Could not parse return parameter")
            return
        }

        #expect(returnParameter.connectionHandle == 0x0041)
        #expect(HCILESetDataLengthReturn(data: Data([0x41])) == nil)
    }

    @Test func setDefaultPhy() {

        typealias CommandParameter = HCILESetDefaultPhy

        let parameters = CommandParameter(
            allPhys: .hostHasNoPreferenceAmongTheTransmitterPhy,
            txPhys: .hostUseLe2MTransmitterPhy,
            rxPhys: .hostUseLe1MReceiverPhy)

        #expect(parameters.data == Data([0x01, 0x02, 0x01]))
    }

    @Test func setHostChannelClassification() {

        typealias CommandParameter = HCILESetHostChannelClassification

        let parameters = CommandParameter(channelMap: (0xFF, 0xFF, 0xFF, 0xFF, 0x1F))

        #expect(parameters.data == Data([0xFF, 0xFF, 0xFF, 0xFF, 0x1F]))
    }

    @Test func setPhy() {

        typealias CommandParameter = HCILESetPhy

        let parameters = CommandParameter(
            connectionHandle: 0x0041,
            allPhys: .hostHasNoPreferenceAmongTheReceiverPhy,
            txPhys: .hostUseLeCodedTransmitterPhy,
            rxPhys: .hostUseLe2MReceiverPhy,
            phyOptions: .s2)

        #expect(parameters.data == Data([0x41, 0x00, 0x02, 0x04, 0x02, 0x02, 0x00]))
    }

    @Test func updateConnection() {

        typealias CommandParameter = HCILEUpdateConnection

        let parameters = CommandParameter(
            connectionHandle: 0x0041,
            connectionInterval: LowEnergyConnectionIntervalRange(rawValue: 0x0006...0x000C)!,
            connectionLatency: .zero,
            supervisionTimeout: LowEnergySupervisionTimeout(rawValue: 0x00C8)!,
            connectionLength: LowEnergyConnectionLength(rawValue: 0x0004...0x0006))

        #expect(parameters.connectionInterval.miliseconds == 7.5...15)
        #expect(parameters.supervisionTimeout.miliseconds == 2000)

        #expect(
            parameters.data
                == Data([
                    0x41, 0x00,
                    0x06, 0x00,
                    0x0C, 0x00,
                    0x00, 0x00,
                    0xC8, 0x00,
                    0x04, 0x00,
                    0x06, 0x00
                ]))
    }

    @Test func writeSuggestedDefaultDataLength() {

        typealias CommandParameter = HCILEWriteSuggestedDefaultDataLength

        let parameters = CommandParameter(
            suggestedMaxTxOctets: LowEnergyMaxTxOctets(rawValue: 0x001B)!,
            suggestedMaxTxTime: LowEnergyMaxTxTime(rawValue: 0x0148)!)

        #expect(parameters.data == Data([0x1B, 0x00, 0x48, 0x01]))
    }

    @Test func extendedCreateConnection() {

        typealias CommandParameter = HCILEExtendedCreateConnection

        let parameters = CommandParameter(
            initialingFilterPolicy: .whiteListIsNotUsed,
            ownAddressType: .publicDeviceAddress,
            peerAddressType: .random,
            peerAddress: BluetoothAddress(rawValue: "54:39:A3:47:D8:77")!,
            initialingPHY: .le1m)

        #expect(
            parameters.data
                == Data([
                    0x00,
                    0x00,
                    0x01,
                    0x77, 0xD8, 0x47, 0xA3, 0x39, 0x54
                ]))

        #expect(parameters.initialingPHY.type == .le1m)

        let le2mPhy = CommandParameter.InitialingPHY.le2m(
            scanInterval: LowEnergyScanInterval(rawValue: 0x0004)!,
            scanWindow: LowEnergyScanInterval(rawValue: 0x0004)!,
            connIntervalMin: LowEnergyConnectionIntervalRange(rawValue: 0x0006...0x000C)!,
            connLatency: .zero,
            supervisionTimeout: LowEnergySupervisionTimeout(rawValue: 0x00C8)!,
            ceLength: .zero)

        #expect(le2mPhy.type == .le2m)

        let codedPhy = CommandParameter.InitialingPHY.coded(
            scanInterval: (LowEnergyScanInterval(rawValue: 0x0004)!, LowEnergyScanInterval(rawValue: 0x0004)!),
            scanWindow: (LowEnergyScanInterval(rawValue: 0x0004)!, LowEnergyScanInterval(rawValue: 0x0004)!),
            connIntervalMin: (LowEnergyConnectionIntervalRange(rawValue: 0x0006...0x000C)!, LowEnergyConnectionIntervalRange(rawValue: 0x0006...0x000C)!),
            connLatency: (.zero, .zero),
            supervisionTimeout: (LowEnergySupervisionTimeout(rawValue: 0x00C8)!, LowEnergySupervisionTimeout(rawValue: 0x00C8)!),
            ceLength: (.zero, .zero))

        #expect(codedPhy.type == .coded)
    }

    @Test func extendedCreateConnectionCELength() {

        typealias CELength = HCILEExtendedCreateConnection.CELength

        #expect(CELength.zero.rawValue == 0)
        #expect(CELength().rawValue == 0)
        #expect(CELength(rawValue: 0x0041)?.rawValue == 0x0041)
        #expect(CELength(rawValue: 0xFFFF)?.rawValue == 0xFFFF)
        #expect(CELength.zero < CELength(rawValue: 0x0041)!)
    }

    // MARK: - Unit Types

    @Test func maxTxOctets() {

        #expect(LowEnergyMaxTxOctets.min.rawValue == 0x001B)
        #expect(LowEnergyMaxTxOctets.max.rawValue == 0x00FB)
        #expect(LowEnergyMaxTxOctets(rawValue: 0x001B) == LowEnergyMaxTxOctets.min)
        #expect(LowEnergyMaxTxOctets(rawValue: 0x00FB) == LowEnergyMaxTxOctets.max)
        #expect(LowEnergyMaxTxOctets(rawValue: 0x0041)?.rawValue == 0x0041)
        #expect(LowEnergyMaxTxOctets(rawValue: 0x001A) == nil)
        #expect(LowEnergyMaxTxOctets(rawValue: 0x00FC) == nil)
        #expect(LowEnergyMaxTxOctets(rawValue: 0x0000) == nil)
        #expect(LowEnergyMaxTxOctets.min < LowEnergyMaxTxOctets.max)
    }

    @Test func maxTxTime() {

        #expect(LowEnergyMaxTxTime.min.rawValue == 0x0148)
        #expect(LowEnergyMaxTxTime.max.rawValue == 0x4290)
        #expect(LowEnergyMaxTxTime(rawValue: 0x0148) == LowEnergyMaxTxTime.min)
        #expect(LowEnergyMaxTxTime(rawValue: 0x4290) == LowEnergyMaxTxTime.max)
        #expect(LowEnergyMaxTxTime(rawValue: 0x0848)?.rawValue == 0x0848)
        #expect(LowEnergyMaxTxTime(rawValue: 0x0147) == nil)
        #expect(LowEnergyMaxTxTime(rawValue: 0x4291) == nil)
        #expect(LowEnergyMaxTxTime(rawValue: 0x0000) == nil)
        #expect(LowEnergyMaxTxTime.min < LowEnergyMaxTxTime.max)
    }
}
#endif
