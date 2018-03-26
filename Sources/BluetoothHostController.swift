//
//  BluetoothHostController.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 3/25/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

/// Bluetooth HCI controller.
public protocol BluetoothHostControllerInterface {
    
    /// All controllers on the host.
    static var controllers: [Self] { get }
    
    /// The default controller on the host.
    static var `default`: Self? { get }
    
    /// The Bluetooth Address of the controller.
    var address: Address { get }
    
    
}

/// Bluetooth HCI errors
public enum BluetoothHostControllerError: Error {
    
    /// The specified adapter could not be found.
    case adapterNotFound
    
    /// A method that changed the adapter's filter had an internal error,
    /// and unsuccessfully tried to restore the previous filter.
    ///
    /// First error is the method's error.
    /// The second error is the error while trying to restore the filter.
    case couldNotRestoreFilter(Error, Error)
    
    /// The recieved data could not be parsed correctly.
    case garbageResponse(Data)
}

public extension BluetoothHostControllerInterface {
    
    static var `default`: Self? {
        
        return controllers.first
    }
}
