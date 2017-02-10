//
//  ReliableNetworkTaskManager.swift
//  InstagramData
//
//  Created by Ben Davis on 28/01/2017.
//  Copyright © 2017 bendavisapps. All rights reserved.
//

import Foundation
import Reachability

public typealias ReliableNetworkTask = (_ failure: ()->())->()

public class MockReliableNetworkTaskManager: ReliableNetworkTaskManager {
    
    public var performTaskCalled = false
    
    override public func performTask(_ task: @escaping ReliableNetworkTask) {
        performTaskCalled = true
        super.performTask(task)
    }
}

public class ReliableNetworkTaskManager {
    
    let taskDispatcher: TaskDispatcher
    let reachability: Reachability
    var pendingTasks: [ReliableNetworkTask] = []
    
    public init(reachability: Reachability, taskDispatcher: TaskDispatcher) {
        self.taskDispatcher = taskDispatcher
        self.reachability = reachability
        reachability.reachableBlock = { [weak self] (reachability) in
            
            guard let pendingTasks = self?.pendingTasks else {
                return
            }
            
            self?.pendingTasks = []
            
            for task in pendingTasks {
                self?.performTask(task)
            }
        }
    }
    
    public convenience init(reachability: Reachability) {
        let taskDispatcher = TaskDispatcher(queue: DispatchQueue(label: "ReliableNetworkTaskManagerQueue"))
        self.init(reachability: reachability, taskDispatcher: taskDispatcher)
    }
    
    public convenience init() {
        let reachability = Reachability.forInternetConnection()!
        self.init(reachability: reachability)
    }
    
    public func performTask(_ task: @escaping ReliableNetworkTask) {
        
        guard reachability.isReachable() else {
            pendingTasks.append(task)
            return
        }
        
        taskDispatcher.async {
            task({
                self.performTask(task)
            })
        }
    }
}
