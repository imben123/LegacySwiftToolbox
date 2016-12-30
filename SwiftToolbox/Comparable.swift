//
//  Comparable.swift
//  SwiftToolbox
//
//  Created by Ben Davis on 30/12/2016.
//  Copyright © 2016 bendavisapps. All rights reserved.
//

import Foundation

public func optionalsAreEqual<T: Equatable>(firstVal: T?, secondVal: T?) -> Bool{
    
    if let firstVal = firstVal, let secondVal = secondVal {
        return firstVal == secondVal
    }
    else{
        return firstVal == nil && secondVal == nil
    }
}
