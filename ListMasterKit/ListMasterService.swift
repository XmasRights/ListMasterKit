//
//  ListMasterService.swift
//  ListMasterKit
//
//  Created by Christopher Fonseka on 16/09/2018.
//  Copyright © 2018 christopherfonseka. All rights reserved.
//

import Foundation

public final class ListMasterService {

    var store = [Project : [Task]]()
    
    public init() {}
    
}

extension ListMasterService: ListMasterServiceSetProtocol {
    
    func add(task: Task) {
        
        var entry = store[task.project] ?? []
        
        guard !entry.contains(where: { $0 == task }) else {
            return
        }
        
        entry.append(task)
        
        store[task.project] = entry
    }
    
    func remove(task: Task) {
        
        guard var entry = store[task.project] else {
            return
        }
        
        entry.removeAll(where: { $0 == task })
        store[task.project] = entry
    }
    
    func add(project: Project) {
        
        guard store[project] == nil else {
            return
        }
        
        store[project] = []
    }
    
    func remove(project: Project) {
        
        store.removeValue(forKey: project)
    }
}

extension ListMasterService: ListMasterServiceGetProtocol {
    
    var allTasks: [Task] {
        return store.map { $0.value }.flatMap { $0 }
    }
    
    func allTasks(in project: Project) -> [Task]? {
        return store[project]
    }
    
    var allProjects: [Project] {
        return Array(store.keys)
    }
}
