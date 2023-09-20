//
//  WelcomeScreen.swift
//  LifePilot
//
//  Created by Hugo Valverde on 9/20/23.
//

import SwiftUI

struct WelcomeScreen: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Welcome to MyADHDApp")
                .font(.largeTitle)
            Text("A planner and mood tracker tailored for you.")
                .font(.body)
            NavigationLink(destination: MainDashboard()) {
                Text("Get Started")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
        }
    }
}

struct WelcomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreen()
    }
}
