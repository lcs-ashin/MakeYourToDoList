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
    @Binding var themeColor: Color //= Color.black
    
    // Available fonts
    var fonts = ["Avenir", "Helvetica Neue", "SF Compact"]
    
    @Binding var selectedFont: String
    
    // MARK: Computed Properties
    var body: some View {
        
        NavigationView {
        
            VStack {
                // Title
                Text("Settings")
                    .font(Font.custom("\(selectedFont) Medium", size: 40))
                    .padding()
                    .foregroundColor(themeColor)
                
                // Select the theme colour
                // Color picker
                HStack {
                    
                    Text("Theme Colour")
                        .font(Font.custom("\(selectedFont) Light", size: 25))
                    
                    Spacer()
                    
                    ColorPicker("Choose your theme colour", selection: $themeColor, supportsOpacity: false)
                        .padding()
                        .scaleEffect(CGSize(width: 1.3, height: 1.3))
                        .labelsHidden()
                    
                }
                .padding()
                
                // Select the font
                HStack {
                    
                    Text("Font")
                        .font(Font.custom("\(selectedFont) Light", size: 25))
                    
                    Spacer()
                    
                }
                .padding()
                
                // Picker
                Picker("Fonts", selection: $selectedFont) {
                    ForEach(fonts, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal)
                
                Spacer()
                
            }
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button("Done") {
                        hideView()
                    }
                    .foregroundColor(themeColor)
                    .font(Font.custom("\(selectedFont) Light", size: 20))
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
        SettingsView(showThisView: .constant(true), themeColor: .constant(Color("")), selectedFont: .constant(""))
    }
}
