//
//  CalendarView.swift
//  TravelApp
//
//  Created by Kyle Fletcher on 4/3/24.
//

import SwiftUI

struct CalendarDay: Identifiable {
    let id = UUID()
    let day: Int
    let isSelected: Bool
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
    
    // Assuming you have a more complete array of days for demonstration
    let days: [CalendarDay] = [
        CalendarDay(day: 1, isSelected: false),
        CalendarDay(day: 2, isSelected: false),
        CalendarDay(day: 3, isSelected: false),
        CalendarDay(day: 4, isSelected: false),
        CalendarDay(day: 5, isSelected: false),
        CalendarDay(day: 6, isSelected: false),
        CalendarDay(day: 7, isSelected: false),
      
    ]
    
    let schedule: [ScheduleItem] = [
        ScheduleItem(imageName: "Food", title: "Lunch Reservation", subtitle: "Wynn Buffet", date: "March 22 2024"),
        ScheduleItem(imageName: "Image", title: "Casino", subtitle: "Las Vegas, Nevada", date: "March 22 2024"),
        ScheduleItem(imageName: "VShow", title: "Show", subtitle: "Las Vegas, Nevada", date: "March 22 2024")
    ]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text(month)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                
                Divider()
                
                // Days of the Week
                HStack(spacing: 0) {
                    ForEach(weekdays, id: \.self) { weekday in
                        Text(weekday)
                            .font(.headline)
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .font(.caption)
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
                                Text("\(day.day)")
                                    .frame(minWidth: 0, maxWidth: .infinity)
                                    .padding()
                                    .background(day.isSelected ? Color.blue : Color.clear)
                                    .foregroundColor(day.isSelected ? .white : .black)
                                    .font(.headline)
                                    .clipShape(Circle())
                                    .overlay(
                                        Circle()
                                            .stroke(day.isSelected ? Color.blue : Color.clear, lineWidth: 2)
                                    )
                                    .shadow(radius: day.isSelected ? 3 : 0)
                            } else {
                                Text("")
                                    .frame(minWidth: 0, maxWidth: .infinity)
                                    .padding()
                            }
                        }
                    }
                }
                .padding(.horizontal)
                
                Text("My Schedule")
                    .font(.headline)
                    .padding(.horizontal)
                
                ForEach(schedule) { item in
                    HStack {
                        Image(item.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 60, height: 60) // Slightly larger for visibility
                            .cornerRadius(8)
                        
                        VStack(alignment: .leading, spacing: 2) { // Added spacing for clarity
                            Text(item.title)
                                .font(.headline)
                            Text(item.subtitle)
                                .font(.subheadline)
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
                .foregroundColor(.black)
        }, trailing: Button(action: {
            print("Edit tapped")
        }) {
            Image(systemName: "bell")
                .foregroundColor(.black)
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
