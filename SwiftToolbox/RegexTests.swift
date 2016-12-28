//
//  RegexTests.swift
//  SwiftToolbox
//
//  Created by Ben Davis on 28/12/2016.
//  Copyright © 2016 bendavisapps. All rights reserved.
//

import XCTest
@testable import SwiftToolbox

class RegexTests: XCTestCase {
    
    func testCanGetArrayOfMatchesForRegexPattern() {
        let largeString = loadLargeSimpleString(for: type(of: self))
        let pattern = "\\W([^\\W]{12}\\.)\\W"
        let result = largeString.matches(of: pattern)
        let expected = [" pellentesque. ",
                        " sollicitudin. ",
                        " sollicitudin. ",
                        " pellentesque. ",
                        " sollicitudin.\n",
                        " sollicitudin.\n",
                        " sollicitudin. ",
                        " sollicitudin. ",
                        " sollicitudin. ",
                        " pellentesque. ",
                        " pellentesque. ",
                        " sollicitudin. ",
                        " sollicitudin. ",
                        " pellentesque. ",
                        " pellentesque. ",
                        " pellentesque. ",
                        " sollicitudin. ",
                        " sollicitudin. ",
                        " sollicitudin. "]
        
        XCTAssertEqual(result, expected)
    }
    
}
