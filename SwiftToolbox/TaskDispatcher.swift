//
//  TaskDispatcher.swift
//  InstagramData
//
//  Created by Ben Davis on 28/01/2017.
//  Copyright © 2017 bendavisapps. All rights reserved.
//

import Foundation

public class TaskDispatcher {
    
    public let queue: DispatchQueue
    
    public init(queue: DispatchQueue) {
        self.queue = queue
    }
    
    public func async(_ task: @escaping ()->()) {
        queue.async(execute: task)
    }
    
    public func sync(_ task: @escaping ()->()) {
        queue.sync(execute: task)
    }
}
