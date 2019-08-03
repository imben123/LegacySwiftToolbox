//
//  Regex.swift
//  SwiftToolbox
//
//  Created by Ben Davis on 28/12/2016.
//  Copyright © 2016 bendavisapps. All rights reserved.
//

import Foundation

public extension String {
    
    func matches(of pattern: String, groupIndex: Int = 0) -> [String] {
        
        let regex = try! NSRegularExpression(pattern: pattern, options: [])
        
        var result: [String] = []

        for stringSubstring in self.split(separator: "\n") {
            let string = String(stringSubstring)
            let matches = regex.matches(in: string, options: [], range: string.fullNSRange)
            for match in matches {
                let range = match.range(at: groupIndex)
                let substring = string[swiftRange(from: range)]
                result.append(String(substring))
            }

        }
        
        return result
    }

}
