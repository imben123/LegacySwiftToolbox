//
//  StringRangeConversionsTests.swift
//  SwiftToolbox
//
//  Created by Ben Davis on 28/12/2016.
//  Copyright © 2016 bendavisapps. All rights reserved.
//

import XCTest
@testable import SwiftToolbox

class StringRangeConversionsTests: XCTestCase {
    
    func testGetFullRangeOfEmptyString() {
        let string = ""
        let range = string.fullRange
        XCTAssertEqual(range.lowerBound, string.startIndex)
        XCTAssertEqual(range.upperBound, string.endIndex)
    }
    
    func testGetFullRangeOfNonEmptyString() {
        let string = "Hello, world! 🙂"
        let range = string.fullRange
        XCTAssertEqual(range.lowerBound, string.startIndex)
        XCTAssertEqual(range.upperBound, string.endIndex)
    }
    
    func testGetNSRangeOfEmptyString() {
        let string = ""
        let range: NSRange = string.fullNSRange
        XCTAssertEqual(range.length, 0)
        XCTAssertEqual(range.location, 0)
    }
    
    func testGetNSRangeOfNonEmptyString() {
        let string = "Hello, world! 🙂"
        let range: NSRange = string.fullNSRange
        XCTAssertEqual(range.length, 16) // emoji character counts as 2 unichars in NSString
        XCTAssertEqual(range.location, 0)
    }
    
    func testGetSwiftRangeFromNSRange() {
        let string = "Hello, world! 🙂"
        let expected = string.range(of: "Hello")
        let nsRange = NSRange(location: 0, length: 5)
        let result = string.swiftRange(from: nsRange)
        XCTAssertEqual(result, expected)
    }
    
    func testGetSwiftRangeFromNSRangeIncludingEmoji() {
        let string = "Hello 🙂, world!"
        let expected = string.range(of: "Hello 🙂,")
        let nsRange = NSRange(location: 0, length: 9)
        let result = string.swiftRange(from: nsRange)
        XCTAssertEqual(result, expected)
    }
    
    func testGetSwiftRangeFromNSRangeAfterEmoji() {
        let string = "Hello 🙂, world!"
        let expected = string.range(of: " world!")
        let nsRange = NSRange(location: 9, length: 7)
        let result = string.swiftRange(from: nsRange)
        XCTAssertEqual(result, expected)
    }
    
    func testPerformanceSwiftRange() {
        let largeString = loadLargeSimpleString(for: type(of: self))
        let nsrange = largeString.fullNSRange
        measure {
            _ = largeString.swiftRange(from: nsrange)
        }
    }
}
