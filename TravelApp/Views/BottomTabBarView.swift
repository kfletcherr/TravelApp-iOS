//
//  BottomTabBarView.swift
//  Travel App
//
//  Created by Kyle Fletcher on 3/27/24.
//

import SwiftUI

struct BottomTabBarView: View {
    @State private var selectedTab: Tab = .home

    var body: some View {
        ZStack(alignment: .bottom) { // Align content to the bottom
            // Your main content
            switch selectedTab {
            case .home:
                Home()
            case .schedule:
                ScheduleView()
            case .search:
                Search()
            case .profile:
                Profile()
            }

            // Custom tab bar along with Rectangle as a background
            VStack(spacing: 0) {
                // This ensures there's no unwanted space between your content and the tab bar
                Spacer()
                customTabBar
                    .background(Color.white.opacity(0.9)) // Background of the custom tab bar
                    .frame(height: 25) // Adjust this height as needed
                    .edgesIgnoringSafeArea(.bottom) // Makes it extend into the safe area
            }
        }
    }

    // Custom tab bar view
    private var customTabBar: some View {
        HStack {
            tabButton(for: .home, iconName: "house", label: "Home")
            Spacer()
            tabButton(for: .schedule, iconName: "calendar", label: "Calendar")
            Spacer()
            tabButton(for: .search, iconName: "magnifyingglass", label: "Search")
            Spacer()
            tabButton(for: .profile, iconName: "person", label: "Profile")
        }
        .padding(.horizontal)
        .padding(.bottom, 0) // Give some bottom padding inside the tab bar for visual balance
    }

    // Factory method for tab buttons with size adjustments
    private func tabButton(for tab: Tab, iconName: String, label: String) -> some View {
        Button(action: {
            withAnimation {
                selectedTab = tab
            }
        }) {
            VStack {
                Image(systemName: iconName)
                    .imageScale(.large) // Adjusts the icon size
                    .foregroundColor(selectedTab == tab ? .red : .black)
                Text(label)
                    .foregroundColor(.black)
                    .font(.headline) // Adjusts the label font size
            }
            .padding(.vertical) // Adjusts vertical padding for the tap target size
            .padding(.bottom, 15) // Moves the button visuals closer to the bottom
        }
    }

    // Enumeration for tabs
    enum Tab {
        case home, schedule, search, profile
    }
}

struct BottomTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        BottomTabBarView()
    }
}
