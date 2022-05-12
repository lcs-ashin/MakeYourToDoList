//
//  LandingView.swift
//  MakeYourToDoList
//
//  Created by Eunbi Shin on 2022-05-09.
//

import SwiftUI

struct LandingView: View {
    // MARK: Stored Properties
    @Binding var listOfTasks: [AddedTask]

    // Controls whether these views are showing or not
    @State var showNewToDoPage = false
    @State var showSettings = false
    
    // Add completed tasks to another list
    @State var completedTasks: [AddedTask] = []
    
    // MARK: Computed Properties
    var body: some View {
        
        TabView {
            
            // To Do
            ZStack {
                VStack {
                    Text("To-Do")
                        .font(.custom("Avenir-Heavy", size: 40))
                        .padding(.vertical, 30)
                    
                    List(listOfTasks) { currentToDoList in
                        Text(currentToDoList.taskName)
                    }
                    .font(.custom("Avenir-Book", size: 20))
                    .listStyle(.insetGrouped)
                }
                
                // New To-Do list button
                Image(systemName: "plus.circle.fill")
                    .foregroundColor(.black)
                    .font(Font.system(size: 70))
                    .offset(x: 140, y: 270)
                    .onTapGesture {
                        showNewToDoPage = true
                    }
                    .sheet(isPresented: $showNewToDoPage) {
                        CreateNewToDoView(showThisView: $showNewToDoPage, listOfTasks: $listOfTasks)
                    }
                
                // Settingss button
                Image(systemName: "gear.circle.fill")
                    .foregroundColor(.black)
                    .font(Font.system(size: 70))
                    .offset(x: 140, y: 180)
                    .onTapGesture {
                        showSettings = true
                    }
                    .sheet(isPresented: $showSettings) {
                        SettingsView(showThisView: $showSettings)
                    }
            }
            .tabItem {
                VStack {
                    Image(systemName: "list.bullet")
                    Text("To-Do")
                        .font(.custom("Avenir-Book", size: 15))
                }
            }
            
            
            // Completed Tasks
            CompletedTaskView(completedTasks: $completedTasks)
                .tabItem {
                    Image(systemName: "checkmark.square")
                    Text("Completed")
                        .font(.custom("Avenir-Book", size: 15))
                        
                }
        }
        .accentColor(.black)
        .padding(.bottom, 15)
    }
}

struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LandingView(listOfTasks: .constant(exampleAddedTasks))
        }
    }
}
