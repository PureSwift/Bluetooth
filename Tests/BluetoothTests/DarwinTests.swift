//
//  DarwinTests.swift
//  Bluetooth
//
//  Created by Alsey Coleman Miller on 6/1/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

#if os(macOS)
import Testing
import Foundation
@testable import Bluetooth
import BluetoothGAP
import CoreBluetooth
import IOKit
import Darwin

@Suite struct DarwinTests {

    // MARK: - Assigned Numbers

    @Test func gapAppearance() {

        #expect(GAPAppearance.Unknown.unknown.rawValue == IOKitBluetoothGAPAppearance.Unknown.rawValue)
        #expect(GAPAppearance.Phone.generic.rawValue == IOKitBluetoothGAPAppearance.GenericPhone.rawValue)
        #expect(GAPAppearance.Computer.generic.rawValue == IOKitBluetoothGAPAppearance.GenericComputer.rawValue)
    }

    @Test func companyIdentifiers() {

        #expect(CompanyIdentifier.ericsson.rawValue == IOKitBluetoothCompanyIdentifers.EricssonTechnologyLicensing.rawValue)
        #expect(CompanyIdentifier.nokiaMobilePhones.rawValue == IOKitBluetoothCompanyIdentifers.NokiaMobilePhones.rawValue)
        #expect(CompanyIdentifier.ibm.rawValue == IOKitBluetoothCompanyIdentifers.IBM.rawValue)
        #expect(CompanyIdentifier.intel.rawValue == IOKitBluetoothCompanyIdentifers.Intel.rawValue)
        #expect(CompanyIdentifier.apple.rawValue == IOKitBluetoothCompanyIdentifers.Apple.rawValue)
        #expect(CompanyIdentifier.google.rawValue == IOKitBluetoothCompanyIdentifers.Google.rawValue)
        #expect(CompanyIdentifier.microsoft.rawValue == IOKitBluetoothCompanyIdentifers.Microsoft.rawValue)
    }

    // MARK: - BluetoothUUID

    @Test func coreBluetoothUUID() {

        do {

            let uuid = BluetoothUUID.bit16(0xFEA9)
            let coreBluetoothUUID = CBUUID(uuid)
            #expect(coreBluetoothUUID.uuidString == uuid.rawValue)
            #expect(Data(uuid.bigEndian) == coreBluetoothUUID.data, "\(Data(uuid)) == \(coreBluetoothUUID.data)")
        }

        do {

            let uuid = BluetoothUUID()  // 128 bit
            let coreBluetoothUUID = CBUUID(uuid)
            #expect(coreBluetoothUUID.uuidString == uuid.rawValue)
            #expect(Data(uuid.bigEndian) == coreBluetoothUUID.data, "\(Data(uuid)) == \(coreBluetoothUUID.data)")
        }

        do {

            let coreBluetoothUUID = CBUUID(string: "FEA9")
            let uuid = BluetoothUUID(coreBluetoothUUID)
            #expect(coreBluetoothUUID.uuidString == uuid.rawValue)
            #expect(Data(uuid.bigEndian) == coreBluetoothUUID.data, "\(Data(uuid)) == \(coreBluetoothUUID.data)")
        }

        do {

            let coreBluetoothUUID = CBUUID(string: "68753A44-4D6F-1226-9C60-0050E4C00067")
            let uuid = BluetoothUUID(coreBluetoothUUID)
            #expect(coreBluetoothUUID.uuidString == uuid.rawValue)
            #expect(Data(uuid.bigEndian) == coreBluetoothUUID.data, "\(Data(uuid)) == \(coreBluetoothUUID.data)")
        }
    }
}

#endif

/*
 BluetoothCompanyIdentifers

 The "living document" can be found on the Bluetooth SIG website:
 https://www.bluetooth.com/specifications/assigned-numbers/company-identifiers
 */

enum IOKitBluetoothCompanyIdentifers: UInt16 {
    case EricssonTechnologyLicensing = 0
    case NokiaMobilePhones = 1
    case Intel = 2
    case IBM = 3
    case Toshiba = 4
    case _3Com = 5
    case Microsoft = 6
    case Lucent = 7
    case Motorola = 8
    case InfineonTechnologiesAG = 9
    case CambridgeSiliconRadio = 10
    case SiliconWave = 11
    case DigianswerAS = 12
    case TexasInstruments = 13
    case ParthusTechnologies = 14
    case Broadcom = 15
    case MitelSemiconductor = 16
    case Widcomm = 17
    case Zeevo = 18
    case Atmel = 19
    case MistubishiElectric = 20
    case RTXTelecom = 21
    case KCTechnology = 22
    case Newlogic = 23
    case Transilica = 24
    case RohdeandSchwarz = 25
    case TTPCom = 26
    case SigniaTechnologies = 27
    case ConexantSystems = 28
    case Qualcomm = 29
    case Inventel = 30
    case AVMBerlin = 31
    case Bandspeed = 32
    case Mansella = 33
    case NEC = 34
    case WavePlusTechnology = 35
    case Alcatel = 36
    case PhilipsSemiconductor = 37
    case CTechnologies = 38
    case OpenInterface = 39
    case RFCMicroDevices = 40
    case Hitachi = 41
    case SymbolTechnologies = 42
    case Tenovis = 43
    case MacronixInternational = 44
    case GCTSemiconductor = 45
    case NorwoodSystems = 46
    case MewTelTechnology = 47
    case STMicroelectronics = 48
    case Synopsys = 49
    case RedMCommunications = 50
    case Commil = 51
    case CATC = 52
    case Eclipse = 53
    case RenesasTechnology = 54
    case Mobilian = 55
    case Terax = 56
    case IntegratedSystemSolution = 57
    case MatsushitaElectricIndustrial = 58
    case Gennum = 59
    case ResearchInMotion = 60
    case IPextreme = 61
    case SystemsAndChips = 62
    case BluetoothSIG = 63
    case SeikoEpson = 64
    case IntegratedSiliconSolution = 65
    case CONWISETechnology = 66
    case ParrotSA = 67
    case SocketCommunications = 68
    case AtherosCommunications = 69
    case MediaTek = 70
    case Bluegiga = 71
    case MarvellTechnologyGroup = 72
    case _3DSP = 73
    case AccelSemiconductor = 74
    case ContinentialAutomotiveSystems = 75
    case Apple = 76
    case StaccatoCommunications = 77
    case AvagoTechnologies = 78
    case APT = 79
    case SiRFTechnology = 80
    case TZeroTechnologies = 81
    case JandM = 82
    case Free2Move = 83
    case _3DiJoy = 84
    case Plantronics = 85
    case SonyEricssonMobileCommunications = 86
    case HarmonInternational = 87
    case Visio = 88
    case NordicSemiconductor = 89
    case EMMicroElectronicMarin = 90
    case RalinkTechnology = 91
    case BelkinInternational = 92
    case RealtekSemiconductor = 93
    case StonestreetOne = 94
    case Wicentric = 95
    case RivieraWaves = 96
    case RDAMicroelectronics = 97
    case GibsonGuitars = 98
    case MiCommand = 99
    case BandXIInternational = 100
    case HewlettPackard = 101
    case _9SolutionsOy = 102
    case GNNetcom = 103
    case GeneralMotors = 104
    case AAndDEngineering = 105
    case MindTree = 106
    case PolarElectroOY = 107
    case BeautifulEnterprise = 108
    case BriarTek = 109
    case SummitDataCommunications = 110
    case SoundID = 111
    case Monster = 112
    case ConnectBlueAB = 113
    case ShangHaiSuperSmartElectronics = 114
    case GroupSense = 115
    case Zomm = 116
    case SamsungElectronics = 117
    case CreativeTechnology = 118
    case LairdTechnologies = 119
    case Nike = 120
    case LessWire = 121
    case MStarTechnologies = 122
    case HanlynnTechnologies = 123
    case AAndRCambridge = 124
    case SeersTechnology = 125
    case SportsTrackingTechnologies = 126
    case AutonetMobile = 127
    case DeLormePublishingCompany = 128
    case WuXiVimicro = 129
    case SennheiserCommunications = 130
    case TimeKeepingSystems = 131
    case LudusHelsinki = 132
    case BlueRadios = 133
    case Equinux = 134
    case GarminInternational = 135
    case Ecotest = 136
    case GNResound = 137
    case Jawbone = 138
    case TopconPositioningSystems = 139
    case Gimbal = 140
    case ZscanSoftware = 141
    case Quintic = 142
    case TelitWirelessSolutions = 143
    case FunaiElectric = 144
    case AdvancedPANMOBILSystems = 145
    case ThinkOptics = 146
    case UniversalElectriconics = 147
    case AirohaTechnology = 148
    case NECLightning = 149
    case ODMTechnology = 150
    case ConnecteDevice = 151
    case Zero1TV = 152
    case ITechDynamicGlobalDistribution = 153
    case Alpwise = 154
    case JiangsuToppowerAutomotiveElectronics = 155
    case Colorfy = 156
    case Geoforce = 157
    case Bose = 158
    case SuuntoOy = 159
    case KensingtonComputerProductsGroup = 160
    case SRMedizinelektronik = 161
    case Vertu = 162
    case MetaWatch = 163
    case Linak = 164
    case OTLDynamics = 165
    case PandaOcean = 166
    case Visteon = 167
    case ARPDevicesUnlimited = 168
    case MagnetiMarelli = 169
    case CaenRFID = 170
    case IngenieurSystemgruppeZahn = 171
    case GreenThrottleGames = 172
    case PeterSystemtechnik = 173
    case Omegawave = 174
    case Cinetix = 175
    case PassifSemiconductor = 176
    case SarisCyclingGroup = 177
    case Bekey = 178
    case ClarinoxTechnologies = 179
    case BDETechnology = 180
    case SwirlNetworks = 181
    case MesoInternational = 182
    case TreLab = 183
    case QualcommInnovationCenter = 184
    case JohnsonControls = 185
    case StarkeyLaboratories = 186
    case SPowerElectronics = 187
    case AceSensor = 188
    case Aplix = 189
    case AAMPofAmerica = 190
    case StalmartTechnology = 191
    case AMICCOMElectronics = 192
    case ShenzhenExcelsecuDataTechnology = 193
    case Geneq = 194
    case Adidas = 195
    case LGElectronics = 196
    case OnsetComputer = 197
    case SelflyBV = 198
    case Quupa = 199
    case GeLo = 200
    case Evluma = 201
    case MC10 = 202
    case BinauricSE = 203
    case BeatsElectronics = 204
    case MicrochipTechnology = 205
    case ElgatoSystems = 206
    case ARCHOS = 207
    case Dexcom = 208
    case PolarElectroEurope = 209
    case DialogSemiconductor = 210
    case TaixingbangTechnology = 211
    case Kawantech = 212
    case AustcoCommunicationsSystems = 213
    case TimexGroup = 214
    case QualcommTechnologies = 215
    case QualcommConnectedExperiences = 216
    case VoyetraTurtleBeach = 217
    case txtrGMBH = 218
    case Biosentronics = 219
    case ProctorAndGamble = 220
    case Hosiden = 221
    case Musik = 222
    case MisfitWearables = 223
    case Google = 224
    case Danlers = 225
    case Semilink = 226
    case InMusicBrands = 227
    case LSResearch = 228
    case EdenSoftwareConsultants = 229
    case Freshtemp = 230
    case KSTechnologies = 231
    case ACTSTechnologies = 232
    case VtrackSystems = 233
    case NielsenKellerman = 234
    case ServerTechnology = 235
    case BioResearchAssociates = 236
    case JollyLogic = 237
    case AboveAverageOutcomes = 238
    case Bitsplitters = 239
    case PayPal = 240
    case WitronTechnology = 241
    case MorseProject = 242
    case KentDisplays = 243
    case Nautilus = 244
    case Smartifier = 245
    case Elcometer = 246
    case VSNTechnologies = 247
    case AceUni = 248
    case StickNFind = 249
    case CrystalCode = 250
    case KOUKAMM = 251
    case Delphi = 252
    case ValenceTech = 253
    case StanleyBlackAndDecker = 254
    case TypeProducts = 255
    case TomTomInternational = 256
    case FuGoo = 257
    case Keiser = 258
    case BangAndOlufson = 259
    case PLUSLocationSystems = 260
    case UbiquitousComputingTechnology = 261
    case InnovativeYachtterSolutions = 262
    case WilliamDemantHolding = 263

    case InteropIdentifier = 65535
}

enum IOKitBluetoothGAPAppearance: UInt16 {

    case Unknown = 0
    case GenericPhone = 64
    case GenericComputer = 128
    case GenericWatch = 192
    case GenericClock = 256
    case GenericDisplay = 320
    case GenericRemoteControl = 384
    case GenericEyeGlasses = 448
    case GenericTag = 512
    case GenericKeyring = 576
    case GenericMediaPlayer = 640
    case GenericBarcodeScanner = 704
    case GenericThermometer = 768
    case GenericHeartrateSensor = 832
    case GenericBloodPressure = 896
    case GenericHumanInterfaceDevice = 960
    case HumanInterfaceDeviceKeyboard = 961
    case HumanInterfaceDeviceMouse = 962
    case HumanInterfaceDeviceJoystick = 963
    case HumanInterfaceDeviceGamepad = 964
    case HumanInterfaceDeviceDigitizerTablet = 965
    case HumanInterfaceDeviceCardReader = 966
    case HumanInterfaceDeviceDigitalPen = 967
    case HumanInterfaceDeviceBarcodeScanner = 968
    case GenericGlucoseMeter = 1024
    case GenericRunningWalkingSensor = 1088
    case GenericCycling = 1152
}
