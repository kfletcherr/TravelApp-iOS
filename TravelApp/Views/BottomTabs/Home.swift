//
//  Home.swift
//  TravelApp
//
//  Created by Kyle Fletcher on 3/27/24.
//


import SwiftUI

// MARK: - Data Model
struct Trip: Identifiable {
    var id = UUID()
    var title: String
    var imageName: String // Ensure these images are in your asset catalog
    var detail: String
}

// MARK: - Trip Detail View
struct TripDetailView: View {
    var trip: Trip
    
    @State private var rating: Double = 5 // State variable to hold the current rating
    @State private var favoriteMemories: String = "" // Editable text for favorite memories
    @State private var leastFavorite: String = "" // Editable text for least favorite aspects

    var body: some View {
        ScrollView {
            VStack {
                Image(trip.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 300)
                    .clipped()
                
                detailSection(title: "     Favorite Memories", content: $favoriteMemories)
                detailSection(title: "     Notes", content: $leastFavorite)
                ratingSection
                imageAdditionSection
            }
        }
        .background(Image("Background")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all))
        .navigationBarTitle(trip.title, displayMode: .inline)
        .onAppear {
            // Initialize editable fields with default or existing values
            favoriteMemories = trip.detail // Assume initial details can be favorite memories
            leastFavorite = "" // Start with an empty string or fetch existing data if applicable
        }
    }
    
    // MARK: - Detail Section for Memories and Least Favorite
    private func detailSection(title: String, content: Binding<String>) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.headline)
                .foregroundColor(.black)
            TextEditor(text: content)
                .foregroundColor(.black)
                .padding()
                .frame(height: 200)
                .frame(width: 350)
                .background(Color.white.opacity(0.9))
                .cornerRadius(10)
                .padding(.horizontal)
        }
        .padding()
    }
    
    // MARK: - Rating Section
    private var ratingSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Rating")
                .font(.headline)
                .foregroundColor(.black)
            Slider(value: $rating, in: 1...10, step: 1)
                .accentColor(.blue)
            Text("Current Rating: \(Int(rating))/10")
                .foregroundColor(.black)
        }
        .padding()
        .frame(maxWidth: 350) // This ensures the frame stretches horizontally
        .background(Color.white.opacity(0.9))
        .cornerRadius(10)
        .padding(.horizontal)
    }
    
    // MARK: - Image Addition Section
    private var imageAdditionSection: some View {
        Button(action: {
            // Placeholder action for adding images
        }) {
            Text("Add Images")
                .foregroundColor(.blue)
                .padding()
                .background(Color.white.opacity(0.9))
                .cornerRadius(10)
                .padding(.horizontal)
        }
    }
}


struct Home: View {
    @State private var search: String = ""
    
    // Sample Trips
    private let currentTrips = [
//        Trip(title: "Fort Lauderdale", imageName: "florida", detail: "Add Florida Memories Here"),
        Trip(title: "Cruise", imageName: "cruise", detail: "Add Cruise Memories Here")
    ]
    
    private let previousTrips = [
        Trip(title: "Mexico", imageName: "mexico", detail: "Add Mexico Memories Here"),
        Trip(title: "Disney", imageName: "disney", detail: "Add Disney Memories Here"),
        Trip(title: "New York City", imageName: "newyork", detail: "Add New York Memories Here")
    ]
    
    private let futureTrips = [
        Trip(title: "Paris", imageName: "paris", detail: "Add Paris Memories Here"),
        Trip(title: "Fort Lauderdale", imageName: "florida", detail: "Add Florida Memories Here"),
        Trip(title: "Las Vegas", imageName: "vegas", detail: "Add Vegas Memories Here")
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    tripSection(title: "Current Trips", trips: currentTrips)
                    tripSection(title: "Previous Trips", trips: previousTrips)
                    tripSection(title: "Future Trips", trips: futureTrips)
                }
                .padding(.horizontal)
                // Add additional top padding here to move the content down
                .padding(.top, 30) // Increase this value to move the sections further down
            }
            .navigationBarItems(leading: settingsButton, trailing: editButton)
            .navigationBarTitle("Home", displayMode: .inline)
            .background(Image("Background").resizable().aspectRatio(contentMode: .fill).edgesIgnoringSafeArea(.all))
        }
    }
    
    private var settingsButton: some View {
        Button(action: {
            print("Settings tapped")
        }) {
            Image(systemName: "gearshape").foregroundColor(.primary)
        }
    }
    
    private var editButton: some View {
        Button(action: {
            print("Edit tapped")
        }) {
            Image(systemName: "plus").foregroundColor(.primary)
        }
    }
    
    private func tripSection(title: String, trips: [Trip]) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.headline)
                .foregroundColor(.primary)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(trips) { trip in
                        NavigationLink(destination: TripDetailView(trip: trip)) {
                            Image(trip.imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 140, height: 100)
                                .clipped()
                                .cornerRadius(8)
                                .border(Color.black, width: 2)
                        }
                    }
                }
            }
        }
        .padding()
        .background(Color.white.opacity(0.8))
        .cornerRadius(10)
    }
}

// MARK: - Preview
struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
