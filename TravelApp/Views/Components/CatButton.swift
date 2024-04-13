//
//  CatButton.swift
//  TravelApp
//
//  Created by Kyle Fletcher on 4/3/24.
//


import SwiftUI

struct CatButton: View {
    var title: String
    var imageName: String // Add an imageName property to specify the image
    
    var body: some View {
            ZStack(alignment: .bottomLeading) {
                Rectangle() // Use a Rectangle as the background
                    .foregroundColor(Color.white.opacity(0.8)) // Set the background color to white
                    .opacity(0.8)
                    .frame(width: 350, height: 80)
                    .cornerRadius(12)
                    .shadow(color: .gray, radius: 5, x: 0, y: 2)
                
                Text(title)
                    .fontWeight(.bold)
                    .foregroundColor(.black) // Changed text color to black for contrast
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 8, trailing: 0))
            }
        }
    }

struct CatButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 10) {
            // Replace the backgroundColor parameter with imageName
            CatButton(title: "Food", imageName: "Food")
            CatButton(title: "Non-Fiction", imageName: "nonfiction")
            CatButton(title: "Kids", imageName: "kids")
            CatButton(title: "Romance", imageName: "romance")
            CatButton(title: "Thriller", imageName: "thriller")
        }
        .padding()
    }
}

