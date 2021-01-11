//
//  VendorCommand.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 3/23/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

@frozen
public struct VendorCommand: HCICommand, Equatable, Hashable {
    
    public static let opcodeGroupField = HCIOpcodeGroupField.vendor
    
    public let rawValue: HCIOpcodeCommandField
    
    public init(rawValue: HCIOpcodeCommandField) {
        self.rawValue = rawValue
    }
}

// MARK: - Name

public extension VendorCommand {
    
    /// The names of the registered vendor commands.
    static var names = [VendorCommand: String]()
    
    var name: String {
        return type(of: self).names[self] ?? rawValue.toHexadecimal()
    }
}
