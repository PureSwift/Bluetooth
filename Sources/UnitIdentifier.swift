//
//  UnitIdentifier.swift
//  Bluetooth
//
//  Created by Carlos Duclos on 6/6/18.
//  Copyright © 2018 PureSwift. All rights reserved.
//

import Foundation

public struct UnitIdentifier: RawRepresentable {
    
    public var rawValue: UInt16
    
    public init(rawValue: UInt16) {
        
        self.rawValue = rawValue
    }
}

// MARK: - Equatable

extension UnitIdentifier: Equatable {
    
    @inline(__always)
    public static func == (lhs: UnitIdentifier, rhs: UnitIdentifier) -> Bool {
        
        return lhs.rawValue == rhs.rawValue
    }
}

// MARK: - Hashable

extension UnitIdentifier: Hashable {
    
    public var hashValue: Int {
        
        return Int(rawValue)
    }
}

// MARK: - ExpressibleByIntegerLiteral

extension UnitIdentifier: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt16) {
        
        self.init(rawValue: value)
    }
}

// MARK: - CustomStringConvertible

extension UnitIdentifier: CustomStringConvertible {
    
    public var description: String {
        
        let valueString = rawValue.toHexadecimal()
        
        if let name = self.name {
            
            return valueString + " " + "(" + name + ")"
            
        } else {
            
            return valueString
        }
    }
}

// MARK: - Definitions

public extension UnitIdentifier {
    
    /// The name of the unit.
    var name: String? {
        
        return units[rawValue]?.name
    }
    
    /// The Bluetooth type namespace of the unit.
    var type: String? {
        
        return units[rawValue]?.type
    }
}

internal let units: [UInt16: (name: String, type: String)] = [
    0x2700: ("unitless", "org.bluetooth.unit.unitless"),
    0x2701: ("length (metre)", "org.bluetooth.unit.length.metre"),
    0x2702: ("mass (kilogram)", "org.bluetooth.unit.mass.kilogram"),
    0x2703: ("time (second)", "org.bluetooth.unit.time.second"),
    0x2704: ("electric current (ampere)", "org.bluetooth.unit.electric_current.ampere"),
    0x2705: ("thermodynamic temperature (kelvin)", "org.bluetooth.unit.thermodynamic_temperature.kelvin"),
    0x2706: ("amount of substance (mole)", "org.bluetooth.unit.amount_of_substance.mole"),
    0x2707: ("luminous intensity (candela)", "org.bluetooth.unit.luminous_intensity.candela"),
    0x2710: ("area (square metres)", "org.bluetooth.unit.area.square_metres"),
    0x2711: ("volume (cubic metres)", "org.bluetooth.unit.volume.cubic_metres"),
    0x2712: ("velocity (metres per second)", "org.bluetooth.unit.velocity.metres_per_second"),
    0x2713: ("acceleration (metres per second squared)", "org.bluetooth.unit.acceleration.metres_per_second_squared"),
    0x2714: ("wavenumber (reciprocal metre)", "org.bluetooth.unit.wavenumber.reciprocal_metre"),
    0x2715: ("density (kilogram per cubic metre)", "org.bluetooth.unit.density.kilogram_per_cubic_metre"),
    0x2716: ("surface density (kilogram per square metre)", "org.bluetooth.unit.surface_density.kilogram_per_square_metre"),
    0x2717: ("specific volume (cubic metre per kilogram)", "org.bluetooth.unit.specific_volume.cubic_metre_per_kilogram"),
    0x2718: ("current density (ampere per square metre)", "org.bluetooth.unit.current_density.ampere_per_square_metre"),
    0x2719: ("magnetic field strength (ampere per metre)", "org.bluetooth.unit.magnetic_field_strength.ampere_per_metre"),
    0x271A: ("amount concentration (mole per cubic metre)", "org.bluetooth.unit.amount_concentration.mole_per_cubic_metre"),
    0x271B: ("mass concentration (kilogram per cubic metre)", "org.bluetooth.unit.mass_concentration.kilogram_per_cubic_metre"),
    0x271C: ("luminance (candela per square metre)", "org.bluetooth.unit.luminance.candela_per_square_metre"),
    0x271D: ("refractive index", "org.bluetooth.unit.refractive_index"),
    0x271E: ("relative permeability", "org.bluetooth.unit.relative_permeability"),
    0x2720: ("plane angle (radian)", "org.bluetooth.unit.plane_angle.radian"),
    0x2721: ("solid angle (steradian)", "org.bluetooth.unit.solid_angle.steradian"),
    0x2722: ("frequency (hertz)", "org.bluetooth.unit.frequency.hertz"),
    0x2723: ("force (newton)", "org.bluetooth.unit.force.newton"),
    0x2724: ("pressure (pascal)", "org.bluetooth.unit.pressure.pascal"),
    0x2725: ("energy (joule)", "org.bluetooth.unit.energy.joule"),
    0x2726: ("power (watt)", "org.bluetooth.unit.power.watt"),
    0x2727: ("electric charge (coulomb)", "org.bluetooth.unit.electric_charge.coulomb"),
    0x2728: ("electric potential difference (volt)", "org.bluetooth.unit.electric_potential_difference.volt"),
    0x2729: ("capacitance (farad)", "org.bluetooth.unit.capacitance.farad"),
    0x272A: ("electric resistance (ohm)", "org.bluetooth.unit.electric_resistance.ohm"),
    0x272B: ("electric conductance (siemens)", "org.bluetooth.unit.electric_conductance.siemens"),
    0x272C: ("magnetic flux (weber)", "org.bluetooth.unit.magnetic_flux.weber"),
    0x272D: ("magnetic flux density (tesla)", "org.bluetooth.unit.magnetic_flux_density.tesla"),
    0x272E: ("inductance (henry)", "org.bluetooth.unit.inductance.henry"),
    0x272F: ("Celsius temperature (degree Celsius)", "org.bluetooth.unit.thermodynamic_temperature.degree_celsius"),
    0x2730: ("luminous flux (lumen)", "org.bluetooth.unit.luminous_flux.lumen"),
    0x2731: ("illuminance (lux)", "org.bluetooth.unit.illuminance.lux"),
    0x2732: ("activity referred to a radionuclide (becquerel)", "org.bluetooth.unit.activity_referred_to_a_radionuclide.becquerel"),
    0x2733: ("absorbed dose (gray)", "org.bluetooth.unit.absorbed_dose.gray"),
    0x2734: ("dose equivalent (sievert)", "org.bluetooth.unit.dose_equivalent.sievert"),
    0x2735: ("catalytic activity (katal)", "org.bluetooth.unit.catalytic_activity.katal"),
    0x2740: ("dynamic viscosity (pascal second)", "org.bluetooth.unit.dynamic_viscosity.pascal_second"),
    0x2741: ("moment of force (newton metre)", "org.bluetooth.unit.moment_of_force.newton_metre"),
    0x2742: ("surface tension (newton per metre)", "org.bluetooth.unit.surface_tension.newton_per_metre"),
    0x2743: ("angular velocity (radian per second)", "org.bluetooth.unit.angular_velocity.radian_per_second"),
    0x2744: ("angular acceleration (radian per second squared)", "org.bluetooth.unit.angular_acceleration.radian_per_second_squared"),
    0x2745: ("heat flux density (watt per square metre)", "org.bluetooth.unit.heat_flux_density.watt_per_square_metre"),
    0x2746: ("heat capacity (joule per kelvin)", "org.bluetooth.unit.heat_capacity.joule_per_kelvin"),
    0x2747: ("specific heat capacity (joule per kilogram kelvin)", "org.bluetooth.unit.specific_heat_capacity.joule_per_kilogram_kelvin"),
    0x2748: ("specific energy (joule per kilogram)", "org.bluetooth.unit.specific_energy.joule_per_kilogram"),
    0x2749: ("thermal conductivity (watt per metre kelvin)", "org.bluetooth.unit.thermal_conductivity.watt_per_metre_kelvin"),
    0x274A: ("energy density (joule per cubic metre)", "org.bluetooth.unit.energy_density.joule_per_cubic_metre"),
    0x274B: ("electric field strength (volt per metre)", "org.bluetooth.unit.electric_field_strength.volt_per_metre"),
    0x274C: ("electric charge density (coulomb per cubic metre)", "org.bluetooth.unit.electric_charge_density.coulomb_per_cubic_metre"),
    0x274D: ("surface charge density (coulomb per square metre)", "org.bluetooth.unit.surface_charge_density.coulomb_per_square_metre"),
    0x274E: ("electric flux density (coulomb per square metre)", "org.bluetooth.unit.electric_flux_density.coulomb_per_square_metre"),
    0x274F: ("permittivity (farad per metre)", "org.bluetooth.unit.permittivity.farad_per_metre"),
    0x2750: ("permeability (henry per metre)", "org.bluetooth.unit.permeability.henry_per_metre"),
    0x2751: ("molar energy (joule per mole)", "org.bluetooth.unit.molar_energy.joule_per_mole"),
    0x2752: ("molar entropy (joule per mole kelvin)", "org.bluetooth.unit.molar_entropy.joule_per_mole_kelvin"),
    0x2753: ("exposure (coulomb per kilogram)", "org.bluetooth.unit.exposure.coulomb_per_kilogram"),
    0x2754: ("absorbed dose rate (gray per second)", "org.bluetooth.unit.absorbed_dose_rate.gray_per_second"),
    0x2755: ("radiant intensity (watt per steradian)", "org.bluetooth.unit.radiant_intensity.watt_per_steradian"),
    0x2756: ("radiance (watt per square metre steradian)", "org.bluetooth.unit.radiance.watt_per_square_metre_steradian"),
    0x2757: ("catalytic activity concentration (katal per cubic metre)", "org.bluetooth.unit.catalytic_activity_concentration.katal_per_cubic_metre"),
    0x2760: ("time (minute)", "org.bluetooth.unit.time.minute"),
    0x2761: ("time (hour)", "org.bluetooth.unit.time.hour"),
    0x2762: ("time (day)", "org.bluetooth.unit.time.day"),
    0x2763: ("plane angle (degree)", "org.bluetooth.unit.plane_angle.degree"),
    0x2764: ("plane angle (minute)", "org.bluetooth.unit.plane_angle.minute"),
    0x2765: ("plane angle (second)", "org.bluetooth.unit.plane_angle.second"),
    0x2766: ("area (hectare)", "org.bluetooth.unit.area.hectare"),
    0x2767: ("volume (litre)", "org.bluetooth.unit.volume.litre"),
    0x2768: ("mass (tonne)", "org.bluetooth.unit.mass.tonne"),
    0x2780: ("pressure (bar)", "org.bluetooth.unit.pressure.bar"),
    0x2781: ("pressure (millimetre of mercury)", "org.bluetooth.unit.pressure.millimetre_of_mercury"),
    0x2782: ("length (ngstrm)", "org.bluetooth.unit.length.ngstrm"),
    0x2783: ("length (nautical mile)", "org.bluetooth.unit.length.nautical_mile"),
    0x2784: ("area (barn)", "org.bluetooth.unit.area.barn"),
    0x2785: ("velocity (knot)", "org.bluetooth.unit.velocity.knot"),
    0x2786: ("logarithmic radio quantity (neper)", "org.bluetooth.unit.logarithmic_radio_quantity.neper"),
    0x2787: ("logarithmic radio quantity (bel)", "org.bluetooth.unit.logarithmic_radio_quantity.bel"),
    0x27A0: ("length (yard)", "org.bluetooth.unit.length.yard"),
    0x27A1: ("length (parsec)", "org.bluetooth.unit.length.parsec"),
    0x27A2: ("length (inch)", "org.bluetooth.unit.length.inch"),
    0x27A3: ("length (foot)", "org.bluetooth.unit.length.foot"),
    0x27A4: ("length (mile)", "org.bluetooth.unit.length.mile"),
    0x27A5: ("pressure (pound-force per square inch)", "org.bluetooth.unit.pressure.pound_force_per_square_inch"),
    0x27A6: ("velocity (kilometre per hour)", "org.bluetooth.unit.velocity.kilometre_per_hour"),
    0x27A7: ("velocity (mile per hour)", "org.bluetooth.unit.velocity.mile_per_hour"),
    0x27A8: ("angular velocity (revolution per minute)", "org.bluetooth.unit.angular_velocity.revolution_per_minute"),
    0x27A9: ("energy (gram calorie)", "org.bluetooth.unit.energy.gram_calorie"),
    0x27AA: ("energy (kilogram calorie)", "org.bluetooth.unit.energy.kilogram_calorie"),
    0x27AB: ("energy (kilowatt hour)", "org.bluetooth.unit.energy.kilowatt_hour"),
    0x27AC: ("thermodynamic temperature (degree Fahrenheit)", "org.bluetooth.unit.thermodynamic_temperature.degree_fahrenheit"),
    0x27AD: ("percentage", "org.bluetooth.unit.percentage"),
    0x27AE: ("per mille", "org.bluetooth.unit.per_mille"),
    0x27AF: ("period (beats per minute)", "org.bluetooth.unit.period.beats_per_minute"),
    0x27B0: ("electric charge (ampere hours)", "org.bluetooth.unit.electric_charge.ampere_hours"),
    0x27B1: ("mass density (milligram per decilitre)", "org.bluetooth.unit.mass_density.milligram_per_decilitre"),
    0x27B2: ("mass density (millimole per litre)", "org.bluetooth.unit.mass_density.millimole_per_litre"),
    0x27B3: ("time (year)", "org.bluetooth.unit.time.year"),
    0x27B4: ("time (month)", "org.bluetooth.unit.time.month"),
    0x27B5: ("concentration (count per cubic metre)", "org.bluetooth.unit.concentration.count_per_cubic_metre"),
    0x27B6: ("irradiance (watt per square metre)", "org.bluetooth.unit.irradiance.watt_per_square_metre"),
    0x27B7: ("milliliter (per kilogram per minute)", "org.bluetooth.unit.transfer_rate.milliliter_per_kilogram_per_minute"),
    0x27B8: ("mass (pound)", "org.bluetooth.unit.mass.pound"),
    0x27B9: ("metabolic equivalent", "org.bluetooth.unit.metabolic_equivalent"),
    0x27BA: ("step (per minute)", "org.bluetooth.unit.step_per_minute"),
    0x27BC: ("stroke (per minute)", "org.bluetooth.unit.stroke_per_minute"),
    0x27BD: ("pace (kilometre per minute)", "org.bluetooth.unit.velocity.kilometer_per_minute"),
    0x27BE: ("luminous efficacy (lumen per watt)", "org.bluetooth.unit.luminous_efficacy.lumen_per_watt"),
    0x27BF: ("luminous energy (lumen hour)", "org.bluetooth.unit.luminous_energy.lumen_hour"),
    0x27C0: ("luminous exposure (lux hour)", "org.bluetooth.unit.luminous_exposure.lux_hour"),
    0x27C1: ("mass flow (gram per second)", "org.bluetooth.unit.mass_flow.gram_per_second"),
    0x27C2: ("volume flow (litre per second)", "org.bluetooth.unit.volume_flow.litre_per_second")
]
