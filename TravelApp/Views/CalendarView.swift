//
//  CalendarView.swift
//  TravelApp
//
//  Created by Kyle Fletcher on 4/3/24.
//

import SwiftUI

struct CalendarDay: Identifiable, Equatable {
    let id: UUID
    let day: Int
    // Removed isSelected from here as it will be managed via selectedDay
}

struct ScheduleItem: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let subtitle: String
    let date: String
}

struct ScheduleView: View {
    let month = "March 2024"
    let weekdays = ["S", "M", "T", "W", "T", "F", "S"]
    
    @State private var selectedDay: UUID? = nil
    
    let days: [CalendarDay] = [
        CalendarDay(id: UUID(), day: 1),
        CalendarDay(id: UUID(), day: 2),
        CalendarDay(id: UUID(), day: 3),
        CalendarDay(id: UUID(), day: 4),
        CalendarDay(id: UUID(), day: 5),
        CalendarDay(id: UUID(), day: 6),
        CalendarDay(id: UUID(), day: 7),
    ]
    
    let schedule: [ScheduleItem] = [
        ScheduleItem(imageName: "Food", title: "Lunch Reservation", subtitle: "Wynn Buffet", date: "March 22 2024"),
        ScheduleItem(imageName: "Image", title: "Casino", subtitle: "Caesers Hotel", date: "March 22 2024"),
        ScheduleItem(imageName: "VShow", title: "Show", subtitle: "Las Vegas, Nevada", date: "March 22 2024")
    ]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text(month)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                    .padding(.top,10)

                
                Divider()
                
                // Days of the Week
                HStack(spacing: 0) {
                    ForEach(weekdays, id: \.self) { weekday in
                        Text(weekday)
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .font(.body)
                            .foregroundColor(.primary) // Adapt to light and dark mode
                    }
                }
                .padding(.horizontal)
                
                // Calendar Days
                let totalDays = days.count
                let rows = (totalDays / weekdays.count) + (totalDays % weekdays.count > 0 ? 1 : 0)
                
                ForEach(0..<rows, id: \.self) { row in
                    HStack(spacing: 0) {
                        ForEach(0..<weekdays.count) { column in
                            if (row * weekdays.count + column) < totalDays {
                                let day = days[row * weekdays.count + column]
                                Button(action: {
                                    // Update the selected day
                                    selectedDay = day.id
                                }) {
                                    Text("\(day.day)")
                                        .frame(minWidth: 0, maxWidth: .infinity)
                                        .padding()
                                        .background(day.id == selectedDay ? Color.blue : Color.clear)
                                        .foregroundColor(day.id == selectedDay ? .white : .primary) // Adjusts for dark mode
                                        .font(.headline)
                                        .clipShape(Circle())
                                }
                            } else {
                                Text("")
                                    .frame(minWidth: 0, maxWidth: .infinity)
                                    .padding()
                            }
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.bottom,15)
                
                Text("My Schedule")
                    .font(.headline)
                    .padding(.horizontal)
                
                ForEach(schedule) { item in
                    HStack {
                        Image(item.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 60, height: 60)
                            .cornerRadius(8)
                        
                        VStack(alignment: .leading, spacing: 2) {
                            Text(item.title)
                                .font(.headline)
                                .foregroundColor(.primary) // Adapt to light and dark mode
                            Text(item.subtitle)
                                .font(.subheadline)
                                .foregroundColor(.secondary) // Adapt to light and dark mode
                        }
                        Spacer()
                        VStack(alignment: .trailing) {
                            Text(item.date)
                                .font(.caption2)
                                .foregroundColor(.gray)
                        }
                    }
                    .padding()
                }
            }
        }
        .navigationBarItems(leading: Button(action: {
            print("Settings tapped")
        }) {
            Image(systemName: "gearshape")
                .foregroundColor(.primary) // Adapt to light and dark mode
        }, trailing: Button(action: {
            print("Edit tapped")
        }) {
            Image(systemName: "bell")
                .foregroundColor(.primary) // Adapt to light and dark mode
        })
        .navigationBarTitle("Schedule", displayMode: .inline)
    }
}
struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ScheduleView()
        }
    }
}
