// This source file is part of the Swift.org open source project
//
// Copyright (c) 2014 - 2016 Apple Inc. and the Swift project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See http://swift.org/LICENSE.txt for license information
// See http://swift.org/CONTRIBUTORS.txt for the list of Swift project authors
//


public enum NSEnergyFormatterUnit : Int {
    
    case Joule
    case Kilojoule
    case Calorie // chemistry "calories", abbr "cal"
    case Kilocalorie // kilocalories in general, abbr “kcal”, or “C” in some locales (e.g. US) when usesFoodEnergy is set to YES
}


public class NSEnergyFormatter : NSFormatter {
    
    public override init() {
        self.unitStyle = NSFormattingUnitStyle.Medium
        self.forFoodEnergyUse = false
        super.init()
    }
    
    public required init?(coder: NSCoder) {
        NSUnimplemented()
    }
    
    /*@NSCopying*/ public var numberFormatter: NSNumberFormatter! // default is NSNumberFormatter with NSNumberFormatterDecimalStyle
    public var unitStyle: NSFormattingUnitStyle // default is NSFormattingUnitStyleMedium
    public var forFoodEnergyUse: Bool // default is NO; if it is set to YES, NSEnergyFormatterUnitKilocalorie may be “C” instead of “kcal"
    
    private let singularUnit: [NSEnergyFormatterUnit:[NSFormattingUnitStyle: String]]
        = [.Joule:[.Short: "J", .Medium: "J", .Long: "joule"],
           .Kilojoule: [.Short: "kJ", .Medium : "kJ", .Long: "kilojoule"],
           .Calorie: [.Short: "cal", .Medium : "cal", .Long: "calorie"],
           .Kilocalorie: [.Short: "kcal", .Medium : "kcal", .Long: "kilocalorie"]]
    
    private let multipleUnits: [NSEnergyFormatterUnit:[NSFormattingUnitStyle: String]]
        = [.Joule:[.Short: "J", .Medium: "J", .Long: "joules"],
           .Kilojoule: [.Short: "kJ", .Medium : "kJ", .Long: "kilojoules"],
           .Calorie: [.Short: "cal", .Medium : "cal", .Long: "calories"],
           .Kilocalorie: [.Short: "kcal", .Medium : "kcal", .Long: "kilocalories"]]
    
    // Format a combination of a number and an unit to a localized string.
    public func stringFromValue(_ value: Double, unit: NSEnergyFormatterUnit) -> String {
        
        let unit = (value == 1) ? singularUnit[unit]![unitStyle]! : multipleUnits[unit]![unitStyle]!
        
        return "\(value)\(unitStyle != .Short ? " " : "")\(unit)"
    }
    
    // Format a number in joules to a localized string with the locale-appropriate unit and an appropriate scale (e.g. 10.3J = 2.46cal in the US locale).
    public func stringFromJoules(_ numberInJoules: Double) -> String { NSUnimplemented() }
    
    // Return a localized string of the given unit, and if the unit is singular or plural is based on the given number.
    public func unitStringFromValue(_ value: Double, unit: NSEnergyFormatterUnit) -> String {
     
        return "\(value == 1 ? singularUnit[unit]![unitStyle]! : multipleUnits[unit]![unitStyle]!)"
    }
    
    // Return the locale-appropriate unit, the same unit used by -stringFromJoules:.
    public func unitStringFromJoules(_ numberInJoules: Double, usedUnit unitp: UnsafeMutablePointer<NSEnergyFormatterUnit>) -> String { NSUnimplemented() }
    
    
    /// - Experiment: This is a draft API currently under consideration for official import into Foundation as a suitable alternative
    /// - Note: Since this API is under consideration it may be either removed or revised in the near future
    public override func objectValue(_ string: String) throws -> AnyObject? { return nil }
}