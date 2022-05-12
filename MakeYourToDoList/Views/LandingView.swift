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
    
    // MARK: Computed Properties
    var body: some View {
        
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
                .offset(x: 140, y: 220)
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
                .offset(x: 140, y: 130)
                .onTapGesture {
                    showSettings = true
                }
                .sheet(isPresented: $showSettings) {
                    SettingsView(showThisView: $showSettings)
                }
            
        }
    }
}

struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LandingView(listOfTasks: .constant(exampleAddedTasks))
        }
    }
}
