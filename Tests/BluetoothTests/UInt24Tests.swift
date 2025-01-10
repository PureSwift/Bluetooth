//
//  UInt24Tests.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/28/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//


import Testing
import Foundation
@testable import Bluetooth

@Suite struct UInt24Tests {
    
    @Test func bitWidth() {
        
        #expect(UInt24.bitWidth == MemoryLayout<UInt24.ByteValue>.size * 8)
        #expect(UInt24.bitWidth == 24)
    }
    
    @Test func comparable() {
        
        #expect(UInt24.zero == 0)
        #expect(UInt24.min == 0)
        #expect(UInt24.max == 16777215)
        #expect(UInt24.max == 0xFFFFFF)
        #expect(0xFFFFFF <= UInt24.max)
        #expect(0xFFFFFE < UInt24.max)
        #expect(0xFFFFFF >= UInt24.max)
        #expect(UInt24.max > 0xFFFFFE)
    }
    
    @Test func hashable() {
        
        #expect(UInt24.max.hashValue != 0)
    }
    
    @Test func hexadecimal() {
        
        let testData: [(UInt24, String)] = [
            (.zero,     "000000"),
            (0x000000,  "000000"),
            (0x000001,  "000001"),
            (0x000020,  "000020"),
            (0xABCDEF,  "ABCDEF"),
            (16777215,  "FFFFFF"),
            (0xFFFFFF,  "FFFFFF"),
            (.max,      "FFFFFF")
        ]
        
        for (value, hexadecimal) in testData {
            #expect(String(UInt32(value).toHexadecimal().suffix(6)) == hexadecimal)
            #expect(UInt32(hexadecimal, radix: 16) == UInt32(value))
            #expect(UInt32(parse: hexadecimal, radix: 16) == UInt32(value))
        }
    }
    
    @Test func expressibleByIntegerLiteral() {
        
        let values: [(UInt24, String)] = [
            (.zero,     "0"),
            (0x000000,  "0"),
            (0x000001,  "1"),
            (0x000020,  "32"),
            (0xABCDEF,  "11259375"),
            (16777215,  "16777215"),
            (0xFFFFFF,  "16777215")
        ]
        
        values.forEach { #expect($0.description == $1)  }
    }
    
    @Test func data() {
        
        let data = Data([0xFF, 0xFF, 0xFF])
        
        #expect(UInt24(data: data) == 16777215)
        #expect(Data(UInt24.max) == data)
    }
    
    @Test func codable() throws {
        
        struct Value: Equatable, Hashable, Codable {
            let id: UInt24
        }
        
        let value = Value(id: UInt24.max)
        let encoder = JSONEncoder()
        let data = try encoder.encode(value)
        #expect(String(data: data, encoding: .utf8) == #"{"id":16777215}"#)
        let decoder = JSONDecoder()
        let decodedValue = try decoder.decode(Value.self, from: data)
        #expect(value == decodedValue)
    }
}
