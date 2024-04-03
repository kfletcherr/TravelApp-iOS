//
//  ImageInCircle.swift
//  LoggitaleS
//
//  Created by Kyle Fletcher on 2/23/24.
//
import SwiftUI

struct ImageInCircle: View {
    
    let imgName: String
    
    var body: some View {
        let size: CGFloat = 150
        
        VStack {
            ZStack {
                Circle()
                    .foregroundColor(Color("White"))
                    .frame(width: size, height: size)
                    .overlay(
                        Image(imgName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: size, height: size)
                            .opacity(0.30)
                            .clipShape(Circle()) // Clip the image to a circle shape
                            .overlay(
                                Image("logo-small-white")
                                    .resizable()
                                    .frame(width: 60, height: 150)
                                    .offset(y: 80)
                            )
                    )
                    // Add a black border around the circle
                    .overlay(
                        Circle().stroke(Color.black, lineWidth: 3) // Adjust lineWidth for border thickness
                    )
            }
        }
    }
}

struct ImageInCircle_Previews: PreviewProvider {
    static var previews: some View {
        ImageInCircle(imgName: "StockImage1")
    }
}
