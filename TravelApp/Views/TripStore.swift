//
//  TripStore.swift
//  TravelApp
//
//  Created by Kyle Fletcher on 4/22/24.
//

import Foundation

class TripStore: ObservableObject {
    @Published var currentTrips: [Trip] = []
    @Published var previousTrips: [Trip] = []
    @Published var futureTrips: [Trip] = []
    
    // Example initializer loading some default trips
    init() {
        currentTrips = [
            Trip(title: "Cruise", imageName: "Cruise", detail: "Add Cruise Memories Here")
        ]
        previousTrips = [
            Trip(title: "Mexico", imageName: "mexico", detail: "Add Mexico Memories Here"),
            Trip(title: "Disney", imageName: "disney", detail: "Add Disney Memories Here"),
            Trip(title: "New York City", imageName: "newyork", detail: "Add New York Memories Here")
        ]
        futureTrips = [
            Trip(title: "Paris", imageName: "paris", detail: "Add Paris Memories Here"),
            Trip(title: "Fort Lauderdale", imageName: "florida", detail: "Add Florida Memories Here"),
            Trip(title: "Las Vegas", imageName: "vegas", detail: "Add Vegas Memories Here")
        ]
    }
    
    func addTrip(trip: Trip, to category: String) {
        switch category {
        case "Current Trips":
            currentTrips.append(trip)
        case "Previous Trips":
            previousTrips.append(trip)
        case "Future Trips":
            futureTrips.append(trip)
        default:
            break
        }
    }
}
