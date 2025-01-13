//
//  HCILowEnergyMetaEvent.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Bluetooth

/// HCI Low Energy Meta Event
@frozen
public struct HCILowEnergyMetaEvent<EventData: DataContainer>: HCIEventParameter {

    public static var event: HCIGeneralEvent { .lowEnergyMeta }

    public static var length: Int { 1 }  // 1 ... HCI.maximumEventSize

    public let subevent: LowEnergyEvent
    public let eventData: EventData

    public init?<Data: DataContainer>(data: Data) {

        guard data.count >= HCILowEnergyMetaEvent.length,
            let subevent = LowEnergyEvent(rawValue: data[0])
        else { return nil }

        self.subevent = subevent

        if data.count > 1 {

            self.eventData = EventData(data.suffix(from: 1))

        } else {

            self.eventData = EventData()
        }
    }
}
