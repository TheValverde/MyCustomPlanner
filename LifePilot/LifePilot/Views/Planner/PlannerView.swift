//
//  PlannerView.swift
//  LifePilot
//
//  Created by Hugo Valverde on 9/20/23.
//

import SwiftUI

struct PlannerView: View {
    @State private var selectedDate = Date()
    @State private var tasks = [Task]()

    var body: some View {
        VStack {
            DatePicker("Select a Date", selection: $selectedDate, displayedComponents: .date)
                .datePickerStyle(GraphicalDatePickerStyle())
            List {
                ForEach(tasks.filter { isSameDay($0.date, selectedDate) }
                            .sorted(by: { $0.time < $1.time })) { task in
                    HStack {
                        Text(task.name)
                        Spacer()
                        Text(timeString(from: task.time))
                    }
                }
            }
            NavigationLink(destination: TaskCreationView(tasks: $tasks, selectedDate: selectedDate)) {
                Text("Add Task")
            }
        }
    }
    
    private func isSameDay(_ date1: Date, _ date2: Date) -> Bool {
        let calendar = Calendar.current
        return calendar.isDate(date1, equalTo: date2, toGranularity: .day)
    }

    private func timeString(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}

struct PlannerView_Previews: PreviewProvider {
    static var previews: some View {
        PlannerView()
    }
}

