//
//  Search.swift
//  TravelApp
//
//  Created by Kyle Fletcher on 3/27/24.
//

import SwiftUI

struct Search: View {
    
    @State private var search: String = ""
    
    var body: some View {
        ScrollView {
            VStack (spacing: 5){
                Text("Welcome") //Page Title
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
                
                
                AuthTextField(input: $search, placeHolder: "Search")
                    .padding(EdgeInsets(top: 15, leading: 10, bottom: 0, trailing: 10))                            .padding(.bottom, 10)

                VStack{
                    
                    HStack(spacing: 10) {
                        Button(action: {
                            // action for later
                            
                        }) {
                            CatButton(title: "Food", imageName: "Food")
                        }
                        Button(action: {
                            // action for later
                            
                        }) {
                            CatButton(title: "Attractions", imageName: "Attractions")                        }
                    }
                    HStack(spacing: 10) {
                        Button(action: {
                            // action for later
                            
                        }) {
                            CatButton(title: "Night Life", imageName: "NightLife")                        }
                        Button(action: {
                            // action for later
                            
                        }) {
                            CatButton(title: "Hiking", imageName: "Hiking")                        }
                    }
                    HStack(spacing: 10) {
                        Button(action: {
                            // action for later
                            
                        }) {
                            CatButton(title: "Family", imageName: "Family")                       }
                        Spacer() // Pushes the button to the left
                    }
                    .padding(.leading, 20)
                }
            }
        }
        .background(Color("Tan"))
    }
}


struct Search_Previews: PreviewProvider {
    static var previews: some View {
        Search()
    }
}
