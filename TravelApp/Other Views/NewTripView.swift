////
////  NewTripView.swift
////  TravelApp
////
////  Created by Kyle Fletcher on 4/22/24.
////
//import SwiftUI
//
//struct NewTripView: View {
//    @Binding var isPresented: Bool
//    @State private var title: String = ""
//    @State private var imageName: String = ""
//    @State private var detail: String = ""
//    @State private var selectedCategory: String = "Current Trips"
//    
//    let categories = ["Current Trips", "Previous Trips", "Future Trips"]
//    
//    var body: some View {
//        NavigationView {
//            Form {
//                Section(header: Text("Trip Details")) {
//                    TextField("Title", text: $title)
//                    TextField("Image Name", text: $imageName)
//                    TextField("Details", text: $detail)
//                    Picker("Category", selection: $selectedCategory) {
//                        ForEach(categories, id: \.self) {
//                            Text($0)
//                        }
//                    }
//                }
//                
//                Button("Save Trip") {
//                    // Logic to save the new trip based on `selectedCategory`
//                    // Append new trip data to the corresponding category list
//                    dismiss()
//                }
//            }
//            .navigationBarTitle("New Trip", displayMode: .inline)
//            .navigationBarItems(leading: Button("Cancel") {
//                dismiss()
//            })
//        }
//    }
//    
//    func dismiss() {
//        isPresented = false
//    }
//}
//
