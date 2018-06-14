//
//  GATTReportReference.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Report Reference
/// GATT Report Reference Descriptor
///
/// Mapping information in the form of a Report ID and Report Type which maps the current parent characteristic to the Report ID(s) and Report Type (s) defined within the Report Map characteristic.
public struct GATTReportReference: GATTDescriptor {
    
    public static let uuid: BluetoothUUID = .reportReference
    
    public static let length = 2
    
    public var identifier: Identifier
    
    public var type: ReportType
    
    public init(identifier: Identifier, type: ReportType) {
        
        self.identifier = identifier
        self.type = type
    }
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        guard let reportType = ReportType(rawValue: data[1])
            else { return nil }
        
        self.init(identifier: Identifier(rawValue: data[0]), type: reportType)
    }
    
    public var data: Data {
        
        return Data([identifier.rawValue, type.rawValue])
    }
    
    public var descriptor: GATT.Descriptor {
        
        return GATT.Descriptor(uuid: type(of: self).uuid,
                               value: data,
                               permissions: [.read])
    }
}

public extension GATTReportReference {
    
    /// GATT Report Type
    public enum ReportType: UInt8 {
        
        /// Input Report
        case input = 0x01
        
        /// Output Report
        case output = 0x02
        
        /// Feature Report
        case feature = 0x03
    }
}

public extension GATTReportReference {
    
    public struct Identifier: RawRepresentable {
        
        public var rawValue: UInt8
        
        public init(rawValue: UInt8) {
            
            self.rawValue = rawValue
        }
    }
}

extension GATTReportReference.Identifier: Equatable {
    
    public static func == (lhs: GATTReportReference.Identifier,
                           rhs: GATTReportReference.Identifier) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
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
