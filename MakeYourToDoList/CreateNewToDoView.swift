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
    
    // Controls the opacity of the capsule
    @State var capsuleColor = "capsule.portrait"
    
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
                        TextField("Enter your task", text: $task)
                            .textFieldStyle(.roundedBorder)
                            .frame(height: 30)
                        
                        Image(systemName: "plus")
                            .font(.system(size: 25))
                            .foregroundColor(.black)
                            .onTapGesture {
                                print("Add the task")
                            }
                    }
                    .padding()
                    
                    
                    // List of added tasks
                    List {
                        Section() {
                            
                            HStack {
                                
                                // Check box
                                Image(systemName: capsuleColor)
                                    .foregroundColor(.black)
                                    .onTapGesture {
                                        capsuleColor = "capsule.portrait.fill"
                                    }
                                
                                // Task
                                Text("Calculus review")
                                
                                Spacer()
                                
                                // Set a due date
                                Image(systemName: "calendar")
                                    .foregroundColor(.black)
                                    .font(.system(size: 25))
                                
                            }
                        }
                        .font(.custom("Avenir-Book", size: 20))
                    }
                    .listStyle(.insetGrouped)
                    
                    Spacer()
                    
                }
                .padding()
                .tabItem {
                    Image(systemName: "list.bullet")
                }
                
                // CompletedTaskView Tab
                CompletedTaskView(capsuleColor: "capsule.portrait.fill")
                    .tabItem {
                        Image(systemName: "checkmark.square")
                    }
            }
            .accentColor(.black)
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button("Done") {
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
    
}

struct CreateNewToDoView_Previews: PreviewProvider {
    static var previews: some View {
        CreateNewToDoView(showThisView: .constant(true))
    }
}
