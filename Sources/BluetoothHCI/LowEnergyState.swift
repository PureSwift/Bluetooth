//
//  LowEnergyState.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 4/3/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

/// Possible Low Energy States and roles.
@frozen
public enum LowEnergyState: Int, BitMaskOption {
    
    /// Scannable Advertising State
    case scannableAdvertising                   = 0b01 // 0x0001  // LE_STATE_SCAN_ADV
    
    /// Connectable Advertising State
    case connectableAdvertising                 = 0b10 // 0x0002  // LE_STATE_CONN_ADV
    
    /// Non-Connectable Advertising State
    case nonConnectableAdvertising              = 0b100 // 0x0004 // LE_STATE_NONCONN_ADV
    
    /// High Duty Cycle Directed Advertising State
    case highDutyCycleDirectedAdvertising       = 0b1000 // LE_STATE_HIGH_DIRECT_ADV 0x0008
    
    case lowDutyCycleDirectedAdvertising        = 0b10000 // LE_STATE_LOW_DIRECT_ADV 0x0010
    
    case activeScanning                         = 0b100000 // LE_STATE_ACTIVE_SCAN 0x0020
    
    case passiveScanning                        = 0b1000000 // LE_STATE_PASSIVE_SCAN 0x0040
    
    case initiating                             = 0b10000000 // LE_STATE_INITIATING 0x0080
    
    case connectionMaster                       = 0b100000000 // LE_STATE_MASTER_MASTER 0x0100
    
    case connectionSlave                        = 0b1000000000 // LE_STATE_SLAVE_SLAVE 0x0200
    
    public static let allCases: [LowEnergyState] = [
        .scannableAdvertising,
        .connectableAdvertising,
        .nonConnectableAdvertising,
        .highDutyCycleDirectedAdvertising,
        .lowDutyCycleDirectedAdvertising,
        .activeScanning,
        .passiveScanning,
        .initiating,
        .connectionMaster,
        .connectionSlave
    ]
}

public extension LowEnergyState {
    
    var name: String {
        
        guard let name = lowEnergyStateNames[self]
            else { fatalError("No name for \(self)") }
        
        return name
    }
}

extension LowEnergyState: CustomStringConvertible {
    
    public var description: String {
        
        return name
    }
}

/// The states and state combinations that the link layer supports.
@frozen
public enum LowEnergyStateSet: UInt64 {
    
    case state0  = 0b01
    case state1  = 0b10
    case state2  = 0b100
    case state3  = 0b1000
    case state4  = 0b10000
    case state5  = 0b100000
    case state6  = 0b1000000
    case state7  = 0b10000000
    case state8  = 0b100000000
    case state9  = 0b1000000000
    case state10 = 0b10000000000
    case state11 = 0b100000000000
    case state12 = 0b1000000000000
    case state13 = 0b10000000000000
    case state14 = 0b100000000000000
    case state15 = 0b1000000000000000
    case state16 = 0b10000000000000000
    case state17 = 0b100000000000000000
    case state18 = 0b1000000000000000000
    case state19 = 0b10000000000000000000
    case state20 = 0b100000000000000000000
    case state21 = 0b1000000000000000000000
    case state22 = 0b10000000000000000000000
    case state23 = 0b100000000000000000000000
    case state24 = 0b1000000000000000000000000
    case state25 = 0b10000000000000000000000000
    case state26 = 0b100000000000000000000000000
    case state27 = 0b1000000000000000000000000000
    case state28 = 0b10000000000000000000000000000
    case state29 = 0b100000000000000000000000000000
    case state30 = 0b1000000000000000000000000000000
    case state31 = 0b10000000000000000000000000000000
    case state32 = 0b100000000000000000000000000000000
    case state33 = 0b1000000000000000000000000000000000
    case state34 = 0b10000000000000000000000000000000000
    case state35 = 0b100000000000000000000000000000000000
    case state36 = 0b1000000000000000000000000000000000000
    case state37 = 0b10000000000000000000000000000000000000
    case state38 = 0b100000000000000000000000000000000000000
    case state39 = 0b1000000000000000000000000000000000000000
    case state40 = 0b10000000000000000000000000000000000000000
    case state41 = 0b100000000000000000000000000000000000000000
}

// MARK: - Values

public extension LowEnergyStateSet {
    
    var states: BitMaskOptionSet<LowEnergyState> {
        
        guard let states = lowEnergyStates[self]
            else { fatalError("Invalid state \(self)") }
        
        return states
    }
}

// MARK: - Private Values

internal let lowEnergyStates: [LowEnergyStateSet: (BitMaskOptionSet<LowEnergyState>)] = [
    
    .state0: ([.nonConnectableAdvertising]),
    .state1: ([.scannableAdvertising]),
    .state2: ([.connectableAdvertising]),
    .state3: ([.highDutyCycleDirectedAdvertising]),
    .state4: ([.passiveScanning]),
    .state5: ([.activeScanning]),
    .state6: ([.initiating]),
    .state7: ([.connectionSlave]),
    .state8: ([.nonConnectableAdvertising, .passiveScanning]),
    .state9: ([.scannableAdvertising, .passiveScanning]),
    .state10: ([.connectableAdvertising, .passiveScanning]),
    .state11: ([.highDutyCycleDirectedAdvertising, .passiveScanning]),
    .state12: ([.nonConnectableAdvertising, .activeScanning]),
    .state13: ([.scannableAdvertising, .activeScanning]),
    .state14: ([.connectableAdvertising, .activeScanning]),
    .state15: ([.highDutyCycleDirectedAdvertising, .activeScanning]),
    .state16: ([.nonConnectableAdvertising, .initiating]),
    .state17: ([.scannableAdvertising, .initiating]),
    .state18: ([.nonConnectableAdvertising, .connectionMaster]),
    .state19: ([.scannableAdvertising, .connectionMaster]),
    .state20: ([.nonConnectableAdvertising, .connectionSlave]),
    .state21: ([.scannableAdvertising, .connectionSlave]),
    .state22: ([.passiveScanning, .initiating]),
    .state23: ([.activeScanning, .initiating]),
    .state24: ([.passiveScanning, .connectionMaster]),
    .state25: ([.activeScanning, .connectionMaster]),
    .state26: ([.passiveScanning, .connectionSlave]),
    .state27: ([.activeScanning, .connectionSlave]),
    .state28: ([.initiating, .connectionMaster]),
    .state29: ([.lowDutyCycleDirectedAdvertising]),
    .state30: ([.lowDutyCycleDirectedAdvertising, .passiveScanning]),
    .state31: ([.lowDutyCycleDirectedAdvertising, .activeScanning]),
    .state32: ([.connectableAdvertising, .initiating]),
    .state33: ([.highDutyCycleDirectedAdvertising, .initiating]),
    .state34: ([.lowDutyCycleDirectedAdvertising, .initiating]),
    .state35: ([.connectableAdvertising, .connectionMaster]),
    .state36: ([.highDutyCycleDirectedAdvertising, .connectionMaster]),
    .state37: ([.lowDutyCycleDirectedAdvertising, .connectionMaster]),
    .state38: ([.connectableAdvertising, .connectionSlave]),
    .state39: ([.highDutyCycleDirectedAdvertising, .connectionSlave]),
    .state40: ([.lowDutyCycleDirectedAdvertising, .connectionSlave]),
    .state41: ([.initiating, .connectionSlave])
    
]

// swiftlint:disable colon
internal let lowEnergyStateNames: [LowEnergyState: String] = [
    .scannableAdvertising            : "Scannable Advertising State",
    .connectableAdvertising          : "Connectable Advertising State",
    .nonConnectableAdvertising       : "Non-connectable Advertising State",
    .highDutyCycleDirectedAdvertising: "High Duty Cycle Directed Advertising State",
    .lowDutyCycleDirectedAdvertising : "Low Duty Cycle Directed Advertising State",
    .activeScanning                  : "Active Scanning State",
    .passiveScanning                 : "Passive Scanning State",
    .initiating                      : "Initiating State",
    .connectionMaster                : "Connection State(Master Role)",
    .connectionSlave                 : "Connection State(Slave Role)"
]
// swiftlint:enable colon
