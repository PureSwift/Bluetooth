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
    testCase(HCITests.allTests),
    testCase(AttributeProtocolTests.allTests)
    ])
