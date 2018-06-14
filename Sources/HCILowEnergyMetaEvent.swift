//
//  HCILowEnergyMetaEvent.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/// HCI Low Energy Meta Event
public struct HCILowEnergyMetaEvent: HCIEventParameter {
    
    public static let event = HCIGeneralEvent.lowEnergyMeta
    public static let length = 1 // 1 ... HCI.maximumEventSize
    
    public let subevent: LowEnergyEvent
    public let eventData: Data
    
    public init?(data: Data) {
        
        guard data.count >= HCILowEnergyMetaEvent.length,
            let subevent = LowEnergyEvent(rawValue: data[0])
            else { return nil }
        
        self.subevent = subevent
        
        if data.count > 1 {
            
            self.eventData = Data(data.suffix(from: 1))
            
        } else {
            
            self.eventData = Data()
        }
    }
}
