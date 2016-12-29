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
    
    
    // MARK: Prefix
    
    func testAllStringsBeginWithEmptyString() {
        
        let string1 = ""
        XCTAssert(string1.begins(with: ""))
        
        let string2 = "Hello, world! 🙂"
        XCTAssert(string2.begins(with: ""))
    }
    
    func testCanTestPrefixOfString() {
        let string = "Hello, world!"
        XCTAssert(string.begins(with: "Hello, "))
        XCTAssertFalse(string.begins(with: "Something else"))
        XCTAssertFalse(string.begins(with: "Something else that's really long"))
    }
    
    func testCanTestPrefixOfStringWithEmoji() {
        let string = "Hello, 🙂 world!"
        XCTAssert(string.begins(with: "Hello, 🙂"))
        XCTAssertFalse(string.begins(with: "💩"))
    }
    
    // MARK: Suffix

    func testAllStringsEndWithEmptyString() {
        
        let string1 = ""
        XCTAssert(string1.ends(with: ""))

        let string2 = "Hello, world! 🙂"
        XCTAssert(string2.ends(with: ""))
    }
    
    func testCanTestSuffixOfString() {
        let string = "Hello, world!"
        XCTAssert(string.ends(with: "world!"))
        XCTAssertFalse(string.ends(with: "Something else"))
        XCTAssertFalse(string.ends(with: "Something else that's really long"))
    }
    
    func testCanTestSuffixOfStringWithEmoji() {
        let string = "Hello, world! 🙂"
        XCTAssert(string.ends(with: "! 🙂"))
        XCTAssertFalse(string.ends(with: "💩"))
    }
    
    // MARK: Suffix performance

    func testStringSuffixPerformanceOnSimpleStrings() {
        let largeString = loadLargeSimpleString(for: type(of: self))
        measure {
            _ = largeString.ends(with: "tellus ac eros.")
        }
    }
    
    // MARK: Convert string to URL

    func testConvertStringToURL() {
        let string = "http://www.google.com"
        XCTAssertEqual(string.url!, URL(string: string))
        XCTAssertNil("Not a url".url)
    }
}
