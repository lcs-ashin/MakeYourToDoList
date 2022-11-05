//
//  MakeYourToDoListApp.swift
//  MakeYourToDoList
//
//  Created by Eunbi Shin on 2022-05-09.
//

import SwiftUI

@main
struct MakeYourToDoListApp: App {
    
    @State var listOfTasks: [AddedTask] = []
    @State var dateOfToday: Date = Date()
    @State var themeColor: Color = Color.black
    
    var body: some Scene {
        WindowGroup {
            LandingView(listOfTasks: $listOfTasks, dateOfToday: $dateOfToday)
        }
    }
}
