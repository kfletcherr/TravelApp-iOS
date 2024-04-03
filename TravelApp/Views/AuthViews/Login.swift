//
//  Profile.swift
//  TravelApp
//
//  Created by Kyle Fletcher on 3/27/24.
//

import SwiftUI

struct Login: View {
    @State private var usernameOrEmail: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack {
            Image("LoginTop")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width)
                .clipped()
                .edgesIgnoringSafeArea(.all)
                .padding(.top,0)

            
            
            
            Text("Log In")
                .font(.largeTitle)
                .fontWeight(.semibold)
                //.padding()
            
            VStack(spacing: 16) {
                
                AuthTextField(input: $usernameOrEmail, placeHolder: "Username or Email")
                
                AuthTextField(input: $password, password: true, placeHolder: "Password")
                
                
                
                Button("Forgot password?") {
                    // forgot password action
                }
                .foregroundColor(Color("Purple"))
                .font(.footnote)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.trailing)
                
                Button(action: {
                    // action for later
                    
                }) {
                    AuthButton(title: "LOG IN", loading: false)
                }
            }
            .padding(.horizontal)
            
            //Spacer()
            
            HStack() {
                Text("Don’t have an account?")
                    .font(.footnote)
                Button("Register") {
                    // perform registration
                }
                .foregroundColor(Color("Purple"))
                .font(.footnote)
            }
            
            Divider()
                .padding()
            
            Text("Or with social network:")
                .font(.headline)
                .padding(.bottom, 5)
            
            // Adjust your SocialLoginButton styles here to match the screenshot
            AuthButton(title: "Facebook", loading: false, socialMediaButton: true, icon: "f.circle.fill")
            AuthButton(title: "Sign in with X", loading: false, socialMediaButton: true, icon: "xmark.circle.fill")
            AuthButton(title: "Google", loading: false, socialMediaButton: true, icon: "g.circle.fill")
            
        }
        .padding()
        .background(Color("Tan"))
        .edgesIgnoringSafeArea(.all)
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
