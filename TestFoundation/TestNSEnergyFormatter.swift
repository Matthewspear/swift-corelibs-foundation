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
            ("test_StringFromValue", test_StringFromValue),
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
    
    func test_StringFromValue() {
        
    }
    
    func test_UnitStringFromValue() {
        
    }
}