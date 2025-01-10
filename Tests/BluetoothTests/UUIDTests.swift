//
//  UUIDTests.swift
//  BluetoothTests
//
//  Created by Alsey Coleman Miller on 4/4/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Testing
import Foundation
@testable import Bluetooth

@Suite struct UUIDTests {
    
    @Test func length() {
        
        let uuid = UUID()
        
        #expect(Data(uuid).count == UUID.length)
        #expect(uuid.uuidString.utf8.count == UUID.stringLength)
        #expect(uuid.uuidString.replacingOccurrences(of: "-", with: "").utf8.count == UUID.unformattedStringLength)
    }
    
    @Test func byteValue() {
        
        #expect(UUID.bitWidth == MemoryLayout<UUID.ByteValue>.size * 8)
        #expect(UUID.bitWidth == 128)
        
        let uuid = UUID()
        
        #expect(uuid.bytes.0 == uuid.uuid.0)
        #expect(uuid.bytes.1 == uuid.uuid.1)
        #expect(uuid.bytes.2 == uuid.uuid.2)
        #expect(uuid.bytes.3 == uuid.uuid.3)
        #expect(uuid.bytes.4 == uuid.uuid.4)
        #expect(uuid.bytes.5 == uuid.uuid.5)
        #expect(uuid.bytes.6 == uuid.uuid.6)
        #expect(uuid.bytes.7 == uuid.uuid.7)
        #expect(uuid.bytes.8 == uuid.uuid.8)
        #expect(uuid.bytes.9 == uuid.uuid.9)
        #expect(uuid.bytes.10 == uuid.uuid.10)
        #expect(uuid.bytes.11 == uuid.uuid.11)
        #expect(uuid.bytes.12 == uuid.uuid.12)
        
        #expect(UUID(uuid: uuid.bytes) == uuid)
        
        var mutatedUUID = uuid
        mutatedUUID.bytes = UUID().bytes
        #expect(mutatedUUID != uuid)
    }
    
    @Test func data() {
        
        let uuid = UUID()
        
        #expect(Data(uuid).count == UUID.length)
        #expect(UUID(data: Data(uuid)) == uuid)
    }
    
    @Test func equality() {
        let uuidA = _UUID(uuidString: "E621E1F8-C36C-495A-93FC-0C247A3E6E5F")
        let uuidB = _UUID(uuidString: "e621e1f8-c36c-495a-93fc-0c247a3e6e5f")
        let uuidC = _UUID(uuid: (0xe6,0x21,0xe1,0xf8,0xc3,0x6c,0x49,0x5a,0x93,0xfc,0x0c,0x24,0x7a,0x3e,0x6e,0x5f))
        let uuidD = _UUID()

        #expect(uuidA == uuidB, "String case must not matter.")
        #expect(uuidA == uuidC, "A UUID initialized with a string must be equal to the same UUID initialized with its UnsafePointer<UInt8> equivalent representation.")
        #expect(uuidC != uuidD, "Two different UUIDs must not be equal.")
    }

    @Test func invalid() {
        let invalid = _UUID(uuidString: "Invalid UUID")
        #expect(invalid == nil, "The convenience initializer `init?(uuidString string:)` must return nil for an invalid UUID string.")
    }

    // `uuidString` should return an uppercase string
    // See: https://bugs.swift.org/browse/SR-865
    @Test func string() {
        let uuid = _UUID(uuid: (0xe6,0x21,0xe1,0xf8,0xc3,0x6c,0x49,0x5a,0x93,0xfc,0x0c,0x24,0x7a,0x3e,0x6e,0x5f))
        #expect(uuid.uuidString == "E621E1F8-C36C-495A-93FC-0C247A3E6E5F", "The uuidString representation must be uppercase.")
    }

    @Test func description() {
        let uuid = _UUID()
        let description: String = uuid.description
        let uuidString: String = uuid.uuidString
        #expect(description == uuidString, "The description must be the same as the uuidString.")
    }

    @Test func anyHashableContainingUUID() {
        let values: [_UUID] = [
            _UUID(uuidString: "e621e1f8-c36c-495a-93fc-0c247a3e6e5f")!,
            _UUID(uuidString: "f81d4fae-7dec-11d0-a765-00a0c91e6bf6")!,
            _UUID(uuidString: "f81d4fae-7dec-11d0-a765-00a0c91e6bf6")!,
        ]
        let anyHashables = values.map(AnyHashable.init)
        #expect(_UUID.self == type(of: anyHashables[0].base))
        #expect(_UUID.self == type(of: anyHashables[1].base))
        #expect(_UUID.self == type(of: anyHashables[2].base))
        #expect(anyHashables[0] != anyHashables[1])
        #expect(anyHashables[1] == anyHashables[2])
    }

    @Test func customMirror() {
        let uuid = _UUID(uuidString: "89E90DC6-5EBA-41A8-A64D-81D3576EE46E")!
        #expect(String(reflecting: uuid) == "89E90DC6-5EBA-41A8-A64D-81D3576EE46E")
    }
    
    @Test func comparable() throws {
        
        var uuid1 = try #require(_UUID(uuidString: "00000000-0000-0000-0000-000000000001"))
        var uuid2 = try #require(_UUID(uuidString: "00000000-0000-0000-0000-000000000002"))
        #expect((uuid1 < uuid2))
        #expect(!(uuid2 < uuid1))
        #expect(uuid2 != uuid1)
        
        uuid1 = try #require(_UUID(uuidString: "9707CE8D-251F-4858-8BF9-C9EC3D690FCE"))
        uuid2 = try #require(_UUID(uuidString: "9807CE8D-251F-4858-8BF9-C9EC3D690FCE"))
        #expect(uuid1 < uuid2)
        #expect(!(uuid2 < uuid1))
        #expect(uuid2 != uuid1)
        
        uuid1 = try #require(_UUID(uuidString: "9707CE8D-261F-4858-8BF9-C9EC3D690FCE"))
        uuid2 = try #require(_UUID(uuidString: "9707CE8D-251F-4858-8BF9-C9EC3D690FCE"))
        #expect(uuid1 > uuid2)
        #expect(!(uuid2 > uuid1))
        #expect(uuid2 != uuid1)
        
        uuid1 = try #require(_UUID(uuidString: "9707CE8D-251F-4858-8BF9-C9EC3D690FCE"))
        uuid2 = try #require(_UUID(uuidString: "9707CE8D-251F-4858-8BF9-C9EC3D690FCE"))
        #expect(!(uuid1 > uuid2))
        #expect(!(uuid2 > uuid1))
        #expect(uuid2 == uuid1)
    }
}
