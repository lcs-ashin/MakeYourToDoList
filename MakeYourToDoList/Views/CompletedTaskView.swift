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
    
    @Binding var listOfTasks: [AddedTask]
    
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
                    Text(currentCompletedTask.taskName)
                        .swipeActions(edge: .trailing,
                                      allowsFullSwipe: true) {
                            Button("Incompleted") {
                                let newIncompletedTask = AddedTask(taskName: currentCompletedTask.taskName, taskIsCompleted: false)
                                
                                // Add to the list of teams
                                listOfTasks.append(newIncompletedTask)
                                
                                // Delete from completed tasks
                                completedTasks.remove(at: completedTasks.firstIndex(of: currentCompletedTask)!)

                            }
                            .tint(.black)
                            
                            Button("Delete") {
                                completedTasks.remove(at: completedTasks.firstIndex(of: currentCompletedTask)!)
                            }
                            .tint(.red)
                        }
                }
                .font(.custom("Avenir-Book", size: 20))
                .listStyle(.insetGrouped)
            }
        }
    }
}

//struct CompletedTaskView_Previews: PreviewProvider {
//    static var previews: some View {
//        CompletedTaskView(capsuleColor: "capsule.portrait.fill", completedTasks: "")
//    }
//}
