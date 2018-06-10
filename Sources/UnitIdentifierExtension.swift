//
//  UnitIdentifierExtension.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/6/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

public extension UnitIdentifier {
    
    /// unitless
    static var unitless: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2700)
    }
    
    /// length (metre)
    static var metre: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2701)
    }
    
    /// mass (kilogram)
    static var kilogram: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2702)
    }
    
    /// time (second)
    static var second: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2703)
    }
    
    /// electric current (ampere)
    static var ampere: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2704)
    }
    
    /// thermodynamic temperature (kelvin)
    static var kelvin: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2705)
    }
    
    /// amount of substance (mole)
    static var mole: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2706)
    }
    
    /// luminous intensity (candela)
    static var candela: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2707)
    }
    
    /// area (square metres)
    static var area: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2710)
    }
    
    /// volume (cubic metres)
    static var volume: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2711)
    }
    
    /// velocity (metres per second)
    static var velocity: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2712)
    }
    
    /// acceleration (metres per second squared)
    static var acceleration: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2713)
    }
    
    /// wavenumber (reciprocal metre)
    static var wavrnumber: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2714)
    }
    
    /// density (kilogram per cubic metre)
    static var density: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2715)
    }
    
    /// surface density (kilogram per square metre)
    static var surfaceDensity: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2716)
    }
    
    /// specific volume (cubic metre per kilogram)
    static var specficVolume: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2717)
    }
    
    /// current density (ampere per square metre)
    static var currentDensity: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2718)
    }
    
    /// magnetic field strength (ampere per metre)
    static var magneticFieldStrengh: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2719)
    }
    
    /// amount concentration (mole per cubic metre)
    static var amountConcentration: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x271A)
    }
    
    /// mass concentration (kilogram per cubic metre)
    static var massConcentration: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x271B)
    }
    
    /// luminance (candela per square metre)
    static var luminance: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x271C)
    }
    
    /// refractive index
    static var refractiveIndex: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x271D)
    }
    
    /// relative permeability
    static var relativePermeability: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x271E)
    }
    
    /// plane angle (radian)
    static var planeAngle: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2720)
    }
    
    /// solid angle (steradian)
    static var solidAngle: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2721)
    }
    
    /// frequency (hertz)
    static var frequency: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2722)
    }
    
    /// force (newton)
    static var force: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2723)
    }
    
    /// pressure (pascal)
    static var pressure: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2724)
    }
    
    /// energy (joule)
    static var energy: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2725)
    }
    
    /// power (watt)
    static var power: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2726)
    }
    
    /// electric charge (coulomb)
    static var coulomb: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2727)
    }
    
    /// electric potential difference (volt)
    static var electricPotential: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2728)
    }
    
    /// capacitance (farad)
    static var capitance: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2729)
    }
    
    /// electric resistance (ohm)
    static var electricResistance: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x272A)
    }
    
    /// electric conductance (siemens)
    static var electricConductance: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x272B)
    }
    
    /// magnetic flux (weber)
    static var magneticFlux: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x272C)
    }
    
    /// magnetic flux density (tesla)
    static var magneticFluxDensity: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x272D)
    }
    
    /// inductance (henry)
    static var inductance: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x272E)
    }
    
    /// Celsius temperature (degree Celsius)
    static var celsius: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x272F)
    }
    
    /// luminous flux (lumen)
    static var luminousFlux: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2730)
    }
    
    /// illuminance (lux)
    static var illuminance: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2731)
    }
    
    /// activity referred to a radionuclide (becquerel)
    static var becquerel: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2732)
    }
    
    /// absorbed dose (gray)
    static var absorbedDose: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2733)
    }
    
    /// dose equivalent (sievert)
    static var sievert: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2734)
    }
    
    /// catalytic activity (katal)
    static var katal: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2735)
    }
    
    /// dynamic viscosity (pascal second)
    static var pascalSecond: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2740)
    }
    
    /// moment of force (newton metre)
    static var newtonMetre: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2741)
    }
    
    /// surface tension (newton per metre)
    static var surfaceTension: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2742)
    }
    
    /// angular velocity (radian per second)
    static var angularVelocity: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2743)
    }
    
    /// angular acceleration (radian per second squared)
    static var angularAcceleration: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2744)
    }
    
    /// heat flux density (watt per square metre)
    static var heatFluxDensity: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2745)
    }
    
    /// heat capacity (joule per kelvin)
    static var heatCapacity: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2746)
    }
    
    /// specific heat capacity (joule per kilogram kelvin)
    static var specificHeatCapacity: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2747)
    }
    
    /// specific energy (joule per kilogram)
    static var specificEnergy: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2748)
    }
    /// thermal conductivity (watt per metre kelvin)
    static var thermalConductivity: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2749)
    }
    
    /// energy density (joule per cubic metre)
    static var energyDensity: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x274A)
    }
    
    /// electric field strength (volt per metre)
    static var electricFieldStrength: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x274B)
    }
    
    /// electric charge density (coulomb per cubic metre)
    static var electricChargeDensity: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x274C)
    }
    
    /// surface charge density (coulomb per square metre)
    static var surfaceChargeDensity: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x274D)
    }
    
    /// electric flux density (coulomb per square metre)
    static var electricFluxDensity: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x274E)
    }
    
    /// permittivity (farad per metre)
    static var permittivity: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x274F)
    }
    
    /// permeability (henry per metre)
    static var permeability: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2750)
    }
    
    /// molar energy (joule per mole)
    static var molarEnergy: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2751)
    }
    
    /// molar entropy (joule per mole kelvin)
    static var molarEntropy: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2752)
    }
    
    /// exposure (coulomb per kilogram)
    static var exposure: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2753)
    }
    /// absorbed dose rate (gray per second)
    static var absorbedDoseRate: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2754)
    }
    
    /// radiant intensity (watt per steradian)
    static var radiantIntensity: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2755)
    }
    
    /// radiance (watt per square metre steradian)
    static var radiance: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2756)
    }
    
    /// catalytic activity concentration (katal per cubic metre)
    static var catalyticActivity: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2757)
    }
    
    /// time (minute)
    static var minute: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2760)
    }
    
    /// time (hour)
    static var hour: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2761)
    }
    
    /// time (day)
    static var day: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2762)
    }
    
    /// plane angle (degree)
    static var degree: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2763)
    }
    
    /// plane angle (minute)
    static var planeAngleMinute: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2764)
    }
    
    /// plane angle (second)
    static var planeAngleSecond: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2765)
    }
    
    /// area (hectare)
    static var hectare: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2766)
    }
    
    /// volume (litre)
    static var litre: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2767)
    }
    
    /// mass (tonne)
    static var tonne: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2768)
    }
    
    /// pressure (bar)
    static var bar: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2780)
    }
    
    /// pressure (millimetre of mercury)
    static var millimetreOfMercury: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2781)
    }
    
    /// length (ngstrm)
    static var ngstrm: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2782)
    }
    
    /// length (nautical mile)
    static var nauticaMile: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2783)
    }
    
    /// area (barn)
    static var barn: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2784)
    }
    
    /// velocity (knot)
    static var velocityKnot: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2785)
    }
    
    /// logarithmic radio quantity (neper)
    static var neper: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2786)
    }
    
    /// logarithmic radio quantity (bel)
    static var bel: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x2787)
    }
    
    /// length (yard)
    static var yard: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x27A0)
    }
    
    /// length (parsec)
    static var parsec: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x27A1)
    }
    
    /// length (inch)
    static var inch: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x27A2)
    }
    
    /// length (foot)
    static var foot: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x27A3)
    }
    
    /// length (mile)
    static var mile: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x27A4)
    }
    
    /// pressure (pound-force per square inch)
    static var pressurePoundForce: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x27A5)
    }
    
    /// velocity (kilometre per hour)
    static var kilometrePerHour: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x27A6)
    }
    
    /// velocity (mile per hour)
    static var milePerHour: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x27A7)
    }
    
    /// angular velocity (revolution per minute)
    static var revolutionPerMinute: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x27A8)
    }
    
    /// energy (gram calorie)
    static var gramCalorie: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x27A9)
    }
    
    /// energy (kilogram calorie)
    static var kilogramCalorie: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x27AA)
    }
    
    /// energy (kilowatt hour)
    static var kilowattHour: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x27AB)
    }
    
    /// thermodynamic temperature (degree Fahrenheit)
    static var degreeFahrenheit: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x27AC)
    }
    
    /// percentage
    static var percentage: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x27AD)
    }
    
    /// per mille
    static var perMille: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x27AE)
    }
    
    /// period (beats per minute)
    static var beatsPerMinute: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x27AF)
    }
    
    /// electric charge (ampere hours)
    static var ampereHours: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x27B0)
    }
    
    /// mass density (milligram per decilitre)
    static var milligramPerDecilitre: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x27B1)
    }
    
    /// mass density (millimole per litre)
    static var millimolePerLitre: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x27B2)
    }
    
    /// time (year)
    static var year: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x27B3)
    }
    
    /// time (month)
    static var month: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x27B4)
    }
    
    /// concentration (count per cubic metre)
    static var concentration: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x27B5)
    }
    
    /// irradiance (watt per square metre)
    static var irradiance: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x27B6)
    }
    
    /// milliliter (per kilogram per minute)
    static var milliliter: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x27B7)
    }
    
    /// mass (pound)
    static var pound: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x27B8)
    }
    
    /// metabolic equivalent
    static var metabolicEquivalent: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x27B9)
    }
    /// step (per minute)
    static var step: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x27BA)
    }
    
    /// stroke (per minute)
    static var stroke: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x27BC)
    }
    
    /// pace (kilometre per minute)
    static var pace: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x27BD)
    }
    
    /// luminous efficacy (lumen per watt)
    static var luminousEfficacy: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x27BE)
    }
    
    /// luminous energy (lumen hour)
    static var luminousEnergy: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x27BF)
    }
    
    /// luminous exposure (lux hour)
    static var luminousExposure: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x27C0)
    }
    
    /// mass flow (gram per second)
    static var massFlow: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x27C1)
    }
    
    /// volume flow (litre per second)
    static var volumeFlow: UnitIdentifier {
        return UnitIdentifier(rawValue: 0x27C2)
    }

}
