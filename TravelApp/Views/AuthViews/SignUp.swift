//
//  Profile.swift
//  TravelApp
//
//  Created by Kyle Fletcher on 3/27/24.
//
import SwiftUI

struct SignUp: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var Options: String = ""
    @State private var selectedOption: String = "Beginner"
    let options = ["Beginner", "Intermediate", "Advanced"]
    @State private var Age: String = ""
    @State private var selectedAge: String = "Range 1"
    let ageRange = ["Range 1", "Range 2", "Range 3"]
    
    
    var body: some View {
        ScrollView {
            
            Text("Sign Up") //Page Title
                .font(.title)
                .fontWeight(.semibold)
                .padding(.top, 0)
            
            Divider() // Adds Divider Bar
                .background(Color.black)
            
            VStack(alignment: .leading, spacing: 17) {
                
                VStack (spacing: 5) {
                    // First Name Field
                    SmallText(text: "First Name")
                    AuthTextField(input: $firstName, placeHolder: "First Name")
                }
                
                VStack (spacing: 5) {
                    // Last Name Field
                    SmallText(text: "Last Name")
                    AuthTextField(input: $lastName, placeHolder: "Last Name")
                }
                
                VStack (spacing: 5) {
                    // Email Field
                    SmallText(text: "Email")
                    AuthTextField(input: $email, placeHolder: "Email")
                }
                
                VStack (spacing: 5) {
                    // PasswordField
                    SmallText(text: "Password")
                    AuthTextField(input: $password, password: true, placeHolder: "Password")
                }
                
                VStack (spacing: 5) {
                    // Confirm Password Field
                    SmallText(text: "Confirm Password")
                    AuthTextField(input: $confirmPassword, password: true, placeHolder: "Confirm Password")
                }
                
                VStack (spacing: 5) {
                    SmallText(text: "Age (Range)")
                    HStack {
                        
                        Picker("Age", selection: $selectedAge) {
                            ForEach(ageRange, id: \.self) { option in
                                Text(option).tag(option)
                            }
                        }
                        .accentColor(.black) // This changes the color of the picker indicator (arrow) to black
                        .pickerStyle(MenuPickerStyle()) // This makes it appear as a dropdown
                        .frame(minWidth: 100, maxWidth: .infinity) // Set the frame width
                        .padding(5)
                        .background(Color("Tan"))
                        .cornerRadius(5.0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                    }
                    .padding(.bottom, 10)
                    
                }
                
                
                VStack (spacing: 5) {
                    SmallText(text: "Logic Puzzle Experience Level")
                    HStack {
                        Picker("Options", selection: $selectedOption) {
                            ForEach(options, id: \.self) { option in
                                Text(option).tag(option)
                            }
                        }
                        .accentColor(.black) // This changes the color of the picker indicator (arrow) to black
                        .pickerStyle(MenuPickerStyle()) // This makes it appear as a dropdown
                        .frame(minWidth: 100, maxWidth: .infinity) // Set the frame width
                        .padding(5)
                        .background(Color("Tan"))
                        .cornerRadius(5.0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                    }
                    .padding(.bottom, 10)
                }
                VStack{
                    
                    AuthButton(title: "SIGN UP", loading: false)
                    
                    
                  
                    
                }
            }
            
            
            .padding()
        }
        .background(Color("Tan"))
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}
