//
//  URLEncode.swift
//  SwiftToolbox
//
//  Created by Ben Davis on 29/12/2016.
//  Copyright © 2016 bendavisapps. All rights reserved.
//

import Foundation

public extension URLRequest {
    
    /// Populate the HTTPBody of `application/x-www-form-urlencoded` request
    ///
    /// - parameter parameters:   A dictionary of keys and values to be added to the request
    mutating func setURLEncodedBody(parameters: [String : String]) {
        let parameterArray = parameters.map { (key, value) -> String in
            return "\(key)=\(value.addingPercentEscapesForQueryValue()!)"
        }
        httpBody = parameterArray.joined(separator: "&").data(using: .utf8)
    }
}

public extension String {
    
    /// Percent escape value to be added to a HTTP request
    ///
    /// This percent-escapes all characters besides the alphanumeric character set and "-", ".", "_", and "*".
    /// This will also replace spaces with the "+" character as outlined in the application/x-www-form-urlencoded spec:
    ///
    /// http://www.w3.org/TR/html5/forms.html#application/x-www-form-urlencoded-encoding-algorithm
    ///
    /// - returns: Return percent escaped string.
    func addingPercentEscapesForQueryValue() -> String? {
        let allowedCharacters = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-._* ")
        
        return self.addingPercentEncoding(withAllowedCharacters: allowedCharacters)?.replacingOccurrences(of: " ", with: "+")
    }
}
