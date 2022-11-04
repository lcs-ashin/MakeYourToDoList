//
//  CompletedTaskView.swift
//  MakeYourToDoList
//
//  Created by Eunbi Shin on 2022-05-10.
//

import SwiftUI

struct CompletedTaskView: View {
    
    // MARK: Stored Properties
    // List of completed tasks
    @Binding var completedTasks: [AddedTask]
    
    // List of not completed tasks
    @Binding var listOfTasks: [AddedTask]
    
    // Due date for the task
    @Binding var dateOfToday: Date
    
    
    // MARK: Computed Properties
    var body: some View {
        
        VStack {
            
            // Title
            Text("Completed Tasks")
                .font(Font.custom("Helvetica Neue Medium", size: 35))
                .padding(.vertical, 30)
            
            
            // List of completed tasks
            if completedTasks.isEmpty {
                
                Spacer()
                
                Text("Complete your tasks")
                    .foregroundColor(.secondary)
                    .font(.custom("Helvetica Neue Light", size: 30))
                
                Spacer()
                
                
            } else {
                
                List(completedTasks) { currentCompletedTask in
                    
                    // TaskInListView
                    TaskInListView(taskName: currentCompletedTask.taskName,
                                   savedDate: currentCompletedTask.savedDate)
                    .swipeActions(edge: .trailing,
                                  allowsFullSwipe: true) {
                        
                        Button("Incompleted") {
                            
                            let newIncompletedTask = AddedTask(taskName: currentCompletedTask.taskName, taskIsCompleted: false, savedDate: currentCompletedTask.savedDate)
                            
                            // Add to the list of teams
                            listOfTasks.append(newIncompletedTask)
                            
                            // Delete from completed tasks
                            completedTasks.remove(at: completedTasks.firstIndex(of: currentCompletedTask)!)
                            
                        }
                        .tint(.black)
                        .font(.custom("Helvetica Neue Light", size: 20))
                        
                        Button("Delete") {
                            
                            completedTasks.remove(at: completedTasks.firstIndex(of: currentCompletedTask)!)
                            
                        }
                        .tint(.red)
                        .font(.custom("Helvetica Neue Light", size: 20))
                        
                    }
                }
                .listStyle(.insetGrouped)
                .padding(.vertical)
                
            }
        }
    }
}

struct CompletedTaskView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        NavigationView {
            
            LiveContentView()
            
        }
    }
    struct LiveContentView: View {
        @State var tasksFinished: [AddedTask] = []
        
        var body: some View {
            
            CompletedTaskView(completedTasks: $tasksFinished,
                              listOfTasks: .constant(exampleAddedTasks),
                              dateOfToday: .constant(Date()))
            
        }
        
    }
    
}

