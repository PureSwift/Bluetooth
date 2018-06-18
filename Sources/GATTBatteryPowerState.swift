//
//  GATTBatteryPowerState.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/18/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

/**
 Battery Power State
 
 [Battery Power State](https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.battery_power_state.xml)
 */
public struct GATTBatteryPowerState: GATTCharacteristic {
    
    internal static let length = MemoryLayout<UInt8>.size
    
    public static var uuid: BluetoothUUID { return .batteryPowerState }
    
    public var states: BitMaskOptionSet<State>
    
    public init(states: BitMaskOptionSet<State>) {
        
        self.states = states
    }
    
    public init?(data: Data) {
        
        guard data.count == type(of: self).length
            else { return nil }
        
        let states = BitMaskOptionSet<State>(rawValue: data[0])
        
        self.init(states: states)
    }
    
    public var data: Data {
        
        return Data([states.rawValue])
    }
    
    public enum State: UInt8, BitMaskOption {

        // Unknown
        case unknown = 0b00

        // Not Supported Present
        case notSupportedPresent = 0b01

        // Not Present
        case notPresent = 0b10

        // Present
        case present = 0b11

        // Not Supported Discharge
        case notSupportedDischarge = 0b0100

        // Not Discharging
        case notDischarging = 0b1000

        // Discharging
        case discharging = 0b1100
        
        // Not Chargeable
        case notChargeable = 0b010000
        
        // Not Charging
        case notCharging = 0b100000
        
        // Charging
        case charging = 0b110000
        
        // Not Supported
        case notSupported = 0b01000000
        
        // Good Level
        case goodLevel = 0b10000000
        
        // Critically Low
        case criticallyLow = 0b11000000

        public static var all: Set<State> = [
            .unknown,
            .notSupportedPresent,
            .notPresent,
            .present,
            .notSupportedDischarge,
            .notDischarging,
            .discharging,
            .notChargeable,
            .notCharging,
            .charging,
            .notSupported,
            .goodLevel,
            .criticallyLow
        ]
    }
}
extension GATTBatteryPowerState: Equatable {
    
    public static func == (lhs: GATTBatteryPowerState, rhs: GATTBatteryPowerState) -> Bool {
        
        return lhs.states == rhs.states
    }
}

extension GATTBatteryPowerState: CustomStringConvertible {
    
    public var description: String {
        
        return states.description
    }
}
