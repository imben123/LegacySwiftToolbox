//
//  StringHelpersTests.swift
//  SwiftToolbox
//
//  Created by Ben Davis on 28/12/2016.
//  Copyright © 2016 bendavisapps. All rights reserved.
//

import XCTest
@testable import SwiftToolbox

class StringHelpersTests: XCTestCase {
    
    func testAllStringsEndWithEmptyString() {
        
        let string1 = ""
        XCTAssert(string1.ends(with: ""))

        let string2 = "Hello, world! 🙂"
        XCTAssert(string2.ends(with: ""))
    }
    
    func testCanTestSuffixOfString() {
        let string = "Hello, world!"
        XCTAssert(string.ends(with: "world!"))
    }
    
    func testCanTestSuffixOfStringWithEmoji() {
        let string = "Hello, world! 🙂"
        XCTAssert(string.ends(with: "! 🙂"))
    }
    
    func testStringSuffixPerformanceOnSimpleStrings() {
        let largeString = loadLargeSimpleString(for: type(of: self))
        measure {
            _ = largeString.ends(with: "tellus ac eros.")
        }
    }
}
