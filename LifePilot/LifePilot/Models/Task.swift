//
//  Task.swift
//  LifePilot
//
//  Created by Hugo Valverde on 9/20/23.
//

import Foundation

struct Task: Identifiable {
    var id = UUID()
    var name: String
    var description: String
    var date: Date
    var time: Date
    var duration: TimeInterval // in seconds
}
