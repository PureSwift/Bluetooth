//
//  LinuxMain.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 11/28/17.
//  Copyright © 2017 PureSwift. All rights reserved.
//
import XCTest
@testable import BluetoothTests

XCTMain([
    testCase(BluetoothTests.allTests),
    testCase(AddressTests.allTests),
    testCase(BluetoothUUIDTests.allTests),
    testCase(UUIDTests.allTests),
    testCase(DefinedUUIDTests.allTests),
    testCase(UInt128Tests.allTests),
    testCase(iBeaconTests.allTests),
    testCase(HCITests.allTests),
    testCase(AttributeProtocolTests.allTests),
    testCase(GAPTests.allTests),
    testCase(GATTTests.allTests),
    testCase(GATTDatabaseTests.allTests),
    testCase(GATTDescriptorTests.allTests),
    testCase(GATTCharacteristicTests.allTests),
    testCase(IntegerTests.allTests)
    ])
