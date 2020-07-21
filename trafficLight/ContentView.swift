//
//  ContentView.swift
//  trafficLight
//
//  Created by Anton on 21.07.2020.
//  Copyright © 2020 Anton. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var buttonText = "START"
    @State private var currentLight = Lights.none
    
    private let lightOff: CGFloat = 0.3
    private let lightOn: CGFloat = 1
    
    var body: some View {
        ZStack {
            Color(.black)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                CircleColor(color: UIColor.red
                    .withAlphaComponent(currentLight == .red ? lightOn : lightOff))
                CircleColor(color: UIColor.yellow
                    .withAlphaComponent(currentLight == .yellow ? lightOn : lightOff))
                CircleColor(color: UIColor.green
                    .withAlphaComponent(currentLight == .green ? lightOn : lightOff))
                
                Spacer()
                
                Button(action: {self.buttonAction()}) {
                        Text(buttonText)
                        .font(.title)
                        .foregroundColor(.white)
                }
                .frame(width: 120, height: 40)
                .background(/*@START_MENU_TOKEN@*/Color.blue/*@END_MENU_TOKEN@*/)
                .clipShape(Capsule())
                .overlay(Capsule().stroke(Color.gray, lineWidth: 3))
            }
            .padding()
        }
    }
}

extension ContentView {
    private enum Lights {
        case red, yellow, green, none
    }
    
    private func buttonAction() {
        buttonText = "NEXT"
        
        switch currentLight {
        case .red:
            currentLight = .yellow
        case .yellow:
            currentLight = .green
        case .green:
            currentLight = .red
        case .none:
            currentLight = .red
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
