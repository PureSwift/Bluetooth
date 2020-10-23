//
//  GAPManufacturerSpecificData.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/**
 The Manufacturer Specific data type is used for manufacturer specific data.
 The first two data octets shall contain a company identifier code from the Assigned Numbers - Company Identifiers document.
 The interpretation of any other octets within the data shall be defined by the manufacturer specified by the company identifier.
 
 Size: 2 or more octets
 The first 2 octets contain the Company Identifier Code followed by additional manufacturer specific data
 */
public struct GAPManufacturerSpecificData: GAPData {
    
    public static var dataType: GAPDataType { return .manufacturerSpecificData }
    
    @usableFromInline
    internal private(set) var storage: Storage
    
    public var companyIdentifier: CompanyIdentifier {
        get {
            switch storage {
            case let .data(data):
                return CompanyIdentifier(rawValue: UInt16(littleEndian: UInt16(bytes: (data[0], data[1]))))
            case let .inline(value):
                return value.companyIdentifier
            }
        }
        set {
            self.storage = .init(
                companyIdentifier: newValue,
                additionalData: additionalData
            )
        }
    }
    
    public var additionalData: Data {
        get {
            switch storage {
            case let .data(data):
                // will have to copy each time.
                return data.suffixCheckingBounds(from: 2)
            case let .inline(value):
                return value.additionalData
            }
        }
        set {
            self.storage = .init(
                companyIdentifier: companyIdentifier,
                additionalData: newValue
            )
        }
    }
    
    public init(companyIdentifier: CompanyIdentifier,
                additionalData: Data = Data()) {
        
        self.storage = .init(
            companyIdentifier: companyIdentifier,
            additionalData: additionalData
        )
    }
    
    public init?(data: Data) {
        
        guard data.count >= 2
            else { return nil }
        
        self.storage = .init(data: data)
    }
    
    public var dataLength: Int {
        return storage.dataLength
    }
    
    public func append(to data: inout Data) {
        storage.append(to: &data)
    }
}

// MARK: - Equatable

extension GAPManufacturerSpecificData: Equatable {
    
    public static func == (lhs: GAPManufacturerSpecificData, rhs: GAPManufacturerSpecificData) -> Bool {
        
        switch (lhs.storage, rhs.storage) {
        case let (.inline(lhsValue), .inline(rhsValue)):
            // fast path
            return lhsValue == rhsValue
        case let (.data(lhsData), .data(rhsData)):
            // fast comparison
            return lhsData == rhsData
        default:
            // slow path
            return lhs.companyIdentifier == rhs.companyIdentifier
                && lhs.storage.withUnsafeAdditionalData { (lhsAdditionalData) in
                    rhs.storage.withUnsafeAdditionalData { $0 == lhsAdditionalData }
                }
        }
    }
}

// MARK: - Hashable

extension GAPManufacturerSpecificData: Hashable {
    
    public func hash(into hasher: inout Hasher) {
        
        /*
        hasher.combine(companyIdentifier)
        storage.withUnsafeAdditionalData {
            $0?.withUnsafeBytes { hasher.combine(bytes: $0) }
        }*/
        
        switch storage {
        case let .inline(value):
            hasher.combine(value.companyIdentifier)
            value.additionalData.withUnsafeBytes { hasher.combine(bytes: $0) }
        case let .data(data):
            hasher.combine(companyIdentifier)
            if data.count > 2 {
                data.withUnsafeBytes(in: 2 ..< data.count) {
                    hasher.combine(bytes: $0)
                }
            } else {
                Data().withUnsafeBytes { hasher.combine(bytes: $0) }
            }
        }
    }
}

// MARK: - Supporting Types

internal extension GAPManufacturerSpecificData {
    
    @usableFromInline
    enum Storage {
        case inline(Inline)
        case data(Data)
        //case advertisingData(LowEnergyAdvertisingData)
    }
}

internal extension GAPManufacturerSpecificData.Storage {
    
    @usableFromInline
    init(data: Data) {
        assert(data.count > 2)
        self = .data(data)
    }
    
    @usableFromInline
    init(companyIdentifier: CompanyIdentifier,
         additionalData: Data) {
        
        let value = GAPManufacturerSpecificData.Inline(
            companyIdentifier: companyIdentifier,
            additionalData: additionalData
        )
        self = .inline(value)
    }
    
    @usableFromInline
    var dataLength: Int {
        switch self {
        case let .inline(value):
            return value.dataLength
        case let .data(data):
            return data.count
        }
    }
    
    @usableFromInline
    func append(to output: inout Data) {
        switch self {
        case let .inline(value):
            return value.append(to: &output)
        case let .data(data):
            return output.append(data)
        }
    }
    
    /// Direct access to memory
    @usableFromInline
    func withUnsafeAdditionalData <Result> (_ block: (Data?) throws -> Result) rethrows -> Result {
        
        switch self {
        case let .inline(value):
            return try block(value.additionalData)
        case let .data(data):
            if data.count > 2 {
                return try block(data.subdataNoCopy(in: 2 ..< data.count))
            } else {
                return try block(Data())
            }
        }
    }
}

internal extension GAPManufacturerSpecificData {
    
    @usableFromInline
    struct Inline: Equatable {
        public var companyIdentifier: CompanyIdentifier
        public var additionalData: Data
    }
}

internal extension GAPManufacturerSpecificData.Inline {
    
    init?(data: Data) {
        
        guard data.count >= 2
            else { return nil }
        
        self.companyIdentifier = CompanyIdentifier(rawValue: UInt16(littleEndian: UInt16(bytes: (data[0], data[1]))))
        self.additionalData = data.suffixCheckingBounds(from: 2)
    }
    
    var dataLength: Int {
        return 2 + additionalData.count
    }
    
    func append(to data: inout Data) {
        data += companyIdentifier.rawValue.littleEndian
        data += additionalData
    }
}
