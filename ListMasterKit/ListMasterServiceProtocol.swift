//
//  ListMasterServiceProtocol.swift
//  ListMasterKit
//
//  Created by Christopher Fonseka on 16/09/2018.
//  Copyright © 2018 christopherfonseka. All rights reserved.
//

import Foundation

protocol ListMasterServiceGetProtocol {
    
    var allTasks: Set<Task> { get }
    
    func allTasks(in project: Project) -> Set<Task>?
    
    var allProjects: Set<Project> { get }

}

protocol ListMasterServiceSetProtocol {
    
    func add(task: Task)
    func remove(task: Task)
    
    func add(project: Project)
    func remove(project: Project)
    
}
