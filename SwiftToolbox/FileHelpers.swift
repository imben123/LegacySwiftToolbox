//
//  FileHelpers.swift
//  SwiftToolbox
//
//  Created by Ben Davis on 28/12/2016.
//  Copyright © 2016 bendavisapps. All rights reserved.
//

import Foundation

public extension FileManager {
    
    class func contentsOfFile(at filePath: String) -> String {
        let data = try! Data(contentsOf: URL(fileURLWithPath: filePath))
        let string = String(data: data, encoding: .utf8)!
        return string
    }
    
    class func allFilePaths(in directoryPath: String) -> [String] {
        let fileManager = FileManager.default
        return try! fileManager.subpathsOfDirectory(atPath: directoryPath)
    }
    
}
