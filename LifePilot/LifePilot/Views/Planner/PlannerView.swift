//
//  PlannerView.swift
//  LifePilot
//
//  Created by Hugo Valverde on 9/20/23.
//

import SwiftUI

struct PlannerView: View {
    @State private var selectedDate = Date()
    @State private var showCalendar = false
    @State private var tasks: [Task] = []
    @State private var showingTaskCreationView = false
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Button(action: {
                        selectedDate = Calendar.current.date(byAdding: .day, value: -1, to: selectedDate) ?? selectedDate
                    }) {
                        Image(systemName: "arrow.left")
                    }
                    Button(action: {
                        showCalendar.toggle()
                    }) {
                        Image(systemName: "calendar")
                    }
                    Button(action: {
                        selectedDate = Calendar.current.date(byAdding: .day, value: 1, to: selectedDate) ?? selectedDate
                    }) {
                        Image(systemName: "arrow.right")
                    }
                    Spacer()
                    
                    
                    Button(action: {
                        showingTaskCreationView.toggle()
                    }) {
                        Image(systemName: "plus")
                    }
                }
                .padding()
                
                ScrollView {
                    TimeBackgroundView()
                    
                    ZStack(alignment: .topLeading) {
                        ForEach(tasks) { task in
                            if isSameDay(task.date, selectedDate) {
                                TaskCard(task: task)
                                    .offset(y: CGFloat(task.startingMinuteOfDay))
                            }
                        }
                    }
                }
            }
            .sheet(isPresented: $showingTaskCreationView) {
                TaskCreationView(tasks: $tasks, selectedDate: selectedDate)
            }
            
            if showCalendar {
                VStack {
                    DatePicker("", selection: $selectedDate, displayedComponents: .date)
                        .datePickerStyle(GraphicalDatePickerStyle())
                    Button("Done") {
                        showCalendar = false
                    }
                }
                .background(Color.white)
                .cornerRadius(15)
                .padding()
                .shadow(radius: 10)
            }
        }
    }
    
    private func isSameDay(_ date1: Date, _ date2: Date) -> Bool {
        let calendar = Calendar.current
        return calendar.isDate(date1, equalTo: date2, toGranularity: .day)
    }
}



struct PlannerView_Previews: PreviewProvider {
    static var previews: some View {
        PlannerView()
    }
}
