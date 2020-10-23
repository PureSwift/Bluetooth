//
//  GATTProfile.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/4/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

protocol GATTProfile {
    
    static var services: [GATTService.Type] { get }
}
