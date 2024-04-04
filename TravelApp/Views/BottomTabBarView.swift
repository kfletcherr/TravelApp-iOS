//
//  BottomTabBarView.swift
//  LoggitaleS
//
//  Created by Sonja Mitrovic on 1/29/24.
//

import SwiftUI

struct BottomTabBarView: View {
    
    var body: some View {
        NavigationStack {
            ZStack {
                TabView () {
                    Home()
                        .tabItem() {
                            Image(systemName: "house")
                            Text("Home")
                        }
                    NavigationView {
                        ScheduleView()
                    }
                        .tabItem() {
                            Image(systemName: "calendar")
                            Text("Calendar")
                        }
                    Search()
                        .tabItem() {
                            Image(systemName: "magnifyingglass")
                            Text("Search")
                        }
                    Profile(
                        
                    )
                    .tabItem() {
                        Image(systemName: "person")
                        Text("Profile")
                        
                    }
                }
            }
        }
        .onAppear(perform: {
        })
    }
}


struct BottomTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        BottomTabBarView()
    }
}
