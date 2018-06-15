//
//  TestProfile.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 4/17/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation
import Bluetooth

/// Test GATT Profile
public struct TestProfile {
    
    public typealias Service = GATT.Service
    public typealias Characteristic = GATT.Characteristic
    
    public static let services: [Service] = [
        TestService,
        TestDefinedService
    ]
    
    public static let TestService = Service(uuid: BluetoothUUID(rawValue: "60F14FE2-F972-11E5-B84F-23E070D5A8C7")!,
                                            primary: true,
                                            characteristics: [
                                                TestProfile.Read,
                                                TestProfile.ReadBlob,
                                                TestProfile.Write,
                                                TestProfile.WriteBlob,
                                                TestProfile.WriteWithoutResponse,
                                                TestProfile.WriteBlobWithoutResponse,
                                                //TestProfile.Notify
        ])
    
    public static let Read = Characteristic(uuid: BluetoothUUID(rawValue: "E77D264C-F96F-11E5-80E0-23E070D5A8C7")!,
                                            value: "Test Read-Only".data(using: .utf8)!,
                                            permissions: [.read],
                                            properties: [.read])
    
    public static let ReadBlob = Characteristic(uuid: BluetoothUUID(rawValue: "0615FF6C-0E37-11E6-9E58-75D7DC50F6B1")!,
                                                value: Data(bytes: [UInt8](repeating: UInt8.max, count: 512)),
                                                permissions: [.read],
                                                properties: [.read])
    
    public static let Write = Characteristic(uuid: BluetoothUUID(rawValue: "37BBD7D0-F96F-11E5-8EC1-23E070D5A8C7")!,
                                             value: Data(),
                                             permissions: [.write],
                                             properties: [.write])
    
    public static let WriteValue = "Test Write".data(using: .utf8)!
    
    public static let WriteWithoutResponse = Characteristic(uuid: BluetoothUUID(rawValue: "AFE458FE-55BE-4D99-8C22-82FACE077D86")!,
                                                            value: Data(),
                                                            permissions: [.write],
                                                            properties: [.write, .writeWithoutResponse])
    
    public static let WriteBlob = Characteristic(uuid: BluetoothUUID(rawValue: "2FDDB448-F96F-11E5-A891-23E070D5A8C7")!,
                                                 value: Data(),
                                                 permissions: [.write],
                                                 properties: [.write])
    
    public static let WriteBlobValue = Data([UInt8](repeating: 0xAA, count: 512))
    
    public static let WriteBlobWithoutResponse = Characteristic(uuid: BluetoothUUID(rawValue: "D4A6E516-C867-4582-BF66-0A02BD854613")!,
                                                                value: Data(),
                                                                permissions: [.write],
                                                                properties: [.write, .writeWithoutResponse])
    
    public static let Notify = Characteristic(uuid: BluetoothUUID(rawValue: "7F799666-678C-41E7-9380-EEB713E532F6")!,
                                              value: Data(),
                                              permissions: [.read],
                                              properties: [.read, .notify],
                                              descriptors: [GATTClientCharacteristicConfiguration().descriptor])
    
    public static let TestDefinedService = Service(uuid: .savantSystems2,
                                                   primary: true,
                                                   characteristics: [
                                                    TestProfile.Read,
                                                    TestProfile.ReadBlob,
                                                    TestProfile.Write,
                                                    TestProfile.WriteBlob,
                                                    TestProfile.WriteWithoutResponse,
                                                    TestProfile.WriteBlobWithoutResponse
        ])
    
    public static let WriteValues: [BluetoothUUID: (data: Data, reliableWrites: Bool)] = [
        Write.uuid: (WriteValue, true),
        WriteBlob.uuid: (WriteBlobValue, true),
        WriteWithoutResponse.uuid: (WriteValue, false),
        WriteBlobWithoutResponse.uuid: (WriteBlobValue, false)
    ]
}
