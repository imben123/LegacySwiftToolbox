//
//  URL.swift
//  SwiftToolbox
//
//  Created by Ben Davis on 03/08/2019.
//  Copyright © 2019 bendavisapps. All rights reserved.
//

import Foundation

public extension URL {
    func appendingURLParameters(urlParameters: [String: String?], resolvingAgainstBaseURL: Bool = false) -> URL {
        var urlComponents = URLComponents(url: self, resolvingAgainstBaseURL: resolvingAgainstBaseURL)!
        var queryItems: [URLQueryItem] = urlComponents.queryItems ?? []
        for (key, value) in urlParameters {
            queryItems.append(URLQueryItem(name: key, value: value))
        }
        urlComponents.queryItems = queryItems
        return urlComponents.url!
    }
}
