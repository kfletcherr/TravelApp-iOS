//
//  SettingsView.swift
//  TravelApp
//
//  Created by Kyle Fletcher on 4/22/24.
//
import SwiftUI

struct SettingsView: View {
    @ObservedObject var tripStore: TripStore
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Current Trips")) {
                    ForEach(tripStore.currentTrips) { trip in
                        Text(trip.title)
                    }
                    .onDelete(perform: { offsets in
                        deleteTrips(from: &tripStore.currentTrips, at: offsets)
                    })
                    .onMove(perform: { indices, newOffset in
                        moveTrips(in: &tripStore.currentTrips, from: indices, to: newOffset)
                    })
                }

                Section(header: Text("Previous Trips")) {
                    ForEach(tripStore.previousTrips) { trip in
                        Text(trip.title)
                    }
                    .onDelete(perform: { offsets in
                        deleteTrips(from: &tripStore.previousTrips, at: offsets)
                    })
                    .onMove(perform: { indices, newOffset in
                        moveTrips(in: &tripStore.previousTrips, from: indices, to: newOffset)
                    })
                }

                Section(header: Text("Future Trips")) {
                    ForEach(tripStore.futureTrips) { trip in
                        Text(trip.title)
                    }
                    .onDelete(perform: { offsets in
                        deleteTrips(from: &tripStore.futureTrips, at: offsets)
                    })
                    .onMove(perform: { indices, newOffset in
                        moveTrips(in: &tripStore.futureTrips, from: indices, to: newOffset)
                    })
                }
            }
            .navigationBarTitle("Manage Trips", displayMode: .inline)
            .navigationBarItems(leading: Button("Done") {
                presentationMode.wrappedValue.dismiss()
            }, trailing: EditButton())
            .listStyle(GroupedListStyle())
        }
    }
    
    private func deleteTrips(from trips: inout [Trip], at offsets: IndexSet) {
        trips.remove(atOffsets: offsets)
    }
    
    private func moveTrips(in trips: inout [Trip], from source: IndexSet, to destination: Int) {
        trips.move(fromOffsets: source, toOffset: destination)
    }
}

//#Preview {
//    SettingsView()
//}
