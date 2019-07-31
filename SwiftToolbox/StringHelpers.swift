//
//  StringHelpers.swift
//  SwiftToolbox
//
//  Created by Ben Davis on 28/12/2016.
//  Copyright © 2016 bendavisapps. All rights reserved.
//

import Foundation

public extension NSString {
    
    func ends(with suffix: NSString) -> Bool {
        
        let suffixLength = suffix.length
        
        if suffixLength > self.length {
            return false
        }
        
        return self.substring(from: self.length - suffixLength) == (suffix as String)
    }
    
    func begins(with prefix: NSString) -> Bool {
        
        let prefixLength = prefix.length
        
        if prefixLength > self.length {
            return false
        }
        
        return self.substring(to: prefixLength) == (prefix as String)
    }
}

public extension String {
    
    func isSimpleString() -> Bool {
        let nsstring = self as NSString
        let numberOfUnicodeCharacters = nsstring.lengthOfBytes(using: String.Encoding.utf32.rawValue) / 4
        let numberOfUFT16CodePoints = nsstring.length
        return numberOfUnicodeCharacters == numberOfUFT16CodePoints
    }
}

public extension String {
    
    func ends(with suffix: String) -> Bool {
        return hasSuffix(suffix)
    }
}

public extension String {
    
    var url: URL? {
        return URL(string: self)
    }
    
}
