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
    @Binding var listOfTasks: [AddedTask]
    
    // Add completed tasks to another list
    @State var completedTasks: [AddedTask] = []
    
    
    // MARK: Computed Properties
    var body: some View {
        
        NavigationView {
            
            
            
            // CreateNewToDoView Tab
            VStack {
                
                Text("Today's Task")
                    .font(.custom("Avenir-Heavy", size: 40))
                
                    .padding()
                
                // Enter a task
                    TextField("Enter your task", text: self.$task)
                        .font(.custom("Avenir-Book", size: 20))
                        .textFieldStyle(.roundedBorder)
                        .frame(height: 30)
                        .padding()
                
                // Set the date
                DatePicker("Due", selection: $dateOfToday, displayedComponents: .date).datePickerStyle(GraphicalDatePickerStyle())
                
                Spacer()
            }
            .padding()
            .accentColor(.black)
            .toolbar {
                
                ToolbarItem(placement: .primaryAction) {
                    
                    Button("Done") {
                        
                        hideView()
                        
                        let newToDoList = AddedTask(taskName: task,
                                                    taskIsCompleted: false,
                                                    savedDate: dateOfToday)
                        
                        // Add to the list of teams
                        listOfTasks.append(newToDoList)
                        
                    }
                    .font(.custom("Avenir-Book", size: 20))
                    .disabled(task.isEmpty ? true : false)
                    .tint(.black)
                    
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
        
        CreateNewToDoView(showThisView: .constant(true),
                          listOfTasks: .constant(exampleAddedTasks))
        
    }
}
