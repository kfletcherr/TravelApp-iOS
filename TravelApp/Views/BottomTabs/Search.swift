import SwiftUI

struct Search: View {
    @State private var search: String = ""
    
    var body: some View {
        NavigationView{
            ScrollView {
                VStack(spacing: 5) {
                    AuthTextField(input: $search, placeHolder: "Search")
                        .padding(EdgeInsets(top: 15, leading: 10, bottom: 0, trailing: 10))
                        .padding(.bottom, 10)
                    
                    VStack {
                        NavigationLink(destination: DestinationsView()) {
                            CatButton(title: "All Destinations", imageName: "destination")
                        }
                        NavigationLink(destination: BeachView()) {
                            CatButton(title: "Beach", imageName: "beach")
                        }
                        NavigationLink(destination: CampingView()) {
                            CatButton(title: "Camping", imageName: "camping")
                        }
                        NavigationLink(destination: RomanticView()) {
                            CatButton(title: "Romantic", imageName: "romantic")
                        }
                        NavigationLink(destination: FamilyView()) {
                            CatButton(title: "Family", imageName: "family")
                        }
                        NavigationLink(destination: CulturalView()) {
                            CatButton(title: "Cultural", imageName: "cultural")
                        }
                        Spacer() // Pushes the button to the left
                    }
                }
            }
            .navigationBarItems(leading: HStack {
                Button(action: {
                    print("Settings tapped")
                }) {
                    Image(systemName: "rectangle.grid.1x2.fill")
                        .foregroundColor(.primary)
                }
//                Button(action: {
//                    print("Additional icon tapped")
//                }) {
//                    Image(systemName: "rectangle.grid.2x2.fill")
//                        .foregroundColor(.primary)
//                }
            }, trailing: Button(action: {
                print("Edit tapped")
            }) {
                Image(systemName: "shuffle")
                    .foregroundColor(.primary)
            })
            .navigationBarTitle("Search", displayMode: .inline)
            .background(
                Image("Background")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
            )
        }
    }
}

struct Search_Previews: PreviewProvider {
    static var previews: some View {
        Search()
    }
}
