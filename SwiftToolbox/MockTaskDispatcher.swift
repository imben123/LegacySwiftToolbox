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
    public var asyncOnMainQueueCalled = false
    
    public var forceSynchronous = true
    private var synchronousTaskInProgress = false
    
    public init() {
        super.init(queue: DispatchQueue(label: "MockTaskDispatcher.queue"))
    }
    
    override public func async(_ task: @escaping () -> ()) {
        asyncCalled = true
        if forceSynchronous {
            if synchronousTaskInProgress {
                print("ERROR!! -- Could not run synchronously in synchronous block. Running async instead.")
                return super.async(task)
            }
            synchronousTaskInProgress = true
            super.sync(task)
            synchronousTaskInProgress = false
        } else {
            super.async(task)
        }
    }
    
    override public func sync(_ task: @escaping () -> ()) {
        syncCalled = true
        super.sync(task)
    }
    
    public override func asyncOnMainQueue(_ task: @escaping () -> ()) {
        asyncOnMainQueueCalled = true
        if forceSynchronous {
            task()
        } else {
            super.asyncOnMainQueue(task)
        }
    }
    
}
