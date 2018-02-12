//
//  StringRangeConversions.swift
//  SwiftToolbox
//
//  Created by Ben Davis on 28/12/2016.
//  Copyright © 2016 bendavisapps. All rights reserved.
//

import Foundation

public extension String {
    
    var fullRange: Range<String.Index> {
        return Range(uncheckedBounds: (lower: self.startIndex, upper: self.endIndex))
    }
    
    var fullNSRange: NSRange {
        return NSRange(location: 0, length: (self as NSString).length)
    }
    
    func swiftRange(from range: NSRange) -> Range<String.Index> {
        
        if self.isSimpleString() {
            return naiveSwiftRange(from: range)
        } else {
            return _swiftRange(from: range)
        }
    }
    
    private func _swiftRange(from range: NSRange) -> Range<String.Index> {
        
        let substring = (self as NSString).substring(with: range) as String
        let subStringLength = substring.count
        
        let prefix = (self as NSString).substring(to: range.location)
        let prefixLength = prefix.count
        
        let startIndex = self.index(self.startIndex, offsetBy: prefixLength)
        let endIndex = self.index(startIndex, offsetBy: subStringLength)
        
        return Range(uncheckedBounds: (lower: startIndex, upper: endIndex))
    }
    
    private func naiveSwiftRange(from range: NSRange) -> Range<String.Index> {
        let startIndex = self.index(self.startIndex, offsetBy: range.location)
        let endIndex = self.index(self.startIndex, offsetBy: range.location + range.length)
        
        return Range(uncheckedBounds: (lower: startIndex, upper: endIndex))
    }
}
