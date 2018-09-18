//
//  Task.swift
//  ListMasterKit
//
//  Created by Christopher Fonseka on 16/09/2018.
//  Copyright © 2018 christopherfonseka. All rights reserved.
//

import Foundation

public struct Task: Equatable, Hashable {
    
    let identifier: UUID
    
    public let title: String
    
    public let project: Project
}
