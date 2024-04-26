//
//  SearchViews.swift
//  TravelApp
//
//  Created by Kyle Fletcher on 4/24/24.
//

import SwiftUI

struct DestinationsView: View {
    var body: some View {
        List(PlaceData.AllPlaces) { place in
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
        .navigationTitle("All Vacations")
        .background(
                    Image("Background")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                )
    }
}


struct BeachView: View {
    var body: some View {
        List(PlaceData.beaches) { place in
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
        .navigationTitle("Beach Vacations")
        .background(
                    Image("Background")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                )
    }
}

struct CulturalView: View {
    var body: some View {
        List(PlaceData.culturePlaces) { place in
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
        .navigationTitle("Cultural Vacations")
        .background(
                    Image("Background")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                )
    }
}

struct RomanticView: View {
    var body: some View {
        List(PlaceData.RomanticPlaces) { place in
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
        .navigationTitle("Romantic Vacations")
        .background(
                    Image("Background")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                )
    }
}

struct CampingView: View {
    var body: some View {
        List(PlaceData.CampingPlaces) { place in
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
        .navigationTitle("Camping Trips")
        .background(
                    Image("Background")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                )
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
        .navigationTitle("Family Vacations")
        .background(
                    Image("Background")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                )
    }
}


struct Place: Identifiable {
    var id = UUID()
    var name: String
    var description: String
    var imageName: String
    var weather: WeatherData?  // Optional, will store weather data once fetched
}




struct PlaceData {
    static let AllPlaces = [
        Place(name: "New York", description: "Authentic Italian cuisine in the heart of the city.", imageName: "family"),
        Place(name: "Orlando", description: "Fresh sushi and Japanese dishes.", imageName: "attraction"),
        Place(name: "Las Vegas", description: "Authentic Italian cuisine in the heart of the city.", imageName: "family"),
        Place(name: "Paris", description: "Fresh sushi and Japanese dishes.", imageName: "attraction")
    ]

    static let beaches = [
        Place(name: "City Museum", description: "Explore the history of the city.", imageName: "museum"),
        Place(name: "Central Park", description: "Beautiful urban park for relaxing and events.", imageName: "park")
    ]

    static let culturePlaces = [
        Place(name: "Skyline Bar", description: "Enjoy the city views with cocktails.", imageName: "bar"),
        Place(name: "Dance Club 101", description: "Best place in town for dancing and live DJ.", imageName: "club")
    ]

    static let CampingPlaces = [
        Place(name: "Mountain Trail", description: "Scenic hiking route through the mountains.", imageName: "mountain"),
        Place(name: "Riverside Walk", description: "A gentle walk by the river, great for all ages.", imageName: "riverwalk")
    ]

    static let family = [
        Place(name: "Zoo City", description: "Meet exotic animals and learn about wildlife.", imageName: "zoo"),
        Place(name: "Wonderland", description: "Amusement park with rides and games for the whole family.", imageName: "amusement")
    ]
    static let RomanticPlaces = [
        Place(name: "Zoo City", description: "Meet exotic animals and learn about wildlife.", imageName: "zoo"),
        Place(name: "Wonderland", description: "Amusement park with rides and games for the whole family.", imageName: "amusement")
    ]
}
