//
//  ReliableNetworkTaskManagerTests.swift
//  InstagramData
//
//  Created by Ben Davis on 28/01/2017.
//  Copyright © 2017 bendavisapps. All rights reserved.
//

import XCTest
@testable import SwiftToolbox
import Reachability

class ReliableNetworkTaskManagerTests: XCTestCase {
    
    var taskDispatcher: MockTaskDispatcher!
    var mockReachability: MockReachability!
    var sut: ReliableNetworkTaskManager!
    
    override func setUp() {
        taskDispatcher = MockTaskDispatcher()
        mockReachability = MockReachability()
        sut = ReliableNetworkTaskManager(reachability: mockReachability, taskDispatcher: taskDispatcher)
    }
    
    func testCanMakeNetworkTask() {
        var taskRan = false
        sut.performTask { _ in
            taskRan = true
        }
        XCTAssert(taskRan)
        
        // Assert that everything happens async
        XCTAssert(taskDispatcher.asyncCalled)
        XCTAssertFalse(taskDispatcher.syncCalled)
    }
    
    func testTaskNotRunIfNoInternet() {
        mockReachability.testReachability = .NotReachable
        var taskRan = false
        sut.performTask { _ in
            taskRan = true
        }
        XCTAssertFalse(taskRan)
    }
    
    func testPendingTasksRanWhenReachableAgain() {
        mockReachability.testReachability = .NotReachable
        
        var taskRan = false
        sut.performTask { _ in
            taskRan = true
        }
        
        mockReachability.reachableBlock(mockReachability)
        XCTAssert(taskRan)
    }
    
    func testTaskRetriedOnFailue() {
        taskDispatcher.forceSynchronous = false
        
        var taskRan = false
        let expectation = self.expectation(description: "Task was retried")
        sut.performTask { failure in
            if !taskRan {
                taskRan = true
                failure()
            } else {
                expectation.fulfill()
            }
        }
        waitForExpectations(timeout: 0.01)
    }
}
