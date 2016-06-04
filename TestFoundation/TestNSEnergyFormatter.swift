// This source file is part of the Swift.org open source project
//
// Copyright (c) 2014 - 2016 Apple Inc. and the Swift project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See http://swift.org/LICENSE.txt for license information
// See http://swift.org/CONTRIBUTORS.txt for the list of Swift project authors
//

#if DEPLOYMENT_RUNTIME_OBJC || os(Linux)
    import Foundation
    import XCTest
#else
    import SwiftFoundation
    import SwiftXCTest
#endif

class TestNSEnergyFormatter: XCTestCase {
    
    let DEFAULT_LOCALE = "en_US"
    
    static var allTests : [(String, (TestNSEnergyFormatter) -> () throws -> Void)] {
        return [
            ("test_BasicConstruction", test_BasicConstruction),
            ("test_DefaultValues", test_DefaultValues),
            ("test_StringFromValueShort", test_StringFromValueShort),
            ("test_StringFromValueMedium", test_StringFromValueMedium),
            ("test_StringFromValueLong", test_StringFromValueLong),
            ("test_UnitStringFromValue", test_UnitStringFromValue)
        ]
    }
    
    func test_BasicConstruction() {
        
        let f = NSEnergyFormatter()
        
        // Assert values exist
        XCTAssertNotNil(f)
        XCTAssertNotNil(f.unitStyle)
        XCTAssertNotNil(f.forFoodEnergyUse)
    }
    
    func test_DefaultValues() {
    
        let f = NSEnergyFormatter()
        
        // Assert default values
        XCTAssertFalse(f.forFoodEnergyUse)
        XCTAssert(f.unitStyle == .Medium)
    }
    
    func test_StringFromValueShort() {
        
        let shortUnits: [NSEnergyFormatterUnit:String]
            = [.Joule: "J", .Kilojoule: "kJ",
               .Calorie: "cal", .Kilocalorie: "kcal"]
        
        let f = NSEnergyFormatter()
        f.unitStyle = .Short
        
        let testNumber = 10.1
        
        for (input, result) in shortUnits {
            
            let expectedResult = String(testNumber) + result
            XCTAssertEqual(f.stringFromValue(testNumber, unit: input), expectedResult)
        }
    }
    
    func test_StringFromValueMedium() {
    
        let valueResultMedium: [NSEnergyFormatterUnit:String]
            = [.Joule: " J", .Kilojoule: " kJ",
               .Calorie: " cal", .Kilocalorie: " kcal"]
        
        let f = NSEnergyFormatter()
        f.unitStyle = .Medium
        
        let testNumber = 10.1
        
        for (input, result) in valueResultMedium {
            
            let expectedResult = String(testNumber) + result
            XCTAssertEqual(f.stringFromValue(testNumber, unit: input), expectedResult)
        }
    }
    
    func test_StringFromValueLong() {
        
        let singularLong: [NSEnergyFormatterUnit:String]
            = [.Joule: " joule", .Kilojoule: " kilojoule",
               .Calorie: " calorie", .Kilocalorie: " kilocalorie"]
        
        let multipleLong: [NSEnergyFormatterUnit:String]
            = [.Joule: " joules", .Kilojoule: " kilojoules",
               .Calorie: " calories", .Kilocalorie: " kilocalories"]
        
        let f = NSEnergyFormatter()
        f.unitStyle = .Long
        
        var testNumber = 1.0
        
        for (input, result) in singularLong {
            
            let expectedResult = String(testNumber) + result
            XCTAssertEqual(f.stringFromValue(testNumber, unit: input), expectedResult)
        }
        
        testNumber = 10.1
        
        for (input, result) in multipleLong {
            
            let expectedResult = String(testNumber) + result
            XCTAssertEqual(f.stringFromValue(testNumber, unit: input), expectedResult)
        }
    }
    
    func test_UnitStringFromValue() {
        
    }
}