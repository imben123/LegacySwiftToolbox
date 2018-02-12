//
//  Collection+UtilsTests.swift
//  SwiftToolboxTests
//
//  Created by Ben Davis on 12/02/2018.
//  Copyright © 2018 bendavisapps. All rights reserved.
//

import XCTest
@testable import SwiftToolbox

class Collection_UtilsTests: XCTestCase {
    
    func test_countWhere() {
        let array = [1,2,3,4,5]
        let result = array.count(where: { $0 > 2 })
        XCTAssertEqual(result, 3)
    }
    
}
