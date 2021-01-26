//
//  ContentView.swift
//  TestingMaterialOverlay
//
//  Created by harry scheuerle on 1/25/21.
//

import SwiftUI

struct VisualEffectView: UIViewRepresentable {
    
    var effect: UIVisualEffect?
    func makeUIView(context: Context) -> UIVisualEffectView {
        UIVisualEffectView()
    }
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = effect;
    }
}

struct ContentView: View {
    let adaptableStyles: [(text: String, value: UIBlurEffect.Style)] = [
        (text: "systemMaterial", value: .systemMaterial),
        (text: "systemThinMaterial", value: .systemThinMaterial),
        (text: "systemMaterial", value: .systemMaterial),
        (text: "systemThickMaterial", value: .systemThickMaterial),
        (text: "systemChromeMaterial", value: .systemChromeMaterial),
    ]
    
    let lightStyles: [(text: String, value: UIBlurEffect.Style)] = [
        (text: "systemMaterialLight", value: .systemMaterialLight),
        (text: "systemThinMaterialLight", value: .systemThinMaterialLight),
        (text: "systemMaterialLight", value: .systemMaterialLight),
        (text: "systemThickMaterialLight", value: .systemThickMaterialLight),
        (text: "systemChromeMaterialLight", value: .systemChromeMaterialLight),
    ]
    
    let darkStyles: [(text: String, value: UIBlurEffect.Style)] = [
        (text: "systemMaterialDark", value: .systemMaterialDark),
        (text: "systemThinMaterialDark", value: .systemThinMaterialDark),
        (text: "systemMaterialDark", value: .systemMaterialDark),
        (text: "systemThickMaterialDark", value: .systemThickMaterialDark),
        (text: "systemChromeMaterialDark", value: .systemChromeMaterialDark),
    ]
    
    let additionalStyles: [(text: String, value: UIBlurEffect.Style)] = [
        (text: "extraLight", value: .extraLight),
        (text: "light", value: .light),
        (text: "dark", value: .dark),
        // (text: "extraDark", value: .extraDark), unavailable in ios
        (text: "regular", value: .regular),
        (text: "prominent", value: .prominent),
    ]
        
    @State var selectedStyle = 0
    
    var allStyles: [(text: String, value: UIBlurEffect.Style)] {
        return adaptableStyles + lightStyles + darkStyles + additionalStyles
    }
    
    var currentStyleValue: UIBlurEffect.Style {
        allStyles[selectedStyle].value
    }
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            Image("Trees")
                .resizable()
                // .blur(radius: 20.0, opaque: false)
                        
            VisualEffectView(effect: UIBlurEffect(style: currentStyleValue))
                // doesn't really look right without this. figure out clipping correctly
                .edgesIgnoringSafeArea(.all)
            
            Picker(selection: $selectedStyle, label: Text("Adaptable Styles")) {
                ForEach(0 ..< allStyles.count) {
                    Text(self.allStyles[$0].text)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
