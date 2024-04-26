import SwiftUI

struct CalendarDay: Identifiable, Equatable, Hashable {
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
    @State private var month = "March 2024"
    let weekdays = ["S", "M", "T", "W", "T", "F", "S"]
    @State private var selectedDay: UUID? = nil
    @State private var showingMonthSelector = false
    @State private var showingAddEvent = false
    @State private var schedule: [ScheduleItem] = [
        ScheduleItem(imageName: "Food", title: "Event 1", subtitle: "Location", date: "March 22 2024"),
        ScheduleItem(imageName: "Image", title: "Event 2", subtitle: "Location", date: "March 22 2024"),
        ScheduleItem(imageName: "VShow", title: "Event 3", subtitle: "Location", date: "March 22 2024")
    ]
    
    // Organize days into weeks
    let days: [[CalendarDay]] = {
        var weeks: [[CalendarDay]] = []
        let totalDays = 7 // Adjust as needed for each month
        var currentWeek: [CalendarDay] = []
        
        for day in 1...totalDays {
            currentWeek.append(CalendarDay(id: UUID(), day: day))
            if currentWeek.count == 7 || day == totalDays {
                weeks.append(currentWeek)
                currentWeek = []
            }
        }
        return weeks
    }()
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                ScrollView {
                    VStack(alignment: .leading) {
                        Text(month)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding(.horizontal)
                        
                        Divider()
                        
                        // Display days of the week header
                        HStack(spacing: 0) {
                            ForEach(weekdays, id: \.self) { weekday in
                                Text(weekday)
                                    .frame(minWidth: 0, maxWidth: .infinity)
                                    .font(.body)
                                    .foregroundColor(.primary)
                            }
                        }
                        .padding(.horizontal)
                        
                        // Weekly TabView
                        TabView {
                            ForEach(days, id: \.self) { week in
                                HStack(spacing: 0) {
                                    ForEach(week) { day in
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
                                    }
                                }
                                .padding()
                                .padding(.top,-50)

                            }
                        }
                        .tabViewStyle(PageTabViewStyle())
                        .frame(height: 100) // Adjust the height based on your UI
                        
                        Text("My Schedule")
                            .font(.headline)
                            .padding(.horizontal)
                            .padding(.top,-50)


                        // Displaying schedule items
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
                                   self.showingMonthSelector.toggle()  // Toggle visibility of the month selector
                               }) {
                                   Image(systemName: "calendar")
                                       .foregroundColor(.primary)
                               }, trailing: Button(action: {
                                   self.showingAddEvent = true  // Existing logic for showing the add event view
                               }) {
                                   Image(systemName: "plus")
                                       .foregroundColor(.primary)
                               })
                               .sheet(isPresented: $showingMonthSelector) {
                                   MonthSelectionView(selectedMonth: $month)
                               }
                .navigationBarTitle("Schedule", displayMode: .inline)
                .background(
                    Image("Background")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .edgesIgnoringSafeArea(.all)
                )
            }
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
                .frame(width: 350, height: 200)
                .background(Color.white.opacity(0.9))
                .cornerRadius(10)
                .shadow(radius: 2)
                
                Spacer(minLength: 50)
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

struct AddEventView: View {
    @Binding var isPresented: Bool
    @Binding var schedule: [ScheduleItem]
    
    @State private var imageName = ""
    @State private var title = ""
    @State private var subtitle = ""
    @State private var date = Date()
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Image Name", text: $imageName)
                TextField("Title", text: $title)
                TextField("Subtitle", text: $subtitle)
                DatePicker("Date", selection: $date, displayedComponents: .date)
            }
            .navigationBarTitle("Add New Event", displayMode: .inline)
            .navigationBarItems(leading: Button("Cancel") {
                isPresented = false
            }, trailing: Button("Save") {
                let newItem = ScheduleItem(imageName: imageName, title: title, subtitle: subtitle, date: DateFormatter.localizedString(from: date, dateStyle: .medium, timeStyle: .none))
                schedule.append(newItem)
                isPresented = false
            })
        }
    }
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView()
    }
}
