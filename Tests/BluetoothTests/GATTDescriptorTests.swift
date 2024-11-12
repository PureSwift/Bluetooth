//
//  GATTDescriptorTests.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 5/30/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

#if canImport(BluetoothGATT)
import XCTest
import Foundation
import Bluetooth
@testable import BluetoothGATT

final class GATTDescriptorTests: XCTestCase {
    
    func testCharacteristicClientConfigurationDescriptor() {
        
        XCTAssertEqual(GATTClientCharacteristicConfiguration().rawValue, 0)
        
        XCTAssertNil(GATTClientCharacteristicConfiguration(data: Data()))
        XCTAssertNil(GATTClientCharacteristicConfiguration(data: Data([0x00])))
        XCTAssertNil(GATTClientCharacteristicConfiguration(data: Data([0x00, 0x00, 0x03])))
        XCTAssertEqual(GATTClientCharacteristicConfiguration(data: Data([0x00, 0x00])), [])
        XCTAssertEqual(GATTClientCharacteristicConfiguration(data: Data([0x01, 0x00])), [.notify])
        XCTAssertEqual(GATTClientCharacteristicConfiguration(data: Data([0x02, 0x00])), [.indicate])
        XCTAssertEqual(GATTClientCharacteristicConfiguration(data: Data([0x03, 0x00])), [.notify, .indicate])
        
        var clientConfiguration = GATTClientCharacteristicConfiguration()
        XCTAssertEqual(clientConfiguration, [])
        
        clientConfiguration.insert(.notify)
        XCTAssertEqual(clientConfiguration.data, Data([0x01, 00]))
        
        XCTAssertEqual(clientConfiguration.remove(.notify), .notify)
        XCTAssertEqual(clientConfiguration.data, Data([0x00, 0x00]))
        XCTAssertEqual(clientConfiguration, [])
        XCTAssertEqual(clientConfiguration.rawValue, 0)
        
    }
    
    func testCharacteristicExtendedPropertiesDescriptor() {
        XCTAssertEqual(GATTCharacteristicExtendedProperties().rawValue, 0)
        XCTAssertNil(GATTCharacteristicExtendedProperties(data: Data()))
        XCTAssertNil(GATTCharacteristicExtendedProperties(data: Data([0x00])))
        XCTAssertNil(GATTCharacteristicExtendedProperties(data: Data([0x03])))
        XCTAssertNil(GATTCharacteristicExtendedProperties(data: Data([0x00, 0x00, 0x00])))
        XCTAssertNil(GATTCharacteristicExtendedProperties(data: Data([0x00, 0x00, 0x03])))
        XCTAssertEqual(GATTCharacteristicExtendedProperties(data: Data([0x00, 0x00])), [])
        XCTAssertEqual(GATTCharacteristicExtendedProperties(data: Data([0x01, 0x00])), [.reliableWrite])
        XCTAssertEqual(GATTCharacteristicExtendedProperties(data: Data([0x02, 0x00])), [.writableAuxiliaries])
        XCTAssertEqual(GATTCharacteristicExtendedProperties(data: Data([0x03, 0x00])), [.reliableWrite, .writableAuxiliaries])
        
        var extendedProperties = GATTCharacteristicExtendedProperties()
        XCTAssertEqual(extendedProperties, [])
        
        extendedProperties.insert(.reliableWrite)
        XCTAssertEqual(extendedProperties.data, Data([0x01, 0x00]))
        
        XCTAssertEqual(extendedProperties.remove(.reliableWrite), .reliableWrite)
        XCTAssertEqual(extendedProperties.data, Data([0x00, 0x00]))
        
        XCTAssertEqual(extendedProperties, [])
        XCTAssertEqual(extendedProperties.rawValue, 0)
        
    }
    
    func testCharacteristicsServerConfigurationDescriptor() {
        XCTAssertEqual(GATTServerCharacteristicConfiguration().rawValue, 0)
        XCTAssertNil(GATTServerCharacteristicConfiguration(data: Data()))
        XCTAssertNil(GATTServerCharacteristicConfiguration(data: Data([0x00, 0x00])))
        XCTAssertNil(GATTServerCharacteristicConfiguration(data: Data([0x00, 0x01])))
        XCTAssertNil(GATTServerCharacteristicConfiguration(data: Data([0x00, 0x00, 0x00])))
        XCTAssertNil(GATTServerCharacteristicConfiguration(data: Data([0x00, 0x00, 0x01])))
        XCTAssertEqual(GATTServerCharacteristicConfiguration(data: Data([0x00])), [])
        XCTAssertEqual(GATTServerCharacteristicConfiguration(data: Data([0x01])), [.broadcasts])
        
        var serverConfiguration = GATTServerCharacteristicConfiguration()
        XCTAssertEqual(serverConfiguration, [])
        
        serverConfiguration.insert(.broadcasts)
        XCTAssertEqual(serverConfiguration.data, Data([0x01]))
        
        XCTAssertEqual(serverConfiguration.remove(.broadcasts), .broadcasts)
        XCTAssertEqual(serverConfiguration.data, Data([0x00]))
        
        XCTAssertEqual(serverConfiguration, [])
        XCTAssertEqual(serverConfiguration.rawValue, 0)
        
        
    }
    
    func testCharacteristicsAggregateFormatDescriptor() {
        XCTAssertEqual(GATTAggregateFormatDescriptor().handles, [])
        XCTAssertNil(GATTAggregateFormatDescriptor(data: Data([0x00])))
        XCTAssertNil(GATTAggregateFormatDescriptor(data: Data([0x00, 0x00, 0x00])))
        XCTAssertEqual(GATTAggregateFormatDescriptor(data: Data([0x00, 0x00]))!.handles, [0x00])
        XCTAssertEqual(GATTAggregateFormatDescriptor(data: Data([0x20, 0x00]))!.handles, [0x20])
        XCTAssertEqual(GATTAggregateFormatDescriptor(data: Data([0x20, 0x00, 0x30, 0x00]))!.handles, [0x20, 0x30])
        XCTAssertEqual(GATTAggregateFormatDescriptor(data: Data([0x40, 0x00, 0x50, 0x00, 0x60, 0x00]))!.handles, [0x40, 0x50, 0x60])
        
        var aggregateFormat = GATTAggregateFormatDescriptor()
        XCTAssertEqual(aggregateFormat.handles, [])
        
        aggregateFormat.handles.append(UInt16( 0x40))
        XCTAssertEqual(aggregateFormat.data, Data([0x40,0x00]))
        aggregateFormat.handles.append(UInt16(bitPattern: 0x50))
        XCTAssertEqual(aggregateFormat.data, Data([0x40,0x00,0x50,0x00]))
        aggregateFormat.handles.append(UInt16(bitPattern: 0x60))
        XCTAssertEqual(aggregateFormat.data, Data([0x40,0x00,0x50,0x00,0x60,0x00]))
        aggregateFormat.handles.removeLast()
        XCTAssertEqual(aggregateFormat.data, Data([0x40,0x00,0x50,0x00]))
        aggregateFormat.handles.removeLast()
        XCTAssertEqual(aggregateFormat.data, Data([0x40,0x00]))
        aggregateFormat.handles.removeLast()
        XCTAssertEqual(aggregateFormat.handles, [])
    }
    
    func testCharacteristicsFormatDescriptor() {
        
        let value = Data([0x17, 0x00, 0xAC, 0x27, 0x01, 0x00, 0x00])
        XCTAssertEqual(value.count, 0x07)
        
        XCTAssertNil(GATTFormatDescriptor(data: Data([0x00])))
        XCTAssertNil(GATTFormatDescriptor(data: Data([0x00, 0x00, 0x00])))
        XCTAssertNil(GATTFormatDescriptor(data: Data([0x00, 0x00, 0x00 , 0x00, 0x00])))
        XCTAssertNil(GATTFormatDescriptor(data: Data([0x00, 0x00, 0x00 , 0x00, 0x00, 0x00, 0x00, 0x00])))
        XCTAssertNil(GATTFormatDescriptor(data: Data([0x1C, 0x00, 0x00 , 0x00, 0x00, 0x00, 0x00])))
        XCTAssertNil(GATTFormatDescriptor(data: Data([0xFF, 0x00, 0x00 , 0x00, 0x00, 0x00, 0x00])))
        
        XCTAssertEqual(GATTFormatDescriptor(data: Data([0x00, 0x00, 0x00 , 0x00, 0x00, 0x00, 0x00]))?.format, .rfu)
        
        XCTAssertEqual(GATTFormatDescriptor(data: Data([0x17, 0x00, 0xAC, 0x27, 0x01, 0x00, 0x00]))?.format, .float)
        XCTAssertEqual(GATTFormatDescriptor(data: Data([0x17, 0x00, 0xAC, 0x27, 0x01, 0x00, 0x00]))?.exponent, 0x00)
        XCTAssertEqual(GATTFormatDescriptor(data: Data([0x17, 0x00, 0xAC, 0x27, 0x01, 0x00, 0x00]))?.unit, 0x27AC)
        XCTAssertEqual(GATTFormatDescriptor(data: Data([0x17, 0x00, 0xAC, 0x27, 0x01, 0x00, 0x00]))?.namespace, 0x01)
        XCTAssertEqual(GATTFormatDescriptor(data: Data([0x17, 0x00, 0xAC, 0x27, 0x01, 0x00, 0x00]))?.description, 0x0000)
        
        let formatDescriptor = GATTFormatDescriptor(data: value)
        XCTAssertEqual(formatDescriptor?.format.rawValue, 0x17)
        
    }
    
    func testCharacteristicsUserDescriptionDescriptor() {
        
        var userDescription = GATTUserDescription(rawValue: "")
        XCTAssertEqual(userDescription.data, Data())
        
        userDescription = "Test"
        XCTAssertEqual(userDescription.data, Data([0x54, 0x65, 0x73, 0x74]))
    }
    
    func testCharacteristicReportReferenceDescriptor() {
        
        XCTAssertNil(GATTReportReference(data: Data()))
        XCTAssertNil(GATTReportReference(data: Data([0x00])))
        XCTAssertNil(GATTReportReference(data: Data([0x00, 0x00])))
        XCTAssertNil(GATTReportReference(data: Data([0x00, 0x04])))
        XCTAssertNil(GATTReportReference(data: Data([0xFF, 0xFF])))
        XCTAssertNil(GATTReportReference(data: Data([0x00, 0x00, 0x00])))
        
        do {
            
            guard let reportReference = GATTReportReference(data: Data([0x00, 0x01]))
                else { XCTFail(); return }
            
            XCTAssertEqual(reportReference.identifier, 0x00)
            XCTAssertEqual(reportReference.type, .input)
        }
        
        do {
            
            guard let reportReference = GATTReportReference(data: Data([0xAA, 0x02]))
                else { XCTFail(); return }
            
            XCTAssertEqual(reportReference.identifier, 0xAA)
            XCTAssertEqual(reportReference.type, .output)
        }
        
        do {
            
            guard let reportReference = GATTReportReference(data: Data([0xBB, 0x03]))
                else { XCTFail(); return }
            
            XCTAssertEqual(reportReference.identifier, 0xBB)
            XCTAssertEqual(reportReference.type, .feature)
        }
    }
    
    func testTimeTriggerSettingDescriptor() {
        
        XCTAssertNil(GATTTimeTriggerSetting(data: Data()))
        XCTAssertNil(GATTTimeTriggerSetting(data: Data([0x00])))
        XCTAssertNil(GATTTimeTriggerSetting(data: Data([0x03,0x00])))
        XCTAssertNil(GATTTimeTriggerSetting(data: Data([0x04,0x00])))
        XCTAssertNil(GATTTimeTriggerSetting(data: Data([0x02,0x00])))
        
        let valueNone = Data([0x00, 0x10])
        let valueTimeInterval = Data([0x01, 0x00, 0x00, 0x00])
        let valueTimeIntervalIndicate = Data([0x02, 0x00, 0x00, 0x00])
        let valueCount = Data([0x03, 0x00, 0x00])
        var timeTriggerSetting = GATTTimeTriggerSetting(data: valueNone)
        XCTAssertEqual(timeTriggerSetting?.data.count, valueNone.count)
        
        timeTriggerSetting = GATTTimeTriggerSetting(data: valueTimeIntervalIndicate)
        XCTAssertEqual(timeTriggerSetting?.data.count, valueTimeIntervalIndicate.count)
        
        timeTriggerSetting = GATTTimeTriggerSetting(data: valueTimeInterval)
        XCTAssertEqual(timeTriggerSetting?.data.count, valueTimeInterval.count)
        
        timeTriggerSetting = GATTTimeTriggerSetting(data: valueCount)
        XCTAssertEqual(timeTriggerSetting?.data.count, valueCount.count)
    }
    
    func testExternalReportReferenceDescriptor() {
        
        XCTAssertNil(GATTExternalReportReference(data: Data()))
        XCTAssertNil(GATTExternalReportReference(data: Data([0x00])))
        
        let aerobicHeartRateLowerLimit = Data(BluetoothUUID.aerobicHeartRateLowerLimit)
        var externalReportReference = GATTExternalReportReference(data: aerobicHeartRateLowerLimit)
        XCTAssertEqual(externalReportReference?.data, aerobicHeartRateLowerLimit)
        
        let batteryLevel = Data(BluetoothUUID.batteryLevel)
        externalReportReference = GATTExternalReportReference(data: Data([0x19, 0x2A]))
        XCTAssertEqual(externalReportReference?.data, batteryLevel)
        
        externalReportReference = GATTExternalReportReference(uuid: .batteryService)
        XCTAssertEqual(externalReportReference?.data, Data(BluetoothUUID.batteryService.littleEndian))
    }
    
    func testNumberOfDigitalsDescritor() {
        
        XCTAssertNil(GATTNumberOfDigitals(data: Data()))
        XCTAssertNil(GATTNumberOfDigitals(data: Data([0x00, 0x00])))
        
        let numbersOfDigitals = GATTNumberOfDigitals(data: Data([0x00]))
        XCTAssertEqual(numbersOfDigitals?.data, Data([0x00]))
    }
}

internal extension GATTDescriptor {
    
    var data: Data {
        Data(self)
    }
}

#endif
