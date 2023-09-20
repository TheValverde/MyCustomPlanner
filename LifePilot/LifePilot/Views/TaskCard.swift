//
//  TaskCard.swift
//  LifePilot
//
//  Created by Hugo Valverde on 9/20/23.
//

import SwiftUI

struct TaskCard: View {
    var task: Task
    let totalMinutesInDay = 24 * 60
    let screenMaxHeight: CGFloat = 1440 // Assume each minute is represented by 1 point
    
    var body: some View {
        Rectangle()
            .fill(Color.blue)
            .frame(width: UIScreen.main.bounds.width * 0.9, height: CGFloat(task.durationInMinutes))
            .overlay(
                Text(task.name)
                    .foregroundColor(.white)
            )
    }
}
