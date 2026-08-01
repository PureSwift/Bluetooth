//
//  Strings.swift
//  Bluetooth
//
//  Swift implementations of the SDP UUID/record string formatters,
//  bound to the declarations in the vendored `sdp_lib.h`.
//

import Bluetooth
import CBluetooth

/// `int sdp_uuid2strn(const uuid_t *uuid, char *str, size_t n)`
@c(sdp_uuid2strn)
public func sdp_uuid2strn(
    _ uuid: UnsafePointer<uuid_t>?,
    _ str: UnsafeMutablePointer<CChar>?,
    _ n: Int
) -> Int32 {
    guard let uuid else {
        writeTruncated("NULL", to: str, size: n)
        return -2
    }
    switch Int32(uuid.pointee.type) {
    case SDP_UUID16:
        writeTruncated(String(format4x: uuid.pointee.value.uuid16), to: str, size: n)
    case SDP_UUID32:
        writeTruncated(String(format8x: uuid.pointee.value.uuid32), to: str, size: n)
    case SDP_UUID128:
        writeTruncated(formatUUID128(uuid.pointee.value.uuid128), to: str, size: n)
    default:
        writeTruncated("Type of UUID (\(String(format: uuid.pointee.type))) unknown.", to: str, size: n)
        return -1
    }
    return 0
}

/// `int sdp_proto_uuid2strn(const uuid_t *uuid, char *str, size_t n)`
@c(sdp_proto_uuid2strn)
public func sdp_proto_uuid2strn(
    _ uuid: UnsafePointer<uuid_t>?,
    _ str: UnsafeMutablePointer<CChar>?,
    _ n: Int
) -> Int32 {
    uuidToString(protocolNames, uuid, str, n)
}

/// `int sdp_svclass_uuid2strn(const uuid_t *uuid, char *str, size_t n)`
@c(sdp_svclass_uuid2strn)
public func sdp_svclass_uuid2strn(
    _ uuid: UnsafePointer<uuid_t>?,
    _ str: UnsafeMutablePointer<CChar>?,
    _ n: Int
) -> Int32 {
    uuidToString(serviceClassNames, uuid, str, n)
}

/// `int sdp_profile_uuid2strn(const uuid_t *uuid, char *str, size_t n)`
///
/// The reference `#define`s `Profile` to `ServiceClass` — the same table.
@c(sdp_profile_uuid2strn)
public func sdp_profile_uuid2strn(
    _ uuid: UnsafePointer<uuid_t>?,
    _ str: UnsafeMutablePointer<CChar>?,
    _ n: Int
) -> Int32 {
    uuidToString(serviceClassNames, uuid, str, n)
}

/// `void sdp_record_print(const sdp_record_t *rec)`
///
/// `printf` is a variadic and not callable from Swift; since
/// `%.*s`'s precision here (`unitSize`) always exceeds the string's
/// real length by exactly the NUL terminator, `%.*s` stops at the NUL
/// regardless, so printing the plain string reproduces the same text.
@c(sdp_record_print)
public func sdp_record_print(_ rec: UnsafePointer<sdp_record_t>?) {
    if let d = sdp_data_get(rec, UInt16(SDP_ATTR_SVCNAME_PRIMARY)), isTextString(d.pointee.dtd), let str = d.pointee.val.str {
        print("Service Name: \(String(cString: str))")
    }
    if let d = sdp_data_get(rec, UInt16(SDP_ATTR_SVCDESC_PRIMARY)), isTextString(d.pointee.dtd), let str = d.pointee.val.str {
        print("Service Description: \(String(cString: str))")
    }
    if let d = sdp_data_get(rec, UInt16(SDP_ATTR_PROVNAME_PRIMARY)), isTextString(d.pointee.dtd), let str = d.pointee.val.str {
        print("Service Provider: \(String(cString: str))")
    }
}

// MARK: - Internal

/// `static int uuid2str(const struct tupla *message, const uuid_t *uuid, char *str, size_t n)`
private func uuidToString(
    _ table: [UInt32: String],
    _ uuid: UnsafePointer<uuid_t>?,
    _ str: UnsafeMutablePointer<CChar>?,
    _ n: Int
) -> Int32 {
    guard let uuid else {
        writeTruncated("NULL", to: str, size: n)
        return -2
    }
    switch Int32(uuid.pointee.type) {
    case SDP_UUID16:
        writeTruncated(table[UInt32(uuid.pointee.value.uuid16)] ?? "", to: str, size: n)
    case SDP_UUID32:
        writeTruncated(table[uuid.pointee.value.uuid32] ?? "", to: str, size: n)
    case SDP_UUID128:
        writeTruncated(lookupUUID(table, uuid.pointee), to: str, size: n)
    default:
        writeTruncated("Type of UUID (\(String(format: uuid.pointee.type))) unknown.", to: str, size: n)
        return -1
    }
    return 0
}

/// `static const char *string_lookup_uuid(const struct tupla *pt0, const uuid_t *uuid)`
private func lookupUUID(_ table: [UInt32: String], _ uuid: uuid_t) -> String {
    var tmp = uuid
    guard withUnsafeMutablePointer(to: &tmp, { sdp_uuid128_to_uuid($0) }) != 0 else {
        return ""
    }
    switch Int32(tmp.type) {
    case SDP_UUID16:
        return table[UInt32(tmp.value.uuid16)] ?? ""
    case SDP_UUID32:
        return table[tmp.value.uuid32] ?? ""
    default:
        return ""
    }
}

private func formatUUID128(_ value: uint128_t) -> String {
    withUnsafeBytes(of: value) { bytes in
        let data0 = bytes.loadUnaligned(fromByteOffset: 0, as: UInt32.self).bigEndian
        let data1 = bytes.loadUnaligned(fromByteOffset: 4, as: UInt16.self).bigEndian
        let data2 = bytes.loadUnaligned(fromByteOffset: 6, as: UInt16.self).bigEndian
        let data3 = bytes.loadUnaligned(fromByteOffset: 8, as: UInt16.self).bigEndian
        let data4 = bytes.loadUnaligned(fromByteOffset: 10, as: UInt32.self).bigEndian
        let data5 = bytes.loadUnaligned(fromByteOffset: 14, as: UInt16.self).bigEndian
        return "\(String(format8x: data0))-\(String(format4x: data1))-\(String(format4x: data2))-\(String(format4x: data3))-\(String(format8x: data4))\(String(format4x: data5))"
    }
}

extension String {
    /// `"%.4x"` — lowercase hex, zero-padded to (at least) 4 digits.
    fileprivate init(format4x value: UInt16) {
        self = String(value, radix: 16, uppercase: false)
        while count < 4 { self = "0" + self }
    }

    /// `"%.8x"` — lowercase hex, zero-padded to (at least) 8 digits.
    fileprivate init(format8x value: UInt32) {
        self = String(value, radix: 16, uppercase: false)
        while count < 8 { self = "0" + self }
    }

    /// `"%x"` — lowercase hex, no padding.
    fileprivate init(format value: UInt8) {
        self = String(value, radix: 16, uppercase: false)
    }
}

/// `snprintf(str, n, "%s", ...)` — truncating copy with a NUL terminator;
/// writes nothing when `n` is zero.
private func writeTruncated(_ string: String, to buffer: UnsafeMutablePointer<CChar>?, size: Int) {
    guard size > 0, let buffer else { return }
    let utf8 = Array(string.utf8)
    let count = min(utf8.count, size - 1)
    for index in 0..<count {
        buffer[index] = CChar(bitPattern: utf8[index])
    }
    buffer[count] = 0
}

/// The Protocol UUID name table.
private let protocolNames: [UInt32: String] = [
    UInt32(SDP_UUID): "SDP",
    UInt32(UDP_UUID): "UDP",
    UInt32(RFCOMM_UUID): "RFCOMM",
    UInt32(TCP_UUID): "TCP",
    UInt32(TCS_BIN_UUID): "TCS-BIN",
    UInt32(TCS_AT_UUID): "TCS-AT",
    UInt32(OBEX_UUID): "OBEX",
    UInt32(IP_UUID): "IP",
    UInt32(FTP_UUID): "FTP",
    UInt32(HTTP_UUID): "HTTP",
    UInt32(WSP_UUID): "WSP",
    UInt32(BNEP_UUID): "BNEP",
    UInt32(UPNP_UUID): "UPNP",
    UInt32(HIDP_UUID): "HIDP",
    UInt32(HCRP_CTRL_UUID): "HCRP-Ctrl",
    UInt32(HCRP_DATA_UUID): "HCRP-Data",
    UInt32(HCRP_NOTE_UUID): "HCRP-Notify",
    UInt32(AVCTP_UUID): "AVCTP",
    UInt32(AVDTP_UUID): "AVDTP",
    UInt32(CMTP_UUID): "CMTP",
    UInt32(UDI_UUID): "UDI",
    UInt32(MCAP_CTRL_UUID): "MCAP-Ctrl",
    UInt32(MCAP_DATA_UUID): "MCAP-Data",
    UInt32(L2CAP_UUID): "L2CAP",
    UInt32(ATT_UUID): "ATT"
]

/// The Service Class / Profile UUID name table.
private let serviceClassNames: [UInt32: String] = [
    UInt32(SDP_SERVER_SVCLASS_ID): "SDP Server",
    UInt32(BROWSE_GRP_DESC_SVCLASS_ID): "Browse Group Descriptor",
    UInt32(PUBLIC_BROWSE_GROUP): "Public Browse Group",
    UInt32(SERIAL_PORT_SVCLASS_ID): "Serial Port",
    UInt32(LAN_ACCESS_SVCLASS_ID): "LAN Access Using PPP",
    UInt32(DIALUP_NET_SVCLASS_ID): "Dialup Networking",
    UInt32(IRMC_SYNC_SVCLASS_ID): "IrMC Sync",
    UInt32(OBEX_OBJPUSH_SVCLASS_ID): "OBEX Object Push",
    UInt32(OBEX_FILETRANS_SVCLASS_ID): "OBEX File Transfer",
    UInt32(IRMC_SYNC_CMD_SVCLASS_ID): "IrMC Sync Command",
    UInt32(HEADSET_SVCLASS_ID): "Headset",
    UInt32(CORDLESS_TELEPHONY_SVCLASS_ID): "Cordless Telephony",
    UInt32(AUDIO_SOURCE_SVCLASS_ID): "Audio Source",
    UInt32(AUDIO_SINK_SVCLASS_ID): "Audio Sink",
    UInt32(AV_REMOTE_TARGET_SVCLASS_ID): "AV Remote Target",
    UInt32(ADVANCED_AUDIO_SVCLASS_ID): "Advanced Audio",
    UInt32(AV_REMOTE_SVCLASS_ID): "AV Remote",
    UInt32(AV_REMOTE_CONTROLLER_SVCLASS_ID): "AV Remote Controller",
    UInt32(INTERCOM_SVCLASS_ID): "Intercom",
    UInt32(FAX_SVCLASS_ID): "Fax",
    UInt32(HEADSET_AGW_SVCLASS_ID): "Headset Audio Gateway",
    UInt32(WAP_SVCLASS_ID): "WAP",
    UInt32(WAP_CLIENT_SVCLASS_ID): "WAP Client",
    UInt32(PANU_SVCLASS_ID): "PAN User",
    UInt32(NAP_SVCLASS_ID): "Network Access Point",
    UInt32(GN_SVCLASS_ID): "PAN Group Network",
    UInt32(DIRECT_PRINTING_SVCLASS_ID): "Direct Printing",
    UInt32(REFERENCE_PRINTING_SVCLASS_ID): "Reference Printing",
    UInt32(IMAGING_SVCLASS_ID): "Imaging",
    UInt32(IMAGING_RESPONDER_SVCLASS_ID): "Imaging Responder",
    UInt32(IMAGING_ARCHIVE_SVCLASS_ID): "Imaging Automatic Archive",
    UInt32(IMAGING_REFOBJS_SVCLASS_ID): "Imaging Referenced Objects",
    UInt32(HANDSFREE_SVCLASS_ID): "Handsfree",
    UInt32(HANDSFREE_AGW_SVCLASS_ID): "Handsfree Audio Gateway",
    UInt32(DIRECT_PRT_REFOBJS_SVCLASS_ID): "Direct Printing Ref. Objects",
    UInt32(REFLECTED_UI_SVCLASS_ID): "Reflected UI",
    UInt32(BASIC_PRINTING_SVCLASS_ID): "Basic Printing",
    UInt32(PRINTING_STATUS_SVCLASS_ID): "Printing Status",
    UInt32(HID_SVCLASS_ID): "Human Interface Device",
    UInt32(HCR_SVCLASS_ID): "Hardcopy Cable Replacement",
    UInt32(HCR_PRINT_SVCLASS_ID): "HCR Print",
    UInt32(HCR_SCAN_SVCLASS_ID): "HCR Scan",
    UInt32(CIP_SVCLASS_ID): "Common ISDN Access",
    UInt32(VIDEO_CONF_GW_SVCLASS_ID): "Video Conferencing Gateway",
    UInt32(UDI_MT_SVCLASS_ID): "UDI MT",
    UInt32(UDI_TA_SVCLASS_ID): "UDI TA",
    UInt32(AV_SVCLASS_ID): "Audio/Video",
    UInt32(SAP_SVCLASS_ID): "SIM Access",
    UInt32(PBAP_PCE_SVCLASS_ID): "Phonebook Access - PCE",
    UInt32(PBAP_PSE_SVCLASS_ID): "Phonebook Access - PSE",
    UInt32(PBAP_SVCLASS_ID): "Phonebook Access",
    UInt32(MAP_MSE_SVCLASS_ID): "Message Access - MAS",
    UInt32(MAP_MCE_SVCLASS_ID): "Message Access - MNS",
    UInt32(MAP_SVCLASS_ID): "Message Access",
    UInt32(PNP_INFO_SVCLASS_ID): "PnP Information",
    UInt32(GENERIC_NETWORKING_SVCLASS_ID): "Generic Networking",
    UInt32(GENERIC_FILETRANS_SVCLASS_ID): "Generic File Transfer",
    UInt32(GENERIC_AUDIO_SVCLASS_ID): "Generic Audio",
    UInt32(GENERIC_TELEPHONY_SVCLASS_ID): "Generic Telephony",
    UInt32(UPNP_SVCLASS_ID): "UPnP",
    UInt32(UPNP_IP_SVCLASS_ID): "UPnP IP",
    UInt32(UPNP_PAN_SVCLASS_ID): "UPnP PAN",
    UInt32(UPNP_LAP_SVCLASS_ID): "UPnP LAP",
    UInt32(UPNP_L2CAP_SVCLASS_ID): "UPnP L2CAP",
    UInt32(VIDEO_SOURCE_SVCLASS_ID): "Video Source",
    UInt32(VIDEO_SINK_SVCLASS_ID): "Video Sink",
    UInt32(VIDEO_DISTRIBUTION_SVCLASS_ID): "Video Distribution",
    UInt32(HDP_SVCLASS_ID): "HDP",
    UInt32(HDP_SOURCE_SVCLASS_ID): "HDP Source",
    UInt32(HDP_SINK_SVCLASS_ID): "HDP Sink",
    UInt32(GENERIC_ACCESS_SVCLASS_ID): "Generic Access",
    UInt32(GENERIC_ATTRIB_SVCLASS_ID): "Generic Attribute",
    UInt32(APPLE_AGENT_SVCLASS_ID): "Apple Agent"
]
