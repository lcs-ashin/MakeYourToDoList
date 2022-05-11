//
//  CompletedTaskView.swift
//  MakeYourToDoList
//
//  Created by Eunbi Shin on 2022-05-10.
//

import SwiftUI

struct CompletedTaskView: View {
    // MARK: Stored Properties
    // Controls the opacity of the capsule
    @State var capsuleColor: String
    
    // MARK: Computed Properties
    var body: some View {
        
        VStack {
            // Title
            Text("Completed Tasks")
                .font(Font.custom("Avenir-Heavy", size: 40))
            
            // List of completed tasks
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
            .padding()
            
        }
    }
}

struct CompletedTaskView_Previews: PreviewProvider {
    static var previews: some View {
        CompletedTaskView(capsuleColor: "capsule.portrait.fill")
    }
}
