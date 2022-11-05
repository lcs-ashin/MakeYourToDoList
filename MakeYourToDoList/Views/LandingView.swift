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
    
    // Added tasks and due dates of the tasks
    @Binding var dateOfToday: Date
    
    // Whether a date has been selected or not
    @State var selectionMade = false
    
    // Change the theme colour
    // Controls the theme colour
    @State var themeColor: Color = Color.black
    
    // Controls the font
    @State var selectedFont: String = "Helvetica Neue"
    
    // MARK: Computed Properties
    var body: some View {
        
        TabView {
            
            // To Do
            ZStack {
                
                VStack {
                    
                    Text("To-Do")
                        .font(.custom("\(selectedFont) Medium", size: 40))
                        .padding(.vertical, 30)
                        .foregroundColor(themeColor)
                    
                    if listOfTasks.isEmpty {
                        
                        Spacer()
                        
                        Text("Add New Tasks")
                            .foregroundColor(.secondary)
                            .font(.custom("\(selectedFont) Light", size: 30))
                        
                        Spacer()
                        
                    } else {
                        
                        HStack {
                            
                            // Date picker to filter the tasks
                            DatePicker("Date Filter:",
                                       selection: $dateOfToday,
                                       displayedComponents: .date)
                            .datePickerStyle(.compact)
                            .accentColor(themeColor)
                            .font(.custom("\(selectedFont) Light", size: 18))
                            .padding(.horizontal)
                            
                            // Showing the reset button
                            Button(action: {
                                
                                selectionMade = false
                                print("Resetting")
                                
                            }, label: {
                                
                                Image(systemName: "arrow.counterclockwise.circle.fill")
                                
                            })
                            .foregroundColor(themeColor)
                            .font(Font.system(size: 30))
                            
                        }
                        .frame(width: 285, height: 10)
                        .padding(.horizontal)
                        
                        // List of added tasks
                        List(filtered(by: dateOfToday, from: listOfTasks, selectionActive: selectionMade)) { currentToDoList in
                            
                            // TaskInListView
                            TaskInListView(taskName: currentToDoList.taskName,
                                           savedDate: currentToDoList.savedDate,
                                           selectedFont: currentToDoList.selectedFont)
                            .swipeActions(edge: .trailing,
                                          allowsFullSwipe: true) {
                                
                                // Buttons show up when the task is slided to the left
                                Button("Completed") {
                                    
                                    let newCompletedTask = AddedTask(taskName: currentToDoList.taskName,
                                                                     taskIsCompleted: true,
                                                                     savedDate: currentToDoList.savedDate,
                                                                     selectedFont: currentToDoList.selectedFont)
                                    
                                    // Add to the list of teams
                                    completedTasks.append(newCompletedTask)
                                    
                                    // Delete from To-Do list
                                    listOfTasks.remove(at: listOfTasks.firstIndex(of: currentToDoList)!)
                                    
                                }
                                .tint(themeColor)
                                .font(.custom("\(selectedFont) Light", size: 20))
                                
                                Button("Delete") {
                                    
                                    listOfTasks.remove(at: listOfTasks.firstIndex(of: currentToDoList)!)
                                    
                                }
                                .tint(.red)
                                .font(.custom("\(selectedFont) Light", size: 20))
                                
                            }
                        }
                        .listStyle(.insetGrouped)
                        .padding(.vertical)
                        .onChange(of: dateOfToday) { newValue in
                            
                            selectionMade = true
                            print(selectionMade)
                            
                        }
                    }
                }
                
                
                // New To-Do list button
                Image(systemName: "plus.circle.fill")
                    .foregroundColor(themeColor)
                    .font(Font.system(size: 65))
                    .offset(x: 135, y: 260)
                    .onTapGesture {
                        
                        showNewToDoPage = true
                        
                    }
                    .sheet(isPresented: $showNewToDoPage) {
                        
                        CreateNewToDoView(showThisView: $showNewToDoPage,
                                          listOfTasks: $listOfTasks,
                                          themeColor: $themeColor,
                                          selectedFont: $selectedFont)
                        
                    }
                
                // Settings button
                Image(systemName: "gear.circle.fill")
                    .foregroundColor(themeColor)
                    .font(Font.system(size: 65))
                    .offset(x: 135, y: 180)
                    .onTapGesture {
                        
                        showSettings = true
                        
                    }
                    .sheet(isPresented: $showSettings) {
                        
                        SettingsView(showThisView: $showSettings, themeColor: $themeColor, selectedFont: $selectedFont)
                        
                    }
            }
            .tabItem {
                
                VStack {
                    
                    Image(systemName: "list.bullet")
                    Text("To-Do")
                    
                }
            }
            
            
            // Completed Tasks
            CompletedTaskView(completedTasks: $completedTasks,
                              listOfTasks: $listOfTasks,
                              dateOfToday: $dateOfToday,
                              themeColor: $themeColor,
                              selectedFont: $selectedFont)
            .tabItem {
                
                VStack {
                    
                    Image(systemName: "checkmark.square")
                    Text("Completed")
                    
                }
            }
        }
        .accentColor(themeColor)
        .padding(.bottom, 15)
    }
    
    func delete(indexSet: IndexSet) {
        
        listOfTasks.remove(atOffsets: indexSet)
        
    }
    
    func filtered(by dateSelected: Date, from list: [AddedTask], selectionActive: Bool) -> [AddedTask] {
        
        // Don't filter results when a selection is not active
        if selectionActive == false {
            
            return list
            
        } else {
            
            var filteredResults: [AddedTask] = []
            
            for savedTask in list {
                
                if dateSelected == savedTask.savedDate {
                    
                    filteredResults.append(savedTask)
                    
                }
                
            }
            
            return filteredResults
            
        }
    }
}

struct LandingView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        NavigationView {
            
            LiveContentView()
            
        }
    }
    
    struct LiveContentView: View {
        
        @State var tasksToDo: [AddedTask] = []
        
        var body: some View {
            
            LandingView(listOfTasks: $tasksToDo,
                        dateOfToday: .constant(Date()))
            
        }
    }
}
