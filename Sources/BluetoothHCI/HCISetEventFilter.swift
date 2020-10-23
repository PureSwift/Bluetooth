//
//  HCISetEventFilter.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/14/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

// MARK: - Command

/**
 Set Event Filter Command
 
 Used by the Host to specify different event filters.
 
 The Host may issue this command multiple times to request various conditions for the same type of event filter and for different types of event filters. The event filters are used by the Host to specify items of interest, which allow the BR/EDR Controller to send only events which interest the Host. Only some of the events have event filters. By default (before this command has been issued after power-on or Reset) no filters are set, and the Auto_Accept_Flag is off (incoming connections are not automatically accepted). An event filter is added each time this command is sent from the Host and the Filter_Condition_Type is not equal to 0x00. (The old event filters will not be overwritten). To clear all event filters, the Filter_Type = 0x00 is used. The Auto_Accept_Flag will then be set to off. To clear event filters for only a certain Filter_Type, the Filter_Condition_Type = 0x00 is used.
 
 The Inquiry Result filter allows the BR/EDR Controller to filter out Inquiry Result, Inquiry Result with RSSI, or Extended Inquiry Result events. The Inquiry Result filter allows the Host to specify that the BR/EDR Controller only sends Inquiry Results to the Host if the report meets one of the specified conditions set by the Host. For the Inquiry Result filter, the Host can specify one or more of the following Filter Condition Types:
 
 1. Return responses from all devices during the Inquiry process
 
 2. A device with a specific Class of Device responded to the Inquiry process 3. A device with a specific BD_ADDR responded to the Inquiry process
 
 The Inquiry Result filter is used in conjunction with the Inquiry and Periodic Inquiry command.
 
 The Connection Setup filter allows the Host to specify that the Controller only sends a Connection Complete or Connection Request event to the Host if the event meets one of the specified conditions set by the Host. For the Connection Setup filter, the Host can specify one or more of the following Filter Condition Types:
 
 1. Allow Connections from all devices
 
 2. Allow Connections from a device with a specific Class of Device 3. Allow Connections from a device with a specific BD_ADDR
 
 For each of these conditions, an Auto_Accept_Flag parameter allows the Host to specify what action should be done when the condition is met. The Auto_ Accept_Flag allows the Host to specify if the incoming connection should be auto accepted (in which case the BR/EDR Controller will send the Connection Complete event to the Host when the connection is completed) or if the Host should make the decision (in which case the BR/EDR Controller will send the Connection Request event to the Host, to elicit a decision on the connection).
 
 The Connection Setup filter is used in conjunction with the Read/Write_ Scan_Enable commands. If the local device is in the process of a page scan, and is paged by another device which meets one on the conditions set by the Host, and the Auto_Accept_Flag is off for this device, then a Connection Request event will be sent to the Host by the BR/EDR Controller. A Connection Complete event will be sent later on after the Host has responded to the incoming connection attempt. In this same example, if the Auto_Accept_Flag is on, then a Connection Complete event will be sent to the Host by the Controller. (No Connection Request event will be sent in that case.)
 
 The BR/EDR Controller will store these filters in volatile memory until the Host clears the event filters using the Set_Event_Filter command or until the Reset command is issued. The number of event filters the BR/EDR Controller can store is implementation dependent. If the Host tries to set more filters than the BR/EDR Controller can store, the BR/EDR Controller will return the Memory Full error code and the filter will not be installed.
 
 - Note: The Clear All Filters has no Filter Condition Types or Conditions.
 
 - Note: In the condition that a connection is auto accepted, a Link Key Request event and possibly also a PIN Code Request event and a Link Key Notification event could be sent to the Host by the Controller before the Connection Complete event is sent.
 
 If there is a contradiction between event filters, the latest set event filter will override older ones. An example is an incoming connection attempt where more than one Connection Setup filter matches the incoming connection attempt, but the Auto-Accept_Flag has different values in the different filters.
 */
public struct HCISetEventFilter: HCICommandParameter {
    
    public static let command = HostControllerBasebandCommand.setEventFilter
    
    ///
    public var filterType: FilterType // Filter_Type
    
    public var data: Data {
        
        fatalError("\(#function) TODO")
    }
    
    public enum FilterType: UInt8 {
        
        /// Clear All Filters
        ///
        /// - Note: In this case, the Filter_Condition_Type and Condition parameters should not be given,
        /// they should have a length of 0 octets.
        ///
        /// Filter_Type should be the only parameter.
        case clearAll = 0x00
        
        /// Inquiry Result.
        case inquiryResult = 0x01
        
        /// Connection Setup
        case connectionSetup = 0x02
    }
    
    public enum InquiryResultFilterConditionType: UInt8 {
        
        /// Return responses from all devices during the Inquiry process.
        ///
        /// - Note: A device may be reported to the Host in an Inquiry Result, Inquiry Result with RSSI,
        /// or Extended Inquiry Result event more than once during an inquiry or inquiry period depending
        /// on the implementation.
        case all
        
        /// A device with a specific Class of Device responded to the Inquiry process.
        case classOfDevice
        
        /// A device with a specific `BD_ADDR` responded to the Inquiry process.
        case address
    }
}
