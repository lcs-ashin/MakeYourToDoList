//
//  AddedTask.swift
//  MakeYourToDoList
//
//  Created by Eunbi Shin on 2022-05-11.
//

import Foundation

struct AddedTask: Identifiable {
    let id = UUID()
    let taskName: String
    let taskIsCompleted: Bool
}

let exampleAddedTasks = [
    AddedTask(taskName: "Calculus", taskIsCompleted: false)
]
