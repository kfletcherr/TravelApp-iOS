//
//  Home.swift
//  TravelApp
//
//  Created by Kyle Fletcher on 3/27/24.
//


import SwiftUI

// Data model for a trip, with a title and a list of image names
struct Trip: Identifiable {
    var id = UUID()
    var title: String
    var imageNames: [String]
}

// SwiftUI View for a single image in the trip
struct TripImageView: View {
    var imageName: String
    
    var body: some View {
        Image(imageName) // Use the actual image name from assets or fetched from a URL
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 100)
            .cornerRadius(8)
    }
}

// SwiftUI View for the home screen
struct Home: View {
    // Example trips, replace with your own data source or fetching mechanism
    @State private var previousTrips = [
        Trip(title: "Previous Trips", imageNames: ["disneyland", "madrid"])
    ]
    
    @State private var futureTrips = [
        Trip(title: "Future Trips", imageNames: ["cruise", "paris"])
    ]
    
    @State private var currentTrip = [
        Trip(title: "Current Trip", imageNames: ["las_vegas"])
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(previousTrips) { trip in
                    Section(header: Text(trip.title)) {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(trip.imageNames, id: \.self) { imageName in
                                    TripImageView(imageName: imageName)
                                }
                            }
                        }
                    }
                }
                
                ForEach(futureTrips) { trip in
                    Section(header: Text(trip.title)) {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(trip.imageNames, id: \.self) { imageName in
                                    TripImageView(imageName: imageName)
                                }
                            }
                        }
                    }
                }
                
                ForEach(currentTrip) { trip in
                    Section(header: Text(trip.title)) {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(trip.imageNames, id: \.self) { imageName in
                                    TripImageView(imageName: imageName)
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Home Screen")
        }
        .tabItem {
            Image(systemName: "house.fill")
            Text("Home")
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}


