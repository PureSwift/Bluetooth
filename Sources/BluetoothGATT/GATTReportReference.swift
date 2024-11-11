//
//  GATTReportReference.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Bluetooth

/// GATT Report Reference Descriptor
///
/// Mapping information in the form of a Report ID and Report Type which maps the current parent characteristic to the Report ID(s) and Report Type (s) defined within the Report Map characteristic.
@frozen
public struct GATTReportReference: GATTDescriptor, Equatable, Hashable, Sendable {
    
    public static var uuid: BluetoothUUID { .reportReference }
        
    public var identifier: Identifier
    
    public var type: ReportType
    
    public init(identifier: Identifier, type: ReportType) {
        self.identifier = identifier
        self.type = type
    }
}

extension GATTReportReference: DataConvertible {
    
    public static var length: Int { 2 }
    
    public init?<Data: DataContainer>(data: Data) {
        
        guard data.count == Self.length
            else { return nil }
        
        guard let reportType = ReportType(rawValue: data[1])
            else { return nil }
        
        self.init(identifier: Identifier(rawValue: data[0]), type: reportType)
    }
    
    public func append<Data>(to data: inout Data) where Data : DataContainer {
        data += identifier.rawValue
        data += type.rawValue
    }
    
    public var dataLength: Int { Self.length }
}

// MARK: - Supporting Types

public extension GATTReportReference {
    
    /// GATT Report Type
    enum ReportType: UInt8, Sendable {
        
        /// Input Report
        case input = 0x01
        
        /// Output Report
        case output = 0x02
        
        /// Feature Report
        case feature = 0x03
    }
}

public extension GATTReportReference {
    
    struct Identifier: RawRepresentable, Equatable, Hashable, Sendable {
        
        public var rawValue: UInt8
        
        public init(rawValue: UInt8) {
            self.rawValue = rawValue
        }
    }
}

extension GATTReportReference.Identifier: CustomStringConvertible {
    
    public var description: String {
        return rawValue.description
    }
}

extension GATTReportReference.Identifier: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt8) {
        self.init(rawValue: value)
    }
}
