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
        NavigationView{
            ScrollView {
                VStack (spacing: 5){
                    
                    
                    
                    AuthTextField(input: $search, placeHolder: "Search")
                        .padding(EdgeInsets(top: 15, leading: 10, bottom: 0, trailing: 10))                            .padding(.bottom, 10)
                    
                    VStack{
                        
                        
                        Button(action: {
                            // action for later
                            
                        }) {
                            CatButton(title: "Food", imageName: "Food")
                        }
                        Button(action: {
                            // action for later
                            
                        }) {
                            CatButton(title: "Attractions", imageName: "Attractions")                        }
                        
                        
                        Button(action: {
                            // action for later
                            
                        }) {
                            CatButton(title: "Night Life", imageName: "NightLife")                        }
                        Button(action: {
                            // action for later
                            
                        }) {
                            CatButton(title: "Hiking", imageName: "Hiking")                        }
                        
                        
                        Button(action: {
                            // action for later
                            
                        }) {
                            CatButton(title: "Family", imageName: "Family")                       }
                        Spacer() // Pushes the button to the left
                    }
                }
            }
            
            .navigationBarItems(leading: Button(action: {
                print("Settings tapped")
            }) {
                Image(systemName: "gearshape")
                    .foregroundColor(.primary) // Adapt to light and dark mode
            }, trailing: Button(action: {
                print("Edit tapped")
            }) {
                Image(systemName: "bell")
                    .foregroundColor(.primary) // Adapt to light and dark mode
            })
            .navigationBarTitle("Search", displayMode: .inline)
            .background(
                Image("Background") // Use your background image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all) // Make the background fill the entire screen
            )
        }
    }
}

struct Search_Previews: PreviewProvider {
    static var previews: some View {
        Search()
    }
}
