//
//  Size.swift
//  SwiftToolbox
//
//  Created by Ben Davis on 16/04/2017.
//  Copyright © 2017 bendavisapps. All rights reserved.
//

import Foundation

public extension CGSize {
    
    static func *(_ lhs: CGSize, rhs: CGFloat) -> CGSize {
        return CGSize(width: lhs.width*rhs, height: lhs.height*rhs)
    }
    
}
