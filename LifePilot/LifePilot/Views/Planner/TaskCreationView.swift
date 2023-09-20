//
//  TaskCreationView.swift
//  LifePilot
//
//  Created by Hugo Valverde on 9/20/23.
//

import SwiftUI

struct TaskCreationView: View {
    @Binding var tasks: [Task]
    var selectedDate: Date
    @State private var taskName: String = ""
    @State private var taskDescription: String = ""
    @State private var taskTime = Date()
    @State private var taskDuration = TimeInterval(3600) // Default to 1 hour
    @State private var selectedTaskType = TaskType.general

    var body: some View {
        VStack {
            TextField("Task Name", text: $taskName)
                .padding()
            TextField("Description", text: $taskDescription)
                .padding()
            DatePicker("Time", selection: $taskTime, displayedComponents: .hourAndMinute)
                .datePickerStyle(GraphicalDatePickerStyle())
            Picker("Task Type", selection: $selectedTaskType) {
                ForEach(TaskType.allCases, id: \.self) { taskType in
                    Text(taskType.rawValue.capitalized).tag(taskType)
                }
            }
            Picker("Duration", selection: $taskDuration) {
                Text("1 minute").tag(TimeInterval(60))
                Text("5 minutes").tag(TimeInterval(300))
                Text("10 minutes").tag(TimeInterval(600))
                Text("15 minutes").tag(TimeInterval(900))
                Text("30 minutes").tag(TimeInterval(1800))
                Text("1 hour").tag(TimeInterval(3600))
                Text("2 hours").tag(TimeInterval(7200))
            }
            .disabled(selectedTaskType != .general) // Disable if the selected type is not "general"
            
            Button("Save Task") {
                if taskName.isEmpty || taskDescription.isEmpty {
                    print("All fields are required.")
                } else {
                    let newTask = Task(name: taskName, description: taskDescription, date: selectedDate, time: taskTime, duration: taskDuration, type: selectedTaskType)
                    tasks.append(newTask)
                }
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
        }
    }
}

