//
//  Profile.swift
//  TravelApp
//
//  Created by Kyle Fletcher on 3/27/24.
//

import SwiftUI

struct Profile: View {
    
    @State private var Options: String = ""
    @State private var selectedOption: String = "My Library"
    let options = ["My Library", "My Puzzles", "Advanced"]
    
    @State private var Filter: String = ""
    @State private var selectedFilter: String = "Filter By"
    let ageRange = ["Filter By", "Filter 2", "Filter 3"]
    
    var body: some View {
        ScrollView {
            VStack (spacing: 5){
                Text("Welcome, User") //Page Title
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(.top, 0)
                
                Divider() // Adds Divider Bar
                    .background(Color.black)
                
                HStack {
                    // Button for gearshape image
                    Button(action: {
                        print("Gear tapped")
                        // Handle the tap action here
                    }) {
                        Image(systemName: "gearshape.fill")
                            .font(.system(size: 20))
                            .foregroundColor(.black) // Set the image color to black
                    }
                    .padding(.leading, 0)

                    Spacer() // This will push all the items to the edges

                    // Button for stack down right image
                    Button(action: {
                        print("Stack down right tapped")
                        // Handle the tap action here
                    }) {
                        Image(systemName: "square.split.1x2.fill")
                            .font(.system(size: 20))
                            .foregroundColor(.black) // Set the image color to black
                    }

                    // Button for stack up image
                    Button(action: {
                        print("Stack up tapped")
                        // Handle the tap action here
                    }) {
                        Image(systemName: "square.split.2x2.fill")
                            .font(.system(size: 20))
                            .foregroundColor(.black) // Set the image color to black
                    }
                }
                .padding(.horizontal,10) // Apply padding to the horizontal edges of the HStack
                
                VStack{
                    ImageInCircle(imgName: "StockImage1")
                        .padding(.top,10)
                }
//                
                HStack {
                    VStack (spacing: 5) {
                        
                        Picker("Filter", selection: $selectedFilter) {
                            ForEach(ageRange, id: \.self) { option in
                                Text(option).tag(option)
                            }
                        }
                        .accentColor(.black) // This changes the color of the picker indicator (arrow) to black
                        .pickerStyle(MenuPickerStyle()) // This makes it appear as a dropdown
                        .frame(minWidth: 100, maxWidth: .infinity) // Set the frame width
                        .padding(10)
                        .background(Color("Tan"))
                        .cornerRadius(5.0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                        .padding(.horizontal,20)
                        .padding(.trailing,-10)
                    }
                    
                    Picker("Options", selection: $selectedOption) {
                        ForEach(options, id: \.self) { option in
                            Text(option).tag(option)
                        }
                    }
                    .accentColor(.black) // This changes the color of the picker indicator (arrow) to black
                    .pickerStyle(MenuPickerStyle()) // This makes it appear as a dropdown
                    .frame(minWidth: 100, maxWidth: .infinity) // Set the frame width
                    .padding(10)
                    .background(Color("Tan"))
                    .cornerRadius(5.0)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    
                    .padding(.trailing,20)
                   
                }
                
                .padding(.top,30)
            }
        }
        .background(Color("Tan"))
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}
