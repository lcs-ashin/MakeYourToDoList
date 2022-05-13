//
//  MakeYourToDoListApp.swift
//  MakeYourToDoList
//
//  Created by Eunbi Shin on 2022-05-09.
//

import SwiftUI

@main
struct MakeYourToDoListApp: App {
    
    @State var listOfTasks: [AddedTask] = exampleAddedTasks
    @State var task: String = ""

    
    var body: some Scene {
        WindowGroup {
            LandingView(listOfTasks: $listOfTasks, task: $task)
        }
    }
}
