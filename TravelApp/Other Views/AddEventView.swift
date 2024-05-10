//
//  AddEventView.swift
//  TravelApp
//
//  Created by Kyle Fletcher on 4/22/24.
//

//struct AddEventView: View {
//    @Binding var selectedDay: CalendarDay?
//    @Binding var events: [ScheduleItem]
//    @Environment(\.dismiss) var dismiss
//
//    @State private var title: String = ""
//    @State private var subtitle: String = ""
//    @State private var imageName: String = ""
//
//    var body: some View {
//        NavigationView {
//            Form {
//                TextField("Title", text: $title)
//                TextField("Subtitle", text: $subtitle)
//                TextField("Image Name", text: $imageName)
//            }
//            .navigationBarItems(trailing: Button("Save") {
//                let newEvent = ScheduleItem(imageName: imageName, title: title, subtitle: subtitle, date: selectedDay!.id)
//                events.append(newEvent)
//                dismiss()
//            })
//        }
//    }
//}
