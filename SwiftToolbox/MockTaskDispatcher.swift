//
//  MockTaskDispatcher.swift
//  InstagramData
//
//  Created by Ben Davis on 28/01/2017.
//  Copyright © 2017 bendavisapps. All rights reserved.
//

import Foundation

// This class is for testing classes using TaskDispatcher
public class MockTaskDispatcher: TaskDispatcher {
    
    public var syncCalled = false
    public var asyncCalled = false
    
    public var forceSynchronous = true
    private var fakeSynchronousInProgress = false
    
    override public func async(_ task: @escaping () -> ()) {
        asyncCalled = true
        if forceSynchronous {
            if fakeSynchronousInProgress {
                print("ERROR!! -- Could not run synchronously in synchronous block. Running async instead.")
                return super.async(task)
            }
            fakeSynchronousInProgress = true
            super.sync(task)
            fakeSynchronousInProgress = false
        } else {
            super.async(task)
        }
    }
    
    override public func sync(_ task: @escaping () -> ()) {
        syncCalled = true
        super.sync(task)
    }
    
}
