import SwiftUI

//Test


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
                    
                    
                    VStack {
                        NavigationLink(destination: FamilyView()) {
                            CatButton(title: "Favorites", imageName: "food")
                        }
                        NavigationLink(destination: FamilyView()) {
                            CatButton(title: "Recomendations", imageName: "attraction")
                        }
                        NavigationLink(destination: FamilyView()) {
                            CatButton(title: "Family", imageName: "family")
                        }
                        Spacer() // Pushes the button to the left
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




struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}
