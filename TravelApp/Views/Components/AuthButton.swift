//
//  Profile.swift
//  TravelApp
//
//  Created by Kyle Fletcher on 3/27/24.
//

import SwiftUI

struct AuthButton: View {
    var title: String // The text that is on the button
    var loading: Bool = false
    var socialMediaButton: Bool = false
    var icon: String = ""
    
    var body: some View {
        if (loading) {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color("Coral"))
                .foregroundColor(.white)
                .cornerRadius(10.0)
        } else {
            if socialMediaButton {
                HStack {
                    Image(systemName: icon)
                        .foregroundColor(Color("Tan"))
                    Text(title)
                        .foregroundColor(Color("Tan"))
                        .font(.caption)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color("Purple")) // Adjust this color to match your screenshot
                .cornerRadius(10)
                
            } else {
                
                textInButton
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color("Purple")) // Adjust this color to match your screenshot
                    .cornerRadius(10)
            }
        }
    }
    
    var textInButton: some View {
        Text(title.uppercased())
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity)
    }
}

struct AuthButton_Previews: PreviewProvider {
    static var previews: some View {
        AuthButton(title: "Login", loading: false)
    }
}
