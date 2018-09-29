//
//  ListMasterService.swift
//  ListMasterKit
//
//  Created by Christopher Fonseka on 16/09/2018.
//  Copyright © 2018 christopherfonseka. All rights reserved.
//

import Foundation

public final class ListMasterService {

    var store = [Project : Set<Task>]()
    
    public init() {}
    
}

extension ListMasterService: ListMasterServiceSetProtocol {
    
    func add(task: Task) {
        
        var entry = store[task.project] ?? []
        entry.insert(task)
        
        store[task.project] = entry
    }
    
    func remove(task: Task) {
        
        guard var entry = store[task.project] else { return }
        
        entry.remove(task)
        store[task.project] = entry
    }
    
    func add(project: Project) {
        
        guard store[project] == nil else { return }
        store[project] = []
    }
    
    func remove(project: Project) {
        
        store.removeValue(forKey: project)
    }
}

extension ListMasterService: ListMasterServiceGetProtocol {
    
    var allTasks: Set<Task> {
        
        return store.reduce(into: Set<Task>()) { (acc, args) in
            let (_, tasks) = args
            acc = acc.union(tasks)
        }
    }
    
    func allTasks(in project: Project) -> Set<Task>? {
        return store[project]
    }
    
    var allProjects: Set<Project> {
        return Set(store.keys)
    }
}
