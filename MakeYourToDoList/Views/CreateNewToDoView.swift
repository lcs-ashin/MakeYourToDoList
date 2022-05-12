//
//  CreateNewToDoView.swift
//  MakeYourToDoList
//
//  Created by Eunbi Shin on 2022-05-10.
//

import SwiftUI

struct CreateNewToDoView: View {
    
    // MARK: Stored Properties
    // Controls whether to show this view or not
    @Binding var showThisView: Bool
    
    // Date of today
    @State var dateOfToday = Date()
    
    // A task the user enters
    @State var task: String = ""
    
    // Keep track of the list of tasks
    @State var listOfTasks = [AddedTask]()
    
    // Add completed tasks to another list
    @State var completedTasks: [AddedTask] = []
    
    
    // MARK: Computed Properties
    var body: some View {
        
        NavigationView {
            
            // Tab view
            TabView {
                
                // CreateNewToDoView Tab
                VStack {
                    
                    // Set the date
                    DatePicker(selection: $dateOfToday, in: ...Date(), displayedComponents: .date) {
                        Text("Today Is")
                            .font(.custom("Avenir-Heavy", size: 40))
                        
                    }
                    .frame(width: 290, height: 30, alignment: .center)
                    .padding(.horizontal, 10)
                    .accentColor(.black)
                    .padding()
                    
                    // Enter a task
                    HStack {
                        TextField("Enter your task", text: self.$task)
                            .textFieldStyle(.roundedBorder)
                            .frame(height: 30)
                        
                        Image(systemName: "plus")
                            .font(.system(size: 25))
                            .foregroundColor(.black)
                            .onTapGesture {
                                self.listOfTasks.append(AddedTask(taskName: self.task, taskIsCompleted: false))
                                self.task = ""
                            }
                    }
                    .padding()
                    
                    
                    // List of added tasks
                    // If the list is empty...
                    if listOfTasks.isEmpty {
                        
                        Spacer()
                        
                        Text("Add a Task")
                            .foregroundColor(.secondary)
                            .font(.custom("Avenir-Book", size: 40))
                        
                        Spacer()
                        
                    } else {
                        // Show the list
                        List {
                            Section() {
                                
                                    // Task
                                    ForEach(listOfTasks, id: \.self) { newTask in
                                        
                                        HStack {
                                        
                                        Text(newTask.taskName)
                                        
                                        Spacer()
                                        
                                        // Set a due date
                                        Image(systemName: "calendar")
                                            .foregroundColor(.black)
                                            .font(.system(size: 25))
                                        }
                                    }
                                    .swipeActions(edge: .trailing,
                                                  allowsFullSwipe: true) {
                                        Button("Completed") {
                                            completedTasks.append(AddedTask(taskName: self.task, taskIsCompleted: true))
                                        }
                                        .tint(.black)
                                        
                                        Button("Delete") {
                                            
                                        }
                                        .tint(.red)
                                    }
                            }
                            .font(.custom("Avenir-Book", size: 20))
                        }
                        .listStyle(.insetGrouped)
                        
                    }
                    
                    
                    Spacer()
                    
                }
                .padding()
                .tabItem {
                    Image(systemName: "list.bullet")
                }
                
                // CompletedTaskView Tab
                CompletedTaskView(completedTasks: $completedTasks)
                    .tabItem {
                        Image(systemName: "checkmark.square")
                    }
            }
            .accentColor(.black)
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button("Create") {
                        hideView()
                    }
                    .foregroundColor(.black)
                }
            }
        }
    }
    
    // MARK: Functions
    // Makes this view go away
    func hideView() {
        showThisView = false
    }
    
    func delete(indexSet: IndexSet) {
        listOfTasks.remove(atOffsets: indexSet)
    }
    
}

struct CreateNewToDoView_Previews: PreviewProvider {
    static var previews: some View {
        CreateNewToDoView(showThisView: .constant(true))
    }
}
