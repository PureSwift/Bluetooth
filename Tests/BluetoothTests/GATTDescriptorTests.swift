//
//  GATTDescriptorTests.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 5/30/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import XCTest
import Foundation
@testable import Bluetooth

final class GATTDescriptorTests: XCTestCase {
    
    static let allTests = [
        ("testCharacteristicClientConfigurationDescriptor", testCharacteristicClientConfigurationDescriptor),
        ("testCharacteristicExtendedPropertiesDescriptor", testCharacteristicExtendedPropertiesDescriptor),
        ("testCharacteristicServerConfigurationDescriptor", testCharacteristicsServerConfigurationDescriptor),
        ("testCharacteristicsAggregateFormatDescriptor",testCharacteristicsAggregateFormatDescriptor),
        ("testCharacteristicsFormatDescriptor",testCharacteristicsFormatDescriptor),
        ("testCharacteristicsUserDescriptionDescriptor",testCharacteristicsUserDescriptionDescriptor),
        ("testCharacteristicsReportReferenceDescriptor", testCharacteristicReportReferenceDescriptor)
    ]
    
    func testCharacteristicClientConfigurationDescriptor() {
        
        XCTAssertEqual(GATTClientCharacteristicConfiguration().configuration.rawValue, 0)
        XCTAssertEqual(GATTClientCharacteristicConfiguration.Configuration.all.rawValue, 3)
        
        XCTAssertNil(GATTClientCharacteristicConfiguration(byteValue: Data()))
        XCTAssertNil(GATTClientCharacteristicConfiguration(byteValue: Data([0x00])))
        XCTAssertNil(GATTClientCharacteristicConfiguration(byteValue: Data([0x00, 0x00, 0x03])))
        XCTAssertEqual(GATTClientCharacteristicConfiguration(byteValue: Data([0x00, 0x00]))?.configuration, [])
        XCTAssertEqual(GATTClientCharacteristicConfiguration(byteValue: Data([0x01, 0x00]))?.configuration, [.notify])
        XCTAssertEqual(GATTClientCharacteristicConfiguration(byteValue: Data([0x02, 0x00]))?.configuration, [.indicate])
        XCTAssertEqual(GATTClientCharacteristicConfiguration(byteValue: Data([0x03, 0x00]))?.configuration, [.notify, .indicate])
        
        var clientConfiguration = GATTClientCharacteristicConfiguration()
        XCTAssertEqual(clientConfiguration.configuration, [])
        
        clientConfiguration.configuration.insert(.notify)
        XCTAssertEqual(clientConfiguration.byteValue, Data([0x01, 00]))
        
        XCTAssert(clientConfiguration.configuration.remove(.notify))
        XCTAssertEqual(clientConfiguration.byteValue, Data([0x00, 0x00]))
        XCTAssertEqual(clientConfiguration.configuration, [])
        XCTAssertEqual(clientConfiguration.configuration.rawValue, 0)
        
    }
    
    func testCharacteristicExtendedPropertiesDescriptor() {
        XCTAssertEqual(GATTCharacteristicExtendedProperties().properties.rawValue, 0)
        XCTAssertEqual(GATTCharacteristicExtendedProperties.Property.all.rawValue,3)
        XCTAssertNil(GATTCharacteristicExtendedProperties(byteValue: Data()))
        XCTAssertNil(GATTCharacteristicExtendedProperties(byteValue: Data([0x00])))
        XCTAssertNil(GATTCharacteristicExtendedProperties(byteValue: Data([0x03])))
        XCTAssertNil(GATTCharacteristicExtendedProperties(byteValue: Data([0x00, 0x00, 0x00])))
        XCTAssertNil(GATTCharacteristicExtendedProperties(byteValue: Data([0x00, 0x00, 0x03])))
        XCTAssertEqual(GATTCharacteristicExtendedProperties(byteValue: Data([0x00, 0x00]))?.properties, [])
        XCTAssertEqual(GATTCharacteristicExtendedProperties(byteValue: Data([0x01, 0x00]))?.properties, [.reliableWrite])
        XCTAssertEqual(GATTCharacteristicExtendedProperties(byteValue: Data([0x02, 0x00]))?.properties, [.writableAuxiliaries])
        XCTAssertEqual(GATTCharacteristicExtendedProperties(byteValue: Data([0x03, 0x00]))?.properties, [.reliableWrite, .writableAuxiliaries])
        
        var extendedProperties = GATTCharacteristicExtendedProperties()
        XCTAssertEqual(extendedProperties.properties, [])
        
        extendedProperties.properties.insert(.reliableWrite)
        XCTAssertEqual(extendedProperties.byteValue, Data([0x01, 0x00]))
        
        XCTAssert(extendedProperties.properties.remove(.reliableWrite))
        XCTAssertEqual(extendedProperties.byteValue, Data([0x00, 0x00]))
        
        XCTAssertEqual(extendedProperties.properties, [])
        XCTAssertEqual(extendedProperties.properties.rawValue, 0)
        
    }
    
    func testCharacteristicsServerConfigurationDescriptor() {
        XCTAssertEqual(GATTServerCharacteristicConfiguration().serverConfiguration.rawValue, 0)
        XCTAssertEqual(GATTServerCharacteristicConfiguration.ServerConfiguration.all.rawValue, 1)
        XCTAssertNil(GATTServerCharacteristicConfiguration(byteValue: Data()))
        XCTAssertNil(GATTServerCharacteristicConfiguration(byteValue: Data([0x00, 0x00])))
        XCTAssertNil(GATTServerCharacteristicConfiguration(byteValue: Data([0x00, 0x01])))
        XCTAssertNil(GATTServerCharacteristicConfiguration(byteValue: Data([0x00, 0x00, 0x00])))
        XCTAssertNil(GATTServerCharacteristicConfiguration(byteValue: Data([0x00, 0x00, 0x01])))
        XCTAssertEqual(GATTServerCharacteristicConfiguration(byteValue: Data([0x00]))?.serverConfiguration, [])
        XCTAssertEqual(GATTServerCharacteristicConfiguration(byteValue: Data([0x01]))?.serverConfiguration, [.broadcasts])
        
        var serverConfiguration = GATTServerCharacteristicConfiguration()
        XCTAssertEqual(serverConfiguration.serverConfiguration, [])
        
        serverConfiguration.serverConfiguration.insert(.broadcasts)
        XCTAssertEqual(serverConfiguration.byteValue, Data([0x01]))
        
        XCTAssert(serverConfiguration.serverConfiguration.remove(.broadcasts))
        XCTAssertEqual(serverConfiguration.byteValue, Data([0x00]))
        
        XCTAssertEqual(serverConfiguration.serverConfiguration, [])
        XCTAssertEqual(serverConfiguration.serverConfiguration.rawValue, 0)
        
        
    }
    
    func testCharacteristicsAggregateFormatDescriptor() {
        XCTAssertEqual(GATTAggregateFormatDescriptor().handles, [])
        XCTAssertNil(GATTAggregateFormatDescriptor(byteValue: Data([0x00])))
        XCTAssertNil(GATTAggregateFormatDescriptor(byteValue: Data([0x00, 0x00, 0x00])))
        XCTAssertEqual(GATTAggregateFormatDescriptor(byteValue: Data([0x00, 0x00]))!.handles, [0x00])
        XCTAssertEqual(GATTAggregateFormatDescriptor(byteValue: Data([0x20, 0x00]))!.handles, [0x20])
        XCTAssertEqual(GATTAggregateFormatDescriptor(byteValue: Data([0x20, 0x00, 0x30, 0x00]))!.handles, [0x20, 0x30])
        XCTAssertEqual(GATTAggregateFormatDescriptor(byteValue: Data([0x40, 0x00, 0x50, 0x00, 0x60, 0x00]))!.handles, [0x40, 0x50, 0x60])
        
        var aggregateFormat = GATTAggregateFormatDescriptor()
        XCTAssertEqual(aggregateFormat.handles, [])
        
        aggregateFormat.handles.append(UInt16( 0x40))
        XCTAssertEqual(aggregateFormat.byteValue, Data([0x40,0x00]))
        aggregateFormat.handles.append(UInt16(bitPattern: 0x50))
        XCTAssertEqual(aggregateFormat.byteValue, Data([0x40,0x00,0x50,0x00]))
        aggregateFormat.handles.append(UInt16(bitPattern: 0x60))
        XCTAssertEqual(aggregateFormat.byteValue, Data([0x40,0x00,0x50,0x00,0x60,0x00]))
        aggregateFormat.handles.removeLast()
        XCTAssertEqual(aggregateFormat.byteValue, Data([0x40,0x00,0x50,0x00]))
        aggregateFormat.handles.removeLast()
        XCTAssertEqual(aggregateFormat.byteValue, Data([0x40,0x00]))
        aggregateFormat.handles.removeLast()
        XCTAssertEqual(aggregateFormat.handles, [])
    }
    
    func testCharacteristicsFormatDescriptor() {
        let value = Data([0x17, 0x00, 0xAC, 0x27, 0x01, 0x00, 0x00])
        XCTAssertEqual(value.count, 0x07)
        
        XCTAssertNil(GATTFormatDescriptor(byteValue: Data([0x00])))
        XCTAssertNil(GATTFormatDescriptor(byteValue: Data([0x00, 0x00, 0x00])))
        XCTAssertNil(GATTFormatDescriptor(byteValue: Data([0x00, 0x00, 0x00 , 0x00, 0x00])))
        XCTAssertNil(GATTFormatDescriptor(byteValue: Data([0x00, 0x00, 0x00 , 0x00, 0x00, 0x00, 0x00, 0x00])))
        XCTAssertNil(GATTFormatDescriptor(byteValue: Data([0x1C, 0x00, 0x00 , 0x00, 0x00, 0x00, 0x00])))
        XCTAssertNil(GATTFormatDescriptor(byteValue: Data([0xFF, 0x00, 0x00 , 0x00, 0x00, 0x00, 0x00])))
        
        XCTAssertEqual(GATTFormatDescriptor(byteValue: Data([0x00, 0x00, 0x00 , 0x00, 0x00, 0x00, 0x00]))?.format, CharacteristicFormatType.rfu)
        
        XCTAssertEqual(GATTFormatDescriptor(byteValue: Data([0x17, 0x00, 0xAC, 0x27, 0x01, 0x00, 0x00]))?.format, CharacteristicFormatType.float)
        XCTAssertEqual(GATTFormatDescriptor(byteValue: Data([0x17, 0x00, 0xAC, 0x27, 0x01, 0x00, 0x00]))?.exponent, 0x00)
        XCTAssertEqual(GATTFormatDescriptor(byteValue: Data([0x17, 0x00, 0xAC, 0x27, 0x01, 0x00, 0x00]))?.unit, 0x27AC)
        XCTAssertEqual(GATTFormatDescriptor(byteValue: Data([0x17, 0x00, 0xAC, 0x27, 0x01, 0x00, 0x00]))?.namespace, 0x01)
        XCTAssertEqual(GATTFormatDescriptor(byteValue: Data([0x17, 0x00, 0xAC, 0x27, 0x01, 0x00, 0x00]))?.description, 0x0000)
        
        let format = GATTFormatDescriptor(byteValue: value)
        XCTAssertEqual(format?.format, 0x17)
        
    }
    
    func testCharacteristicsUserDescriptionDescriptor() {
        
        XCTAssertNil(GATTUserDescription(byteValue: Data([0xff])))
        
        var userDescription = GATTUserDescription(userDescription: "hola")
        XCTAssertEqual(userDescription.byteValue, Data([0x68, 0x6f, 0x6c, 0x61]))
        
        userDescription.userDescription = "Test"
        XCTAssertEqual(userDescription.byteValue, Data([0x54, 0x65, 0x73, 0x74]))
    }
    
    func testCharacteristicReportReferenceDescriptor() {
        
        XCTAssertNil(GATTReportReference(byteValue: Data()))
        XCTAssertNil(GATTReportReference(byteValue: Data([0x00])))
        XCTAssertNil(GATTReportReference(byteValue: Data([0x00, 0x00])))
        XCTAssertNil(GATTReportReference(byteValue: Data([0x00, 0x00, 0x00])))
        
        var reportReference = GATTReportReference(byteValue: Data([0x00, 0x01]))
        XCTAssertEqual(reportReference?.reportID, 0x00)
        XCTAssertEqual(reportReference?.reportType, GATTReportReference.ReportType.InputReport)
        
        reportReference = GATTReportReference(byteValue: Data([0x00, 0x02]))
        XCTAssertEqual(reportReference?.reportType, GATTReportReference.ReportType.OutputReport)
        
        reportReference = GATTReportReference(byteValue: Data([0x00, 0x03]))
        XCTAssertEqual(reportReference?.reportType, GATTReportReference.ReportType.FeatureReport)
    }
}
