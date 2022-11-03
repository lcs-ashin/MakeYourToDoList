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
                .font(Font.custom("Avenir-Heavy", size: 40))
                .padding(.vertical, 30)
            
            
            // List of completed tasks
            if completedTasks.isEmpty {
                
                Spacer()
                
                Text("Complete your tasks")
                    .foregroundColor(.secondary)
                    .font(.custom("Avenir-Book", size: 30))
                
                Spacer()
                
                
            } else {
                
                List(completedTasks) { currentCompletedTask in
                    
                    HStack {
                        
                        Text(currentCompletedTask.taskName)
                            .font(.custom("Avenir-Book", size: 20))
                        
                        Spacer()
                        
                        Text(currentCompletedTask.savedDate.formatted(date: .abbreviated, time: .omitted))
                            .font(.custom("Avenir-Book", size: 17))
                        
                    }
                    
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
                        .font(.custom("Avenir-Book", size: 20))
                        
                        Button("Delete") {
                            
                            completedTasks.remove(at: completedTasks.firstIndex(of: currentCompletedTask)!)
                            
                        }
                        .tint(.red)
                        .font(.custom("Avenir-Book", size: 20))
                        
                    }
                }
                .listStyle(.insetGrouped)
            }
        }
    }
}

struct CompletedTaskView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        CompletedTaskView(completedTasks: .constant(exampleAddedTasks),
                          listOfTasks: .constant(exampleAddedTasks),
                          dateOfToday: .constant(Date()))
        
    }
}
