//
//  AddedTask.swift
//  MakeYourToDoList
//
//  Created by Eunbi Shin on 2022-05-11.
//

import Foundation

struct AddedTask: Identifiable, Equatable {
    let id = UUID()
    let taskName: String
    let taskIsCompleted: Bool
    let savedDate: Date
    let selectedFont: String
}

let exampleAddedTasks = [
    AddedTask(taskName: "Calculus", taskIsCompleted: false, savedDate: Date(), selectedFont: "Helvetica Neue")
]
