//
//  TripDetailView.swift
//  TravelApp
//
//  Created by Kyle Fletcher on 4/22/24.
//
import SwiftUI

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
            .padding(.bottom, 100) // Add padding to the bottom of the VStack
        }
        .background(Image("Background")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all))
        .navigationBarTitle(trip.title, displayMode: .inline)
        .onAppear {
            favoriteMemories = trip.detail
            leastFavorite = ""
        }
    }
    
    private func detailSection(title: String, content: Binding<String>) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.headline)
                .foregroundColor(.black)
            TextEditor(text: content)
                .frame(height: 200)
                .frame(width: 350)
                .background(Color.white.opacity(0.9))
                .cornerRadius(10)
                .padding(.horizontal)
        }
        .padding()
    }
    
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
        .frame(maxWidth: 350)
        .background(Color.white.opacity(0.9))
        .cornerRadius(10)
        .padding(.horizontal)
    }
    
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

struct TripDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TripDetailView(trip: Trip(title: "Sample Trip", imageName: "sampleImage", detail: "Details of a sample trip"))
    }
}
