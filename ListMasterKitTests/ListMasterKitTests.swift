//
//  ListMasterKitTests.swift
//  ListMasterKitTests
//
//  Created by Christopher Fonseka on 16/09/2018.
//  Copyright © 2018 christopherfonseka. All rights reserved.
//

import XCTest
@testable import ListMasterKit

class ListMasterKitTests: XCTestCase {

    func testAddTask() {
    
        let service = ListMasterService()
        let project = Project(identifier: UUID(), title: "Project A")
        let task    = Task(identifier: UUID(), title: "Task A", project: project)
        
        service.add(task: task)
        
        XCTAssertTrue(service.allTasks.contains(task), "Newly added task not retrieved")
        
        guard let retrievedProject = service.allTasks(in: project) else {
            XCTFail("Newly added project not in service")
            return
        }
        
        XCTAssertTrue(retrievedProject.contains(task), "Newly added task not bound to project")
    }
    
    func testAddDuplicateTask() {
        
        let service = ListMasterService()
        let project = Project(identifier: UUID(), title: "Project A")
        let task    = Task(identifier: UUID(), title: "Task A", project: project)
        
        service.add(task: task)
        service.add(task: task)
        
        XCTAssertTrue(service.allTasks.count == 1, "Duplicate tasks not handled correctly")
    }
    
    func testRemoveTask() {
        
        let service = ListMasterService()
        let project = Project(identifier: UUID(), title: "Project A")
        let task    = Task(identifier: UUID(), title: "Task A", project: project)
        
        service.add(task: task)
        service.remove(task: task)
        
        XCTAssertTrue(service.allTasks.isEmpty, "Remove all tasks, somehow not empty")
        XCTAssertTrue(!service.allProjects.isEmpty, "Removing all tasks from project should not remove project")
    }
    
    func testAddProject() {
        
        let service = ListMasterService()
        let project = Project(identifier: UUID(), title: "Project A")
        
        service.add(project: project)
        
        XCTAssertTrue(service.allProjects.contains(project), "Newly added project not in service")
    }
    
    func testRemoveProject() {
        
        let service = ListMasterService()
        let project = Project(identifier: UUID(), title: "Project A")
        
        service.remove(project: project)
        
        XCTAssertTrue(service.allProjects.isEmpty, "Removed all projects, somehow not empty")
    }
}
