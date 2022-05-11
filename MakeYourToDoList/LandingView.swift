//
//  LandingView.swift
//  MakeYourToDoList
//
//  Created by Eunbi Shin on 2022-05-09.
//

import SwiftUI

struct LandingView: View {
    // MARK: Stored Properties
    // Controls whether these views are showing or not
    @State var showNewToDoPage = false
    
    // MARK: Computed Properties
    var body: some View {
        
        ZStack {
            
            // List of previous To-Do lists
            List {
                Section() {
                    Text("May 9, 2022")
                    Text("May 7, 2022")
                    Text("May 1, 2022")
                }
                .font(.custom("Avenir-Book", size: 20))
            }
            .listStyle(.insetGrouped)
            
            // New To-Do list button
            Image(systemName: "plus.circle.fill")
                .foregroundColor(.black)
                .font(Font.system(size: 70))
                .offset(x: 140, y: 220)
                .onTapGesture {
                    showNewToDoPage = true
                }
                .sheet(isPresented: $showNewToDoPage) {
                    CreateNewToDoView(showThisView: $showNewToDoPage)
                }
            
            // Setting button
            Image(systemName: "gear.circle.fill")
                .foregroundColor(.black)
                .font(Font.system(size: 70))
                .offset(x: 140, y: 130)
                .onTapGesture {
                    print("Open setting page")
                }
            
        }
        

        .navigationTitle("To-Do")
    }
}

struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LandingView()
        }
    }
}
