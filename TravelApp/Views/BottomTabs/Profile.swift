import SwiftUI


struct Profile: View {
    @State private var isReadingLevelExpanded: Bool = false
    @State private var isLibraryExpanded: Bool = false
    @State private var isPuzzlesExpanded: Bool = false
    @State private var isLayoutHorizontal: Bool = false // Controls the layout orientation
    @State private var selectedReadingLevel: String? // Tracks the selected reading level
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 5) {
                    
                    
                    ImageInCircle(imgName: "profile")
                        .padding(.bottom, 25)
                    
                    if isLayoutHorizontal {
                        // Horizontal Layout with two tabs on top and one at the bottom
                        VStack {
                            HStack(spacing: 20) {
                                DisclosureGroupComponent(isExpanded: $isReadingLevelExpanded, title: "Filter By") {
                                    // Custom content for "Filter By" using check boxes
                                    CheckBox(title: "Beginner", isSelected: selectedReadingLevel == "Beginner") {
                                        selectedReadingLevel = "Beginner"
                                    }
                                    CheckBox(title: "Intermediate", isSelected: selectedReadingLevel == "Intermediate") {
                                        selectedReadingLevel = "Intermediate"
                                    }
                                    CheckBox(title: "Advanced", isSelected: selectedReadingLevel == "Advanced") {
                                        selectedReadingLevel = "Advanced"
                                    }
                                }
                                DisclosureGroupComponent(isExpanded: $isLibraryExpanded, title: "My Library") {
                                    // Custom content for My Library
                                    Text("Most Recent")
                                    Text("31% Complete")
                                    Text("Unopened")
                                    Text("Complete")
                                }
                            }
                            DisclosureGroupComponent(isExpanded: $isPuzzlesExpanded, title: "My Puzzles") {
                                // Custom content for My Puzzles
                                Text("Most Recent")
                                Text("31% Complete")
                                Text("Unopened")
                                Text("Complete")
                            }
                        }
                    } else {
                        // Vertical Layout
                        VStack(spacing: 20) {
                            DisclosureGroupComponent(isExpanded: $isReadingLevelExpanded, title: "Favorites") {
                                // Custom content for "Filter By" using check boxes
                                Text("This will eventually be populated by places that are marked as favorite")
                            }
                            DisclosureGroupComponent(isExpanded: $isLibraryExpanded, title: "Travel Ideas") {
                                // Custom content for My Library
                                Text("This will be a section of different travel location ideas")
                                
                            }
                            DisclosureGroupComponent(isExpanded: $isPuzzlesExpanded, title: "Help") {
                                // Custom content for My Puzzles
                                Text("Help Section")
                                
                            }
                        }
                    }
                }
                .padding(.horizontal)
                .accentColor(.black)
            }
            .background(
                Image("Background") // Use your background image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all) // Make the background fill the entire screen
            )
            .navigationBarItems(leading: Button(action: {
                print("Settings tapped")
            }) {
                Image(systemName: "gearshape")
                    .foregroundColor(.primary) // Adapt to light and dark mode
            }, trailing: Button(action: {
                print("Edit tapped")
            }) {
                Image(systemName: "bell")
                    .foregroundColor(.primary) // Adapt to light and dark mode
            })
            .navigationBarTitle("Profile", displayMode: .inline)
        }
    }
}

struct CheckBox: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: isSelected ? "checkmark.square.fill" : "square")
                    .foregroundColor(isSelected ? .blue : .gray)
                Text(title)
            }
        }
        .foregroundColor(.black)
    }
}

struct DisclosureGroupComponent<Content: View>: View {
    @Binding var isExpanded: Bool
    let title: String
    @ViewBuilder var content: Content
    
    var body: some View {
        DisclosureGroup(title, isExpanded: $isExpanded) {
            content
                .padding()  // Padding for the content inside the disclosure group
                //.background(Color.white.opacity(0.9))  // Apply opacity directly to the content background
                .cornerRadius(8)  // Optional: round the corners of the content background
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 10) // Use RoundedRectangle for the outer shape
                .fill(Color.white.opacity(0.8)) // Fill the rounded rectangle with white and set the opacity
                .shadow(radius: 1) // Optional: add a slight shadow for depth
        )
        .overlay(
            RoundedRectangle(cornerRadius: 10) // Overlay a rounded rectangle for the border
                .stroke(Color.black, lineWidth: 1) // Black border with a 1-point line width
        )
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}
