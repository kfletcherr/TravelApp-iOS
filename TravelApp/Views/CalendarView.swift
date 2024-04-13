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
        ScheduleItem(imageName: "Food", title: "Event 1", subtitle: "Location", date: "March 22 2024"),
        ScheduleItem(imageName: "Image", title: "Event 2", subtitle: "Location", date: "March 22 2024"),
        ScheduleItem(imageName: "VShow", title: "Event 3", subtitle: "Location", date: "March 22 2024")
    ]
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) { // Use ZStack to layer the bottom rectangle
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
                                            selectedDay = day.id
                                        }) {
                                            Text("\(day.day)")
                                                .frame(minWidth: 0, maxWidth: .infinity)
                                                .padding()
                                                .background(day.id == selectedDay ? Color.red : Color.clear)
                                                .foregroundColor(day.id == selectedDay ? .white : .primary)
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
                        .padding(.bottom, 15)
                        
                        Text("My Schedule")
                            .font(.headline)
                            .padding(.horizontal)
                        
                        ForEach(schedule) { item in
                            NavigationLink(destination: ScheduleDetail(item: item)) {
                                HStack {
                                    Image(item.imageName)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 60, height: 60)
                                        .cornerRadius(8)
                                    
                                    VStack(alignment: .leading, spacing: 2) {
                                        Text(item.title)
                                            .font(.headline)
                                            .foregroundColor(.primary)
                                        Text(item.subtitle)
                                            .font(.subheadline)
                                            .foregroundColor(.secondary)
                                    }
                                    Spacer()
                                    VStack(alignment: .trailing) {
                                        Text(item.date)
                                            .font(.caption2)
                                            .foregroundColor(.black)
                                    }
                                }
                                .padding()
                                .background(Color.white.opacity(0.8))
                                .cornerRadius(8)
                                .shadow(radius: 2)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                        .padding(.horizontal)
                    }
                }
                .navigationBarItems(leading: Button(action: {
                    print("Settings tapped")
                }) {
                    Image(systemName: "gearshape")
                        .foregroundColor(.primary)
                }, trailing: Button(action: {
                    print("Edit tapped")
                }) {
                    Image(systemName: "plus")
                        .foregroundColor(.primary)
                })
                .navigationBarTitle("Schedule", displayMode: .inline)

                // Semi-transparent white rectangle at the bottom
            
            }
            .background(
                Image("Background")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
            )
        }
    }
}

struct ScheduleDetail: View {
    let item: ScheduleItem
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Image(item.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width * 0.9, height: 300)
                    .cornerRadius(10)
                    .shadow(radius: 4)
                
                // Encapsulated content inside a white background box
                VStack(spacing: 8) {
                    Text(item.title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    
                    Text(item.subtitle)
                        .font(.title2)
                        .foregroundColor(.secondary)
                    
                    Text(item.date)
                        .font(.headline)
                        .foregroundColor(.gray)
                }
                .padding()
                .frame(width: 350, height: 200) // Set specific width and height
                .background(Color.white.opacity(0.9))
                .cornerRadius(10)
                .shadow(radius: 2)
                
                Spacer(minLength: 50) // Ensures there is some spacing at the bottom if content is short
            }
            .padding(.horizontal)
            .padding(.top, 20)
        }
        .background(
            Image("Background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
        )
        .navigationBarTitle(Text("Details"), displayMode: .inline)
    }
}


struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView()
    }
}
