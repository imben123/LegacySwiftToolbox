//
//  View.swift
//  SwiftToolbox
//
//  Created by Ben Davis on 29/12/2016.
//  Copyright © 2016 bendavisapps. All rights reserved.
//

import UIKit

public extension UIView {
    public var width: CGFloat {
        get {
            return frame.width
        }
        set {
            frame.size.width = newValue
        }
    }
    
    public var height: CGFloat {
        get {
            return frame.height
        }
        set {
            frame.size.height = newValue
        }
    }
    
    public var originX: CGFloat {
        get {
            return frame.origin.x
        }
        set {
            frame.origin.x = newValue
        }
    }
    
    public var originY: CGFloat {
        get {
            return frame.origin.y
        }
        set {
            frame.origin.y = newValue
        }
    }
    
    public var rightX: CGFloat {
        get {
            return originX + width
        }
        set {
            originX = newValue - width
        }
    }
    
    public var bottomY: CGFloat {
        get {
            return originY + height
        }
        set {
            originY = newValue - height
        }
    }
}
