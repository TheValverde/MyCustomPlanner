//
//  Task.swift
//  LifePilot
//
//  Created by Hugo Valverde on 9/20/23.
//

import Foundation

enum TaskType: String, CaseIterable {
    case general, alarm, reminder
}

struct Task: Identifiable {
    var id = UUID()
    var name: String
    var description: String
    var date: Date
    var time: Date
    var duration: TimeInterval // in seconds
    var type: TaskType
    
    var startingOffset: Int {
        let calendar = Calendar.current
        let startOfDay = calendar.startOfDay(for: date)
        let components = calendar.dateComponents([.second], from: startOfDay, to: time)
        let totalSeconds = components.second ?? 0
        return totalSeconds / 240  // 240 seconds = 4 minutes, to align with the 15-minute intervals
    }
    var startingMinuteOfDay: Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.hour, .minute], from: time)
        return (components.hour ?? 0) * 60 + (components.minute ?? 0)
    }

    var durationInMinutes: Int {
        return Int(duration / 60)
    }
}

