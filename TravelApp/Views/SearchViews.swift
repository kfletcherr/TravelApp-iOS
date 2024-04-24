//
//  SearchViews.swift
//  TravelApp
//
//  Created by Kyle Fletcher on 4/24/24.
//

import SwiftUI

struct FoodView: View {
    var body: some View {
        List(PlaceData.foodPlaces) { place in
            VStack(alignment: .leading) {
                Text(place.name)
                    .font(.headline)
                Text(place.description)
                    .font(.subheadline)
                Image(place.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
            }
        }
        .navigationTitle("Food")
    }
}


struct AttractionsView: View {
    var body: some View {
        List(PlaceData.attractions) { place in
            VStack(alignment: .leading) {
                Text(place.name)
                    .font(.headline)
                Text(place.description)
                    .font(.subheadline)
                Image(place.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
            }
        }
        .navigationTitle("Attractions")
    }
}

struct NightLifeView: View {
    var body: some View {
        List(PlaceData.nightLife) { place in
            VStack(alignment: .leading) {
                Text(place.name)
                    .font(.headline)
                Text(place.description)
                    .font(.subheadline)
                Image(place.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
            }
        }
        .navigationTitle("Night Life")
    }
}


struct FamilyView: View {
    var body: some View {
        List(PlaceData.family) { place in
            VStack(alignment: .leading) {
                Text(place.name)
                    .font(.headline)
                Text(place.description)
                    .font(.subheadline)
                Image(place.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
            }
        }
        .navigationTitle("Family Fun")
    }
}


struct Place: Identifiable {
    var id = UUID()
    var name: String
    var description: String
    var imageName: String // This could link to an asset for displaying an image
}




struct PlaceData {
    static let foodPlaces = [
        Place(name: "Casa Italiano", description: "Authentic Italian cuisine in the heart of the city.", imageName: "italian"),
        Place(name: "Sushi Sun", description: "Fresh sushi and Japanese dishes.", imageName: "sushi")
    ]

    static let attractions = [
        Place(name: "City Museum", description: "Explore the history of the city.", imageName: "museum"),
        Place(name: "Central Park", description: "Beautiful urban park for relaxing and events.", imageName: "park")
    ]

    static let nightLife = [
        Place(name: "Skyline Bar", description: "Enjoy the city views with cocktails.", imageName: "bar"),
        Place(name: "Dance Club 101", description: "Best place in town for dancing and live DJ.", imageName: "club")
    ]

    static let hiking = [
        Place(name: "Mountain Trail", description: "Scenic hiking route through the mountains.", imageName: "mountain"),
        Place(name: "Riverside Walk", description: "A gentle walk by the river, great for all ages.", imageName: "riverwalk")
    ]

    static let family = [
        Place(name: "Zoo City", description: "Meet exotic animals and learn about wildlife.", imageName: "zoo"),
        Place(name: "Wonderland", description: "Amusement park with rides and games for the whole family.", imageName: "amusement")
    ]
}
