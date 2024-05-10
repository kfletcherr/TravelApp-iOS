//
//  AddCityView.swift
//  TravelApp
//
//  Created by Kyle Fletcher on 5/1/24.
//

import SwiftUI

struct AddCityView: View {
    @Binding var locations: [String]
    @Binding var showing: Bool
    @State private var cityName = ""

    var body: some View {
        NavigationView {
            Form {
                TextField("City Name", text: $cityName)
                Button("Add") {
                    if !cityName.trimmingCharacters(in: .whitespaces).isEmpty {
                        locations.append(cityName)
                        showing = false
                    }
                }
                .disabled(cityName.trimmingCharacters(in: .whitespaces).isEmpty)
            }
            .navigationBarTitle("Add City", displayMode: .inline)
            .navigationBarItems(leading: Button("Cancel") {
                showing = false
            })
        }
    }
}
