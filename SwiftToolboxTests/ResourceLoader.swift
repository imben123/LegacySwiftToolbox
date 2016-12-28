//
//  ResourceLoader.swift
//  SwiftToolbox
//
//  Created by Ben Davis on 28/12/2016.
//  Copyright © 2016 bendavisapps. All rights reserved.
//

import Foundation

func loadLargeSimpleString(for type: AnyClass) -> String {
    let bundle = Bundle(for: type)
    let filePath = bundle.bundlePath + "/LargeString.txt"
    let data = try! Data(contentsOf: URL(fileURLWithPath: filePath))
    let string = String(data: data, encoding: .utf8)!
    return string
}
