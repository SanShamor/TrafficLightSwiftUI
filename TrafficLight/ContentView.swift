//
//  ContentView.swift
//  TrafficLight
//
//  Created by Александр on 14.06.2021.
//

import SwiftUI

enum CurrentLight {
    case red, yellow, green
}

struct ContentView: View {
    
    @State private var buttonTitle = "START"
    @State private var currentLight = CurrentLight.red
    
    private func nextColor() {
        switch currentLight {
        case .red: currentLight =  CurrentLight.yellow
        case .yellow: currentLight =  CurrentLight.green
        case .green: currentLight =  CurrentLight.red
        }
    }
}

extension ContentView {
    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            
            VStack{
                ColorCircle(color: .red, opacity: currentLight == .red ? 1 : 0.3)
                ColorCircle(color: .yellow, opacity: currentLight == .yellow ? 1 : 0.3)
                ColorCircle(color: .green, opacity: currentLight == .green ? 1 : 0.3)
                
                Spacer()
                
                ChangeColorButton(title: buttonTitle) {
                    if buttonTitle == "START" {
                        buttonTitle = "NEXT"
                    }
                    nextColor()
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
