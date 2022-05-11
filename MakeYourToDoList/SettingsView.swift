//
//  SettingsView.swift
//  MakeYourToDoList
//
//  Created by Eunbi Shin on 2022-05-10.
//

import SwiftUI

struct SettingsView: View {
    // MARK: Stored Properties
    
    // Controls whether to show this view or not
    @Binding var showThisView: Bool
    
    // Controls the theme colour
    @State var themeColor = Color.blue
    
    // MARK: Computed Properties
    var body: some View {
        
        NavigationView {
        
            VStack {
                // Title
                Text("Settings")
                    .font(Font.custom("Avenir-Heavy", size: 40))
                    .padding()
                
                // Select the theme colour
                // Color picker
                ColorPicker("Theme Colour", selection: $themeColor, supportsOpacity: false)
                    .font(Font.custom("Avenir-Medium", size: 25))
                    .padding()
                
                // Text for test
                Text("Test")
                    .foregroundColor(themeColor)
                
                // Select the font
                Text("Fonts")
                    .font(Font.custom("Avenir-Medium", size: 25))
            }
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

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(showThisView: .constant(true))
    }
}
