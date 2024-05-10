import SwiftUI
import FirebaseStorage

struct TripDetailView: View {
    var trip: Trip
    
    @State private var selectedImages: [UIImage] = []
    @State private var showingImagePicker: Bool = false
    @State private var rating: Double = 5
    @State private var favoriteMemories: String = ""
    @State private var leastFavorite: String = ""

    var body: some View {
        ScrollView {
            VStack {
                imageCarousel

                detailSection(title: "Favorite Memories", content: $favoriteMemories)
                detailSection(title: "Notes", content: $leastFavorite)
                ratingSection
                imageAdditionSection
                uploadButton
            }
            .padding(.bottom, 100)
        }
        .background(Image("Background")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all))
        .navigationBarTitle(trip.title, displayMode: .inline)
        .onAppear {
            favoriteMemories = trip.detail
            leastFavorite = ""
        }
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker(selectedImages: $selectedImages)
        }
    }
    
    func uploadPhoto() {
        let storage = Storage.storage().reference()
        
        for (index, image) in selectedImages.enumerated() {
            guard let imageData = image.jpegData(compressionQuality: 0.8) else {
                print("Failed to convert image to data")
                continue
            }
            
            let imageRef = storage.child("images/\(UUID().uuidString).jpg")
            
            let uploadTask = imageRef.putData(imageData, metadata: nil) { metadata, error in
                if let error = error {
                    print("Error uploading image \(index): \(error.localizedDescription)")
                } else {
                    imageRef.downloadURL { url, error in
                        if let error = error {
                            print("Error getting download URL: \(error.localizedDescription)")
                        } else if let url = url {
                            print("Uploaded image \(index) successfully: \(url.absoluteString)")
                            // You can save the download URL to your database if needed
                        }
                    }
                }
            }
            
            uploadTask.observe(.progress) { snapshot in
                let percentComplete = Double(snapshot.progress?.completedUnitCount ?? 0) / Double(snapshot.progress?.totalUnitCount ?? 0)
                print("Upload progress for image \(index): \(percentComplete * 100)%")
            }
        }
    }
    
    private var imageCarousel: some View {
        TabView {
            Image(trip.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 300)
                .clipped()
                .tag(0)

            ForEach(selectedImages.indices, id: \.self) { index in
                Image(uiImage: selectedImages[index])
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 300)
                    .clipped()
                    .tag(index + 1)
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .frame(height: 300)
    }
    
    private func detailSection(title: String, content: Binding<String>) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.headline)
                .foregroundColor(.black)
            TextEditor(text: content)
                .frame(height: 200)
                .background(Color.white.opacity(0.9))
                .cornerRadius(10)
                .padding(.horizontal)
        }
        .padding()
    }
    
    private var ratingSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Rating")
                .font(.headline)
                .foregroundColor(.black)
            Slider(value: $rating, in: 1...10, step: 1)
                .accentColor(.blue)
            Text("Current Rating: \(Int(rating))/10")
                .foregroundColor(.black)
        }
        .padding()
        .background(Color.white.opacity(0.9))
        .cornerRadius(10)
        .padding(.horizontal)
    }
    
    private var imageAdditionSection: some View {
        Button(action: {
            showingImagePicker = true
        }) {
            Text("Add Images")
                .foregroundColor(.blue)
                .padding()
                .background(Color.white.opacity(0.9))
                .cornerRadius(10)
                .padding(.horizontal)
        }
    }
    
    private var uploadButton: some View {
        Button(action: {
            uploadPhoto()
        }) {
            Text("Upload Images")
                .foregroundColor(.white)
                .padding()
                .background(Color.blue)
                .cornerRadius(10)
                .padding(.horizontal)
        }
    }
}

struct TripDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TripDetailView(trip: Trip(title: "Sample Trip", imageName: "sampleImage", detail: "Details of a sample trip"))
    }
}
