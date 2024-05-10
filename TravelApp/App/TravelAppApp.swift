//
//  TravelAppApp.swift
//  TravelApp
//
//  Created by Kyle Fletcher on 3/27/24.
//

import SwiftUI
import Foundation
import Firebase


@main
struct TravelAppApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    init() {
        FirebaseApp.configure()    }
    
}
