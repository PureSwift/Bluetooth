##
##  CMakeLists.txt
##  Bluetooth
##
##  Builds `libbluetooth-util.so.0` — the non-socket half of the
##  libbluetooth ABI (the `bluetooth.c` entry points plus the `bt_uuid_*`
##  family), implemented in Swift.
##
##  SwiftPM drives development and the test suites; CMake exists because
##  soname, symbol versioning and install name are not expressible in
##  `Package.swift`. The socket half, and the drop-in
##  `libbluetooth.so.3` itself, are built by PureSwift/BluetoothLinux,
##  which links the static archives produced here.
##
##  Note this library ships `bt_uuid_*` as real exported symbols, which
##  upstream BlueZ has never done — there they exist only inside
##  `libbluetooth-internal.a`. Consumers that want the UUID helpers as a
##  shared library are the reason this target exists standalone.
##
##  The Ninja generator is required — CMake does not support the Swift
##  language with Makefiles.
##
##  Usage:
##      cmake -B build -G Ninja -DCMAKE_BUILD_TYPE=Release
##      cmake --build build
##      cmake --build build --target check-exports
##      cmake --install build --prefix /usr/local
##

cmake_minimum_required(VERSION 3.26)

if(NOT CMAKE_GENERATOR MATCHES "Ninja")
    message(FATAL_ERROR
        "The Ninja generator is required for Swift targets; "
        "re-run with -G Ninja.")
endif()

project(BluetoothABI
    VERSION 0.1.0
    DESCRIPTION "Swift implementation of the libbluetooth C ABI"
    LANGUAGES C Swift)

# ---------------------------------------------------------------------
# Options
# ---------------------------------------------------------------------

option(BLUETOOTH_ABI_SHARED
    "Build the shared library (off builds the static archives only)" ON)

option(BLUETOOTH_ABI_STATIC_STDLIB
    "Statically link the Swift runtime into the shared library" OFF)

option(BLUETOOTH_ABI_INSTALL_HEADERS
    "Install the vendored BlueZ headers under <prefix>/include/bluetooth" ON)

# The soname of this library is independent of BlueZ's: it is a new
# library, not a replacement for one. BluetoothLinux sets 3 / 3.19.x for
# the drop-in `libbluetooth.so.3`.
set(BLUETOOTH_UTIL_SOVERSION 0)
set(BLUETOOTH_UTIL_VERSION 0.1.0)

set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_POSITION_INDEPENDENT_CODE ON)

if(NOT CMAKE_BUILD_TYPE AND NOT CMAKE_CONFIGURATION_TYPES)
    set(CMAKE_BUILD_TYPE Release CACHE STRING "" FORCE)
endif()

include(GNUInstallDirs)

# ---------------------------------------------------------------------
# CBluetooth — the C surface
# ---------------------------------------------------------------------
#
# `include/` holds the two headers vendored verbatim from BlueZ; they are
# GPL-2.0-or-later, unlike the rest of this repository. See
# Sources/CBluetooth/README.md.

add_library(CBluetooth STATIC
    Sources/CBluetooth/cbt_printf.c
    Sources/CBluetooth/cbt_alloc.c
    Sources/CBluetooth/cbt_scan.c)

target_include_directories(CBluetooth PUBLIC
    "${CMAKE_CURRENT_SOURCE_DIR}/Sources/CBluetooth/include")

# ---------------------------------------------------------------------
# Generated definitions
# ---------------------------------------------------------------------
#
# `Sources/Bluetooth` references assigned-number definitions (e.g.
# `CompanyIdentifier.apple`) that the SwiftPM `GenerateBluetoothDefinitions`
# plugin emits at build time. CMake has no plugin mechanism, so it runs
# the same generator executable directly, via SwiftPM.
#
# Set BLUETOOTH_GENERATED_DIR to reuse definitions generated elsewhere
# and skip the SwiftPM invocation entirely.

set(BLUETOOTH_GENERATED_DIR "" CACHE PATH
    "Directory of pre-generated definitions (empty: generate them here)")

set(BLUETOOTH_GENERATED_FILES
    CompanyIdentifiers
    UnitIdentifiers
    CharacteristicUUID
    DeclarationUUID
    DescriptorUUID
    MemberUUID
    ServiceUUID)

# The generator's subcommand for each output file.
set(BLUETOOTH_GENERATE_CompanyIdentifiers   companyIdentifier)
set(BLUETOOTH_GENERATE_UnitIdentifiers      unitIdentifier)
set(BLUETOOTH_GENERATE_CharacteristicUUID   "uuid;Characteristic")
set(BLUETOOTH_GENERATE_DeclarationUUID      "uuid;Declaration")
set(BLUETOOTH_GENERATE_DescriptorUUID       "uuid;Descriptor")
set(BLUETOOTH_GENERATE_MemberUUID           "uuid;Member")
set(BLUETOOTH_GENERATE_ServiceUUID          "uuid;Service")

if(BLUETOOTH_GENERATED_DIR)
    foreach(name IN LISTS BLUETOOTH_GENERATED_FILES)
        set(generated "${BLUETOOTH_GENERATED_DIR}/${name}.swift")
        if(NOT EXISTS "${generated}")
            message(FATAL_ERROR
                "BLUETOOTH_GENERATED_DIR set but ${generated} is missing.")
        endif()
        list(APPEND BLUETOOTH_GENERATED_SOURCES "${generated}")
    endforeach()
else()
    find_program(SWIFT_EXECUTABLE swift REQUIRED)

    set(BLUETOOTH_GENERATED_OUTPUT "${CMAKE_CURRENT_BINARY_DIR}/generated")
    file(MAKE_DIRECTORY "${BLUETOOTH_GENERATED_OUTPUT}")

    # One `swift build` up front, so the per-file commands below cannot
    # race each other over SwiftPM's build lock.
    add_custom_command(
        OUTPUT "${BLUETOOTH_GENERATED_OUTPUT}/.generator-built"
        COMMAND "${CMAKE_COMMAND}" -E env
                SWIFTPM_BLUETOOTH_CABI=0
                "${SWIFT_EXECUTABLE}" build --product GenerateBluetooth
                --package-path "${CMAKE_CURRENT_SOURCE_DIR}"
        COMMAND "${CMAKE_COMMAND}" -E touch
                "${BLUETOOTH_GENERATED_OUTPUT}/.generator-built"
        WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}"
        COMMENT "Building GenerateBluetooth"
        VERBATIM)

    foreach(name IN LISTS BLUETOOTH_GENERATED_FILES)
        set(generated "${BLUETOOTH_GENERATED_OUTPUT}/${name}.swift")
        add_custom_command(
            OUTPUT "${generated}"
            COMMAND "${CMAKE_COMMAND}" -E env
                    SWIFTPM_BLUETOOTH_CABI=0
                    "${SWIFT_EXECUTABLE}" run --skip-build
                    --package-path "${CMAKE_CURRENT_SOURCE_DIR}"
                    GenerateBluetooth
                    ${BLUETOOTH_GENERATE_${name}} "${generated}"
            DEPENDS "${BLUETOOTH_GENERATED_OUTPUT}/.generator-built"
            WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}"
            COMMENT "Generating ${name}.swift"
            VERBATIM)
        list(APPEND BLUETOOTH_GENERATED_SOURCES "${generated}")
    endforeach()
endif()

# ---------------------------------------------------------------------
# Bluetooth — the Swift engine
# ---------------------------------------------------------------------
#
# BluetoothMetadata is deliberately absent: it loads its JSON through
# SwiftPM's `Bundle.module`, which does not exist here. Every use of it
# in `Sources/Bluetooth` is `canImport`-guarded, and the ABI layer needs
# none of it — the company-identifier table `bt_compidtostr` returns is
# baked in ahead of time by Scripts/generate-company-names.py.

file(GLOB BLUETOOTH_SOURCES CONFIGURE_DEPENDS
    "${CMAKE_CURRENT_SOURCE_DIR}/Sources/Bluetooth/*.swift"
    "${CMAKE_CURRENT_SOURCE_DIR}/Sources/Bluetooth/Extensions/*.swift")

add_library(Bluetooth STATIC
    ${BLUETOOTH_SOURCES}
    ${BLUETOOTH_GENERATED_SOURCES})

set_target_properties(Bluetooth PROPERTIES
    Swift_MODULE_NAME Bluetooth)

# `package`-level declarations in Sources/Bluetooth are visible to the
# ABI layer only if both modules share a package name, as they do under
# SwiftPM.
target_compile_options(Bluetooth PRIVATE
    "SHELL:-package-name Bluetooth")

# ---------------------------------------------------------------------
# BluetoothABI — the Swift implementations of the C entry points
# ---------------------------------------------------------------------
#
# Includes the 75 pure `sdp_*` symbols (data model, PDU codec, attribute
# accessors) alongside the rest of the C ABI — they ship in the same
# shared object, so there's no separate BluetoothSDP target here.

file(GLOB BLUETOOTH_ABI_SOURCES CONFIGURE_DEPENDS
    "${CMAKE_CURRENT_SOURCE_DIR}/Sources/BluetoothABI/*.swift"
    "${CMAKE_CURRENT_SOURCE_DIR}/Sources/BluetoothABI/gen/*.swift")

add_library(BluetoothABI STATIC ${BLUETOOTH_ABI_SOURCES})

set_target_properties(BluetoothABI PROPERTIES
    Swift_MODULE_NAME BluetoothABI)

target_compile_options(BluetoothABI PRIVATE
    "SHELL:-package-name Bluetooth")

target_link_libraries(BluetoothABI PUBLIC Bluetooth CBluetooth)

# ---------------------------------------------------------------------
# libbluetooth-util.so.0 — the installable artifact
# ---------------------------------------------------------------------

if(BLUETOOTH_ABI_SHARED)
    set(BLUETOOTH_UTIL_VERSION_SCRIPT
        "${CMAKE_CURRENT_SOURCE_DIR}/cmake/libbluetooth-util.map")

    # A shared library needs at least one of its own objects; the Swift
    # and C implementations arrive through --whole-archive below.
    add_library(bluetooth-util SHARED cmake/empty.c)

    set_target_properties(bluetooth-util PROPERTIES
        OUTPUT_NAME bluetooth-util
        SOVERSION ${BLUETOOTH_UTIL_SOVERSION}
        VERSION ${BLUETOOTH_UTIL_VERSION}
        # The link is driven by swiftc (the target pulls in Swift
        # archives), and `bluetooth-util` is not a valid Swift
        # identifier, so name the vestigial module explicitly.
        Swift_MODULE_NAME bluetooth_util)

    # Every entry point is referenced only from outside, so the archives
    # holding them must be linked whole or the linker drops the lot.
    #
    # The archives are named explicitly through `LINKER:` (which expands
    # to `-Xlinker` here) rather than via `$<LINK_LIBRARY:WHOLE_ARCHIVE>`:
    # the link is driven by swiftc, whose driver silently discards bare
    # `.a` arguments, so the result would be a shared library with no
    # symbols in it. `add_dependencies` below restores the build ordering
    # that naming targets directly would have given us.
    target_link_options(bluetooth-util PRIVATE
        "LINKER:--whole-archive"
        "LINKER:$<TARGET_FILE:BluetoothABI>"
        "LINKER:$<TARGET_FILE:CBluetooth>"
        "LINKER:--no-whole-archive")

    add_dependencies(bluetooth-util BluetoothABI CBluetooth)

    # Linked normally: only the parts of the engine actually referenced.
    target_link_libraries(bluetooth-util PRIVATE Bluetooth)

    # Pin the export list. Upstream libbluetooth exports everything; we
    # do not, so that the ABI surface is asserted rather than incidental.
    target_link_options(bluetooth-util PRIVATE
        "LINKER:--version-script=${BLUETOOTH_UTIL_VERSION_SCRIPT}")
    set_target_properties(bluetooth-util PROPERTIES
        LINK_DEPENDS "${BLUETOOTH_UTIL_VERSION_SCRIPT}")

    if(BLUETOOTH_ABI_STATIC_STDLIB)
        # Any process loading this library otherwise pulls in
        # libswiftCore; static linking trades size for isolation.
        target_link_options(bluetooth-util PRIVATE "-static-stdlib")
    endif()

    # pkg-config, so `pkg-config --libs bluetooth-util` works.
    configure_file(
        "${CMAKE_CURRENT_SOURCE_DIR}/cmake/bluetooth-util.pc.in"
        "${CMAKE_CURRENT_BINARY_DIR}/bluetooth-util.pc"
        @ONLY)

    install(TARGETS bluetooth-util
        LIBRARY DESTINATION "${CMAKE_INSTALL_LIBDIR}")

    install(FILES "${CMAKE_CURRENT_BINARY_DIR}/bluetooth-util.pc"
        DESTINATION "${CMAKE_INSTALL_LIBDIR}/pkgconfig")
endif()

if(BLUETOOTH_ABI_INSTALL_HEADERS)
    # hci.h is vendored only because sdp_lib.h includes it; it declares
    # nothing this library implements, but the reference package installs
    # it too, so consumers that include it directly keep working.
    file(GLOB CBLUETOOTH_HEADERS
        "${CMAKE_CURRENT_SOURCE_DIR}/Sources/CBluetooth/include/bluetooth/*.h")
    install(FILES ${CBLUETOOTH_HEADERS}
        DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}/bluetooth")
endif()

# ---------------------------------------------------------------------
# Export verification
# ---------------------------------------------------------------------
#
# `check-exports` diffs the built library's dynamic symbol table against
# cmake/symbols.txt. Both a missing and an extra symbol fail, so the
# export surface cannot drift silently.

if(BLUETOOTH_ABI_SHARED)
    add_custom_target(check-exports
        COMMAND "${CMAKE_CURRENT_SOURCE_DIR}/Scripts/check-exports.sh"
                "$<TARGET_FILE:bluetooth-util>"
                "${CMAKE_CURRENT_SOURCE_DIR}/cmake/symbols.txt"
        DEPENDS bluetooth-util
        COMMENT "Checking exported symbols against cmake/symbols.txt"
        VERBATIM)
endif()
