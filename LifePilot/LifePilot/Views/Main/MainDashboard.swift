//
//  MainDashboard.swift
//  LifePilot
//
//  Created by Hugo Valverde on 9/20/23.
//

import SwiftUI

struct MainDashboard: View {
    var body: some View {
        VStack {
            Text("Main Dashboard")
            Text("Today's Date")
            Text("Today's Mood Summary: Happy")
            Text("List of Tasks")
            NavigationLink(destination: PlannerView()) {
                Text("Go to Planner")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(10)
            }
            NavigationLink(destination: DailySummaryView()) {
                Text("Go to Daily Summary")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.purple)
                    .cornerRadius(10)
            }
        }
    }
}

struct MainDashboard_Previews: PreviewProvider {
    static var previews: some View {
        MainDashboard()
    }
}

