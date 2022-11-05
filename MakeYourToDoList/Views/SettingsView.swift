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
    @State var themeColor: Color = Color.black
    
    // Available fonts
//    var fonts = ["Avenir-Book", "AppleSDGothicNeo-UltraLight", "DevanagariSangamMN", "Georgia", "GillSans-Light", "HelveticaNeue-Light", "Optima-Regular"]
//    @State var selectedFont = "Avenir-Book"
    
    // MARK: Computed Properties
    var body: some View {
        
        NavigationView {
        
            VStack {
                // Title
                Text("Settings")
                    .font(Font.custom("Helvetica Neue Medium", size: 40))
                    .padding()
                    .foregroundColor(themeColor)
                
                // Select the theme colour
                // Color picker
                HStack {
                    
                    Text("Theme Colour")
                        .font(Font.custom("Helvetica Neue Light", size: 25))
                    
                    ColorPicker("Choose your theme colour", selection: $themeColor, supportsOpacity: false)
                        .padding()
                        .scaleEffect(CGSize(width: 1.3, height: 1.3))
                        .labelsHidden()
                    
                }
                
                
                // Select the font
//                // Picker
//                Picker("Fonts", selection: $selectedFont) {
//                    ForEach(fonts, id: \.self) {
//                        Text($0)
//                    }
//                }
//                .font(Font.custom("Avenir-Medium", size: 25))
                
                // Text for test
//                Text("Test")
//                    .foregroundColor(themeColor)
//                    .font(.custom(selectedFont, size: 25))
                
                Spacer()
                
            }
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button("Done") {
                        hideView()
                    }
                    .foregroundColor(themeColor)
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
