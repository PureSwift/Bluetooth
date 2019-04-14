//
//  POSIXError.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 7/22/15.
//  Copyright © 2015 PureSwift. All rights reserved.
//

import Foundation

#if canImport(MSVCRT)
import MSVCRT
import WinSDK
#elseif canImport(Darwin)
import Darwin
#elseif canImport(Glibc)
import Glibc
#endif

internal extension POSIXError {
    
    /// Creates error from C ```errno```.
    static var fromErrno: POSIXError? {
        
        guard let code = POSIXErrorCode(rawValue: errno)
            else { return nil }
        
        return self.init(code)
    }
    
    /// Initializes `POSIXError` from an error code.
    init(_ errorCode: POSIXErrorCode) {
        
        var userInfo = [String: Any](minimumCapacity: 1)
        
        if let description = String(cString: strerror(errorCode.rawValue), encoding: .ascii) {
            userInfo[NSLocalizedDescriptionKey] = description
        }
        
        let nsError = NSError(
            domain: NSPOSIXErrorDomain,
            code: Int(errorCode.rawValue),
            userInfo: userInfo)
        
        self.init(_nsError: nsError)
    }
}

#if os(Linux) || os(Android)

/// Enumeration describing POSIX error codes.
public enum POSIXErrorCode : Int32 {
    /// Operation not permitted.
    case EPERM           = 1
    /// No such file or directory.
    case ENOENT          = 2
    /// No such process.
    case ESRCH           = 3
    /// Interrupted system call.
    case EINTR           = 4
    /// Input/output error.
    case EIO             = 5
    /// Device not configured.
    case ENXIO           = 6
    /// Argument list too long.
    case E2BIG           = 7
    /// Exec format error.
    case ENOEXEC         = 8
    /// Bad file descriptor.
    case EBADF           = 9
    /// No child processes.
    case ECHILD          = 10
    /// Try again.
    case EAGAIN         = 11
    /// Cannot allocate memory.
    case ENOMEM          = 12
    /// Permission denied.
    case EACCES          = 13
    /// Bad address.
    case EFAULT          = 14
    /// Block device required.
    case ENOTBLK         = 15
    /// Device / Resource busy.
    case EBUSY           = 16
    /// File exists.
    case EEXIST          = 17
    /// Cross-device link.
    case EXDEV           = 18
    /// Operation not supported by device.
    case ENODEV          = 19
    /// Not a directory.
    case ENOTDIR         = 20
    /// Is a directory.
    case EISDIR          = 21
    /// Invalid argument.
    case EINVAL          = 22
    /// Too many open files in system.
    case ENFILE          = 23
    /// Too many open files.
    case EMFILE          = 24
    /// Inappropriate ioctl for device.
    case ENOTTY          = 25
    /// Text file busy.
    case ETXTBSY         = 26
    /// File too large.
    case EFBIG           = 27
    /// No space left on device.
    case ENOSPC          = 28
    /// Illegal seek.
    case ESPIPE          = 29
    /// Read-only file system.
    case EROFS           = 30
    /// Too many links.
    case EMLINK          = 31
    /// Broken pipe.
    case EPIPE           = 32
    
    /// Numerical argument out of domain.
    case EDOM            = 33
    /// Result too large.
    case ERANGE          = 34
    
    /// Resource deadlock would occur.
    case EDEADLK          = 35
    
    /// File name too long.
    case ENAMETOOLONG     = 36
    
    /// No record locks available
    case ENOLCK           = 37
    
    /// Function not implemented.
    case ENOSYS           = 38
    
    /// Directory not empty.
    case ENOTEMPTY        = 39
    
    /// Too many symbolic links encountered
    case ELOOP            = 40
    
    /// Operation would block.
    public static var EWOULDBLOCK: POSIXErrorCode { return .EAGAIN }
    
    /// No message of desired type.
    case ENOMSG          = 42
    
    /// Identifier removed.
    case EIDRM           = 43
    
    /// Channel number out of range.
    case ECHRNG          = 44
    
    /// Level 2 not synchronized.
    case EL2NSYNC        = 45
    
    /// Level 3 halted
    case EL3HLT          = 46
    
    /// Level 3 reset.
    case EL3RST          = 47
    
    /// Link number out of range.
    case ELNRNG          = 48
    
    /// Protocol driver not attached.
    case EUNATCH         = 49
    
    /// No CSI structure available.
    case ENOCSI          = 50
    
    /// Level 2 halted.
    case EL2HLT          = 51
    /// Invalid exchange
    case EBADE           = 52
    /// Invalid request descriptor
    case EBADR           = 53
    /// Exchange full
    case EXFULL          = 54
    /// No anode
    case ENOANO          = 55
    /// Invalid request code
    case EBADRQC         = 56
    /// Invalid slot
    case EBADSLT         = 57
    
    public static var EDEADLOCK: POSIXErrorCode { return .EDEADLK }
    
    /// Bad font file format
    case EBFONT          = 59
    /// Device not a stream
    case ENOSTR          = 60
    /// No data available
    case ENODATA         = 61
    /// Timer expired
    case ETIME           = 62
    /// Out of streams resources
    case ENOSR           = 63
    /// Machine is not on the network
    case ENONET          = 64
    /// Package not installed
    case ENOPKG          = 65
    /// Object is remote
    case EREMOTE         = 66
    /// Link has been severed
    case ENOLINK         = 67
    /// Advertise error
    case EADV            = 68
    /// Srmount error
    case ESRMNT          = 69
    /// Communication error on send
    case ECOMM           = 70
    /// Protocol error
    case EPROTO          = 71
    /// Multihop attempted
    case EMULTIHOP       = 72
    /// RFS specific error
    case EDOTDOT         = 73
    /// Not a data message
    case EBADMSG         = 74
    /// Value too large for defined data type
    case EOVERFLOW       = 75
    /// Name not unique on network
    case ENOTUNIQ        = 76
    /// File descriptor in bad state
    case EBADFD          = 77
    /// Remote address changed
    case EREMCHG         = 78
    /// Can not access a needed shared library
    case ELIBACC         = 79
    /// Accessing a corrupted shared library
    case ELIBBAD         = 80
    /// .lib section in a.out corrupted
    case ELIBSCN         = 81
    /// Attempting to link in too many shared libraries
    case ELIBMAX         = 82
    /// Cannot exec a shared library directly
    case ELIBEXEC        = 83
    /// Illegal byte sequence
    case EILSEQ          = 84
    /// Interrupted system call should be restarted
    case ERESTART        = 85
    /// Streams pipe error
    case ESTRPIPE        = 86
    /// Too many users
    case EUSERS          = 87
    /// Socket operation on non-socket
    case ENOTSOCK        = 88
    /// Destination address required
    case EDESTADDRREQ    = 89
    /// Message too long
    case EMSGSIZE        = 90
    /// Protocol wrong type for socket
    case EPROTOTYPE      = 91
    /// Protocol not available
    case ENOPROTOOPT     = 92
    /// Protocol not supported
    case EPROTONOSUPPORT = 93
    /// Socket type not supported
    case ESOCKTNOSUPPORT = 94
    /// Operation not supported on transport endpoint
    case EOPNOTSUPP      = 95
    /// Protocol family not supported
    case EPFNOSUPPORT    = 96
    /// Address family not supported by protocol
    case EAFNOSUPPORT    = 97
    /// Address already in use
    case EADDRINUSE      = 98
    /// Cannot assign requested address
    case EADDRNOTAVAIL   = 99
    /// Network is down
    case ENETDOWN        = 100
    /// Network is unreachable
    case ENETUNREACH     = 101
    /// Network dropped connection because of reset
    case ENETRESET       = 102
    /// Software caused connection abort
    case ECONNABORTED    = 103
    /// Connection reset by peer
    case ECONNRESET      = 104
    /// No buffer space available
    case ENOBUFS         = 105
    /// Transport endpoint is already connected
    case EISCONN         = 106
    /// Transport endpoint is not connected
    case ENOTCONN        = 107
    /// Cannot send after transport endpoint shutdown
    case ESHUTDOWN       = 108
    /// Too many references: cannot splice
    case ETOOMANYREFS    = 109
    /// Connection timed out
    case ETIMEDOUT       = 110
    /// Connection refused
    case ECONNREFUSED    = 111
    /// Host is down
    case EHOSTDOWN       = 112
    /// No route to host
    case EHOSTUNREACH    = 113
    /// Operation already in progress
    case EALREADY        = 114
    /// Operation now in progress
    case EINPROGRESS     = 115
    /// Stale NFS file handle
    case ESTALE          = 116
    /// Structure needs cleaning
    case EUCLEAN         = 117
    /// Not a XENIX named type file
    case ENOTNAM         = 118
    /// No XENIX semaphores available
    case ENAVAIL         = 119
    /// Is a named type file
    case EISNAM          = 120
    /// Remote I/O error
    case EREMOTEIO       = 121
    /// Quota exceeded
    case EDQUOT          = 122
    
    /// No medium found
    case ENOMEDIUM       = 123
    /// Wrong medium type
    case EMEDIUMTYPE     = 124
    /// Operation Canceled
    case ECANCELED       = 125
    /// Required key not available
    case ENOKEY          = 126
    /// Key has expired
    case EKEYEXPIRED     = 127
    /// Key has been revoked
    case EKEYREVOKED     = 128
    /// Key was rejected by service
    case EKEYREJECTED    = 129
    
    /// Owner died
    case EOWNERDEAD      = 130
    /// State not recoverable
    case ENOTRECOVERABLE = 131
}

#endif
