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
            ZStack {
                Image(place.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 100)
                    .cornerRadius(10)
                    .clipped()
                
                Rectangle()
                    .foregroundColor(.black.opacity(0.6))
                    .cornerRadius(10)

                VStack(alignment: .leading) {
                    Text(place.name)
                        .font(.headline)
                        .bold()
                        .foregroundColor(.white)
                        .padding(.vertical, 3)
                    
                    Text(place.description)
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .padding(.vertical, 3)
                }
                .padding(.leading, 10) // Padding on the left to keep text from the edge
            }
        }
        .navigationTitle("All Vacations")
        .background(
            Image("Background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
        )

    }
}




struct BeachView: View {
    var body: some View {
        List(PlaceData.beaches) { place in
            ZStack {
                Image(place.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 100)
                    .cornerRadius(10)
                    .clipped()
                
                Rectangle()
                    .foregroundColor(.black.opacity(0.6))
                    .cornerRadius(10)

                VStack(alignment: .leading) {
                    Text(place.name)
                        .font(.headline)
                        .bold()
                        .foregroundColor(.white)
                        .padding(.vertical, 3)
                    
                    Text(place.description)
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .padding(.vertical, 3)
                }
                .padding(.leading, 10) // Padding on the left to keep text from the edge
            }
        }
        .navigationTitle("Beach Trips")
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
            ZStack {
                Image(place.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 100)
                    .cornerRadius(10)
                    .clipped()
                
                Rectangle()
                    .foregroundColor(.black.opacity(0.6))
                    .cornerRadius(10)

                VStack(alignment: .leading) {
                    Text(place.name)
                        .font(.headline)
                        .bold()
                        .foregroundColor(.white)
                        .padding(.vertical, 3)
                    
                    Text(place.description)
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .padding(.vertical, 3)
                }
                .padding(.leading, 10) // Padding on the left to keep text from the edge
            }
        }
        .navigationTitle("Cultural Destinations")
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
            ZStack {
                Image(place.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 100)
                    .cornerRadius(10)
                    .clipped()
                
                Rectangle()
                    .foregroundColor(.black.opacity(0.6))
                    .cornerRadius(10)

                VStack(alignment: .leading) {
                    Text(place.name)
                        .font(.headline)
                        .bold()
                        .foregroundColor(.white)
                        .padding(.vertical, 3)
                    
                    Text(place.description)
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .padding(.vertical, 3)
                }
                .padding(.leading, 10) // Padding on the left to keep text from the edge
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
            ZStack {
                Image(place.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 100)
                    .cornerRadius(10)
                    .clipped()
                
                Rectangle()
                    .foregroundColor(.black.opacity(0.6))
                    .cornerRadius(10)

                VStack(alignment: .leading) {
                    Text(place.name)
                        .font(.headline)
                        .bold()
                        .foregroundColor(.white)
                        .padding(.vertical, 3)
                    
                    Text(place.description)
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .padding(.vertical, 3)
                }
                .padding(.leading, 10) // Padding on the left to keep text from the edge
            }
        }
        .navigationTitle("National Parks")
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
            ZStack {
                Image(place.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 100)
                    .cornerRadius(10)
                    .clipped()
                
                Rectangle()
                    .foregroundColor(.black.opacity(0.6))
                    .cornerRadius(10)

                VStack(alignment: .leading) {
                    Text(place.name)
                        .font(.headline)
                        .bold()
                        .foregroundColor(.white)
                        .padding(.vertical, 3)
                    
                    Text(place.description)
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .padding(.vertical, 3)
                }
                .padding(.leading, 10) // Padding on the left to keep text from the edge
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
        Place(name: "Clearwater Beach", description: "White sandy beaches and clear blue waters make Clearwater Beach a popular destination for beach lovers.", imageName: "clearwater_beach"),
        Place(name: "Destin", description: "Known as the 'World's Luckiest Fishing Village,' Destin offers stunning beaches and abundant fishing opportunities.", imageName: "destin"),
        Place(name: "Malibu", description: "Famous for its celebrity homes and beautiful coastline, Malibu is a premier beach destination in California.", imageName: "malibu"),
        Place(name: "Key West", description: "Located at the southernmost point of the continental U.S., Key West is known for its vibrant nightlife and colorful architecture.", imageName: "key_west"),
        Place(name: "Miami Beach", description: "With its iconic Art Deco architecture and lively atmosphere, Miami Beach attracts visitors from around the world.", imageName: "miami_beach"),
        Place(name: "Tokyo", description: "Experience the bustling metropolis of Tokyo, where modernity meets tradition in a vibrant cityscape.", imageName: "tokyo"),
        Place(name: "Cuba", description: "Explore the rich culture and history of Cuba, from its colonial architecture to its vibrant music and dance.", imageName: "cuba"),
        Place(name: "Cusco", description: "Discover the ancient capital of the Inca Empire, nestled in the Andes Mountains of Peru.", imageName: "cusco"),
        Place(name: "Jamaica", description: "Relax on the beautiful beaches of Jamaica and immerse yourself in the island's laid-back atmosphere and reggae music.", imageName: "jamaica"),
        Place(name: "Hong Kong", description: "Experience the dynamic cityscape of Hong Kong, with its towering skyscrapers, bustling street markets, and scenic harbor views.", imageName: "hong_kong"),
        Place(name: "Yellowstone", description: "Explore the natural wonders of Yellowstone National Park, home to geysers, hot springs, and diverse wildlife.", imageName: "yellowstone"),
        Place(name: "Acadia", description: "Discover the rugged coastline and scenic landscapes of Acadia National Park, located on the coast of Maine.", imageName: "acadia"),
        Place(name: "Yosemite", description: "Experience the breathtaking beauty of Yosemite National Park, with its towering granite cliffs, cascading waterfalls, and ancient sequoia trees.", imageName: "yosemite"),
        Place(name: "Glacier", description: "Explore the pristine wilderness of Glacier National Park, known for its glacier-carved peaks, alpine meadows, and crystal-clear lakes.", imageName: "glacier"),
        Place(name: "Big Bend", description: "Escape to the remote wilderness of Big Bend National Park, where the Rio Grande carves deep canyons through the Chihuahuan Desert.", imageName: "big_bend"),
        Place(name: "Wisconsin Dells", description: "Experience family fun at Wisconsin Dells, with its water parks, amusement parks, and scenic boat tours along the Wisconsin River.", imageName: "wisconsin_dells"),
        Place(name: "Disney World", description: "Enter the magical world of Disney at Walt Disney World Resort in Florida, where dreams come true for visitors of all ages.", imageName: "disney_world"),
        Place(name: "Boston", description: "Discover the rich history and vibrant culture of Boston, with its historic sites, world-class museums, and delicious seafood.", imageName: "boston"),
        Place(name: "San Diego Zoo", description: "Visit one of the largest and most famous zoos in the world, the San Diego Zoo, home to thousands of animals from around the globe.", imageName: "san_diego_zoo"),
        Place(name: "Universal Studios", description: "Experience the magic of the movies at Universal Studios Hollywood, with thrilling rides, shows, and attractions based on your favorite films.", imageName: "universal_studios")
    ]
    
    static let beaches = [
        Place(name: "Clearwater Beach", description: "White sandy beaches and clear blue waters make Clearwater Beach a popular destination for beach lovers.", imageName: "clearwater_beach"),
        Place(name: "Destin", description: "Known as the 'World's Luckiest Fishing Village,' Destin offers stunning beaches and abundant fishing opportunities.", imageName: "destin"),
        Place(name: "Malibu", description: "Famous for its celebrity homes and beautiful coastline, Malibu is a premier beach destination in California.", imageName: "malibu"),
        Place(name: "Key West", description: "Located at the southernmost point of the continental U.S., Key West is known for its vibrant nightlife and colorful architecture.", imageName: "key_west"),
        Place(name: "Miami Beach", description: "With its iconic Art Deco architecture and lively atmosphere, Miami Beach attracts visitors from around the world.", imageName: "miami_beach"),
        Place(name: "Maldives", description: "Escape to the paradise islands of the Maldives, with their crystal-clear waters, pristine beaches, and luxurious resorts.", imageName: "maldives"),
        Place(name: "Paris", description: "Experience the romance of Paris, with its iconic landmarks, charming cafes, and world-renowned cuisine.", imageName: "paris"),
        Place(name: "Aspen", description: "Discover the beauty of Aspen, a premier destination for skiing, snowboarding, and outdoor adventure in the Rocky Mountains.", imageName: "aspen"),
        Place(name: "Bora Bora", description: "Experience the ultimate tropical paradise on the island of Bora Bora, with its overwater bungalows and crystal-clear lagoons.", imageName: "bora_bora"),
        Place(name: "Barbados", description: "Relax on the stunning beaches of Barbados, with their white sand, turquoise waters, and vibrant local culture.", imageName: "barbados")
    ]
    
    static let culturePlaces = [
        Place(name: "Tokyo", description: "Experience the bustling metropolis of Tokyo, where modernity meets tradition in a vibrant cityscape.", imageName: "tokyo"),
        Place(name: "Cuba", description: "Explore the rich culture and history of Cuba, from its colonial architecture to its vibrant music and dance.", imageName: "cuba"),
        Place(name: "Cusco", description: "Discover the ancient capital of the Inca Empire, nestled in the Andes Mountains of Peru.", imageName: "cusco"),
        Place(name: "Jamaica", description: "Relax on the beautiful beaches of Jamaica and immerse yourself in the island's laid-back atmosphere and reggae music.", imageName: "jamaica"),
        Place(name: "Hong Kong", description: "Experience the dynamic cityscape of Hong Kong, with its towering skyscrapers, bustling street markets, and scenic harbor views.", imageName: "hong_kong")
    ]
    
    static let CampingPlaces = [
        Place(name: "Yellowstone", description: "Explore the natural wonders of Yellowstone National Park, home to geysers, hot springs, and diverse wildlife.", imageName: "yellowstone"),
        Place(name: "Acadia", description: "Discover the rugged coastline and scenic landscapes of Acadia National Park, located on the coast of Maine.", imageName: "acadia"),
        Place(name: "Yosemite", description: "Experience the breathtaking beauty of Yosemite National Park, with its towering granite cliffs, cascading waterfalls, and ancient sequoia trees.", imageName: "yosemite"),
        Place(name: "Glacier", description: "Explore the pristine wilderness of Glacier National Park, known for its glacier-carved peaks, alpine meadows, and crystal-clear lakes.", imageName: "glacier"),
        Place(name: "Big Bend", description: "Escape to the remote wilderness of Big Bend National Park, where the Rio Grande carves deep canyons through the Chihuahuan Desert.", imageName: "big_bend")
    ]
    
    static let family = [
        Place(name: "Wisconsin Dells", description: "Experience family fun at Wisconsin Dells, with its water parks, amusement parks, and scenic boat tours along the Wisconsin River.", imageName: "wisconsin_dells"),
        Place(name: "Disney World", description: "Enter the magical world of Disney at Walt Disney World Resort in Florida, where dreams come true for visitors of all ages.", imageName: "disney_world"),
        Place(name: "Boston", description: "Discover the rich history and vibrant culture of Boston, with its historic sites, world-class museums, and delicious seafood.", imageName: "boston"),
        Place(name: "San Diego Zoo", description: "Visit one of the largest and most famous zoos in the world, the San Diego Zoo, home to thousands of animals from around the globe.", imageName: "san_diego_zoo"),
        Place(name: "Universal Studios", description: "Experience the magic of the movies at Universal Studios Hollywood, with thrilling rides, shows, and attractions based on your favorite films.", imageName: "universal_studios")
    ]
    
    static let RomanticPlaces = [
        Place(name: "Maldives", description: "Escape to the paradise islands of the Maldives, with their crystal-clear waters, pristine beaches, and luxurious resorts.", imageName: "maldives"),
        Place(name: "Paris", description: "Experience the romance of Paris, with its iconic landmarks, charming cafes, and world-renowned cuisine.", imageName: "paris"),
        Place(name: "Aspen", description: "Discover the beauty of Aspen, a premier destination for skiing, snowboarding, and outdoor adventure in the Rocky Mountains.", imageName: "aspen"),
        Place(name: "Bora Bora", description: "Experience the ultimate tropical paradise on the island of Bora Bora, with its overwater bungalows and crystal-clear lagoons.", imageName: "bora_bora"),
        Place(name: "Barbados", description: "Relax on the stunning beaches of Barbados, with their white sand, turquoise waters, and vibrant local culture.", imageName: "barbados")
    ]
}
