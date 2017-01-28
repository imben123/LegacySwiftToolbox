//
//  MockReachability.swift
//  SwiftToolbox
//
//  Created by Ben Davis on 28/01/2017.
//  Copyright © 2017 bendavisapps. All rights reserved.
//

import Reachability

public class MockReachability: Reachability {
    
    public var testReachability: NetworkStatus = .ReachableViaWiFi
    
    override public func currentReachabilityStatus() -> NetworkStatus {
        return testReachability
    }
    
    override public func isReachable() -> Bool {
        return testReachability != .NotReachable
    }
}
