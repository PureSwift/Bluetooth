//
//  LocalName.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 3/26/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

public extension BluetoothHostControllerInterface {
    
    func writeLocalName(_ newValue: String, timeout: Int = HCI.defaultTimeout) throws {
        
        guard let command = HostControllerBasebandCommand.WriteLocalNameParameter(localName: newValue)
            else { fatalError("") }
        
        try deviceRequest(command, timeout: timeout)
    }
    
    func readLocalName(timeout: Int = HCI.defaultTimeout) throws -> String {
        
        let value = try deviceRequest(HostControllerBasebandCommand.ReadLocalNameReturnParameter.self,
                                      timeout: timeout)
        
        return value.localName
    }
}
