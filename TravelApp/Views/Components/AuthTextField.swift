//
//  AuthTextField.swift
//  TravelApp
//
//  Created by Kyle Fletcher on 3/27/24.
//
import SwiftUI

struct AuthTextField: View {
    @FocusState var focused: Bool // indicates whether the field is being focused to use the blinking cursor
    @Binding var input: String // The text that gets entered by the user
    
    var password: Bool = false // bool that shows whether the text is a password or not
    var placeHolder : String
    
    var body: some View {
        //design if the text is a password
        if (password) {
            SecureField(
                placeHolder,
                text: $input
            )
            .focused($focused)
            .onSubmit {
                print(input)
            }
            .submitLabel(.done)
            .textInputAutocapitalization(.never)
            .disableAutocorrection(true)
            .padding(10) // Inner padding for the text
            .background(Color("Tan")) // Background color of the text field
            .cornerRadius(5.0) // Rounded corners for the inner text field
            .padding(.bottom, 0) // Space below the text field
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.gray, lineWidth: 1) // This adds the black outline
            )
            
            // design if the text isnt a password
        } else {
            TextField(
                placeHolder,
                text: $input
            )
            .focused($focused)
            .onSubmit {
                print(input)
            }
            .submitLabel(.done)
            .textInputAutocapitalization(.never)
            .disableAutocorrection(true)
            .padding(10) // Inner padding for the text
            .background(Color("Tan")) // Background color of the text field
            .cornerRadius(5.0) // Rounded corners for the inner text field
            .padding(.bottom, 0) // Space below the text field
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.black, lineWidth: 5) // This adds the black outline
            )
        }
        
    }
}
//
//struct AuthTextField_Previews: PreviewProvider {
//    static var previews: some View {
//        AuthTextField(input: <#Binding<String>#>, placeHolder: <#String#>)
//    }
//}
