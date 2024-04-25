import SwiftUI

struct CatButton: View {
    var title: String
    var imageName: String // This is the name of the image used as background

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            // Use an Image view for the background
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 350, height: 80)
                .cornerRadius(12)
                .clipped()
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.black, lineWidth: 3) // Adjust the stroke to be less prominent
                )
                .shadow(color: .gray, radius: 5, x: 0, y: 2)
                .padding(.top, 15)

            // Text label
            Text(title)
                .fontWeight(.bold)
                .foregroundColor(.white) // Change text color to white for better contrast
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 8, trailing: 0))
        }
    }
}

struct CatButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 10) {
            CatButton(title: "Food", imageName: "food")
            CatButton(title: "Attractions", imageName: "attraction")
            CatButton(title: "Night Life", imageName: "nightlife")
            CatButton(title: "Family", imageName: "family")
        }
        .padding()
    }
}
