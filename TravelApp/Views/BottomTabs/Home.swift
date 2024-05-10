//
//  Home.swift
//  TravelApp
//
//  Created by Kyle Fletcher on 3/27/24.
//


import SwiftUI
import Firebase
import FirebaseStorage


// MARK: - Data Model
struct Trip: Identifiable {
    var id = UUID()
    var title: String
    var imageName: String
    var detail: String
}

// MARK: - New Trip View
struct NewTripView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var tripStore: TripStore
    @State private var title: String = ""
    @State private var imageName: String = ""
    @State private var detail: String = ""
    @State private var selectedCategory: String = "Current Trips"
    
    let categories = ["Current Trips", "Previous Trips", "Future Trips"]
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Trip Details")) {
                    TextField("Title", text: $title)
                        .autocapitalization(.words)
                    TextField("Image Name", text: $imageName)
                    TextField("Details", text: $detail)
                    Picker("Category", selection: $selectedCategory) {
                        ForEach(categories, id: \.self) {
                            Text($0)
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Button("Save Trip") {
                    // Constructing the new trip from input fields
                    let newTrip = Trip(title: title, imageName: imageName, detail: detail)
                    // Adding the trip to the appropriate category
                    tripStore.addTrip(trip: newTrip, to: selectedCategory)
                    // Dismiss the view after saving the trip
                    presentationMode.wrappedValue.dismiss()
                }
                .disabled(title.isEmpty || imageName.isEmpty || detail.isEmpty)
            }
            .navigationBarTitle("New Trip", displayMode: .inline)
            .navigationBarItems(leading: Button("Cancel") {
                // Action to dismiss the view without saving
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

// MARK: - Home View
struct Home: View {
    @StateObject var tripStore = TripStore()
    @State private var showingNewTripView = false
    @State private var showingSettingsView = false // For managing trips
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    tripSection(title: "Current Trips", trips: $tripStore.currentTrips)
                    tripSection(title: "Previous Trips", trips: $tripStore.previousTrips)
                    tripSection(title: "Future Trips", trips: $tripStore.futureTrips)
                }
                .padding(.horizontal)
                .padding(.top, 30)
            }
            .navigationBarItems(leading: settingsButton, trailing: editButton)
            .navigationBarTitle("Home", displayMode: .inline)
            .background(Image("Background").resizable().aspectRatio(contentMode: .fill).edgesIgnoringSafeArea(.all))
            .sheet(isPresented: $showingNewTripView) {
                NewTripView(tripStore: tripStore)
            }
            .sheet(isPresented: $showingSettingsView) {
                SettingsView(tripStore: tripStore)
            }
        }
    }
    
    private var settingsButton: some View {
        Button(action: {
            showingSettingsView = true
        }) {
            Image(systemName: "slider.horizontal.3").foregroundColor(.primary)
        }
    }
    
    private var editButton: some View {
        Button(action: {
            showingNewTripView = true
        }) {
            Image(systemName: "plus").foregroundColor(.primary)
        }
    }
}

private func tripSection(title: String, trips: Binding<[Trip]>) -> some View {
    VStack(alignment: .leading, spacing: 10) {
        Text(title)
            .font(.headline)
            .foregroundColor(.primary)
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(trips.wrappedValue) { trip in
                    NavigationLink(destination: TripDetailView(trip: trip)) {
                        Image(trip.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 140, height: 100)
                            .clipped()
                            .cornerRadius(8)
                            .border(Color.black, width: 3)
                    }
                }
            }
        }
    }
    .padding()
    .background(Color.white.opacity(0.8))
    .cornerRadius(10)
}





// MARK: - Preview
struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
