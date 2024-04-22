//
//  MonthSelectionView.swift
//  TravelApp
//
//  Created by Kyle Fletcher on 4/22/24.
//
import SwiftUI

struct MonthSelectionView: View {
    @Binding var selectedMonth: String
    @Environment(\.dismiss) var dismiss

    let months = ["January 2024", "February 2024", "March 2024", "April 2024", "May 2024", "June 2024", "July 2024", "August 2024", "September 2024", "October 2024", "November 2024", "December 2024"]
    
    var body: some View {
        NavigationView {
            List(months, id: \.self) { month in
                Button(action: {
                    self.selectedMonth = month
                    dismiss()
                }) {
                    Text(month)
                        .foregroundColor(selectedMonth == month ? .blue : .black)
                        .fontWeight(selectedMonth == month ? .bold : .none)
                }
            }
            .navigationBarTitle("Select Month", displayMode: .inline)
        }
    }
}
