import SwiftUI
struct SimpleImageView: View {
    var body: some View {
        Image("Background")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .edgesIgnoringSafeArea(.all)
    }
}

struct SimpleImageView_Previews: PreviewProvider {
    static var previews: some View {
        SimpleImageView()
    }
}
