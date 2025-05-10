//
//  Task.swift
//  ToDo
//
//  Created by Alumno on 9/05/25.
//

import Foundation

struct Task: Identifiable {
    let id: UUID
    let name: String
    let dueDate: Date
}
