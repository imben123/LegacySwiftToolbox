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
        
        let matches = regex.matches(in: self, options: [], range: self.fullNSRange)
        for match in matches {
            let range = match.rangeAt(groupIndex)
            result.append(self.substring(with: self.swiftRange(from: range)))
        }
        
        return result
    }

}
