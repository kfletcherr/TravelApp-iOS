import SwiftUI

struct Profile: View {
    @State private var locations: [String] = ["New York", "Orlando", "Las Vegas", "Paris", "Cozumel", "Houston", "Chicago"]
    @State private var weatherInfo: [String: WeatherData] = [:]
    @State private var showingAddCityView = false
    @State private var inDeletionMode = false
    
    private var weatherService = WeatherService()

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(locations, id: \.self) { location in
                        WeatherCard(location: location, weather: weatherInfo[location], inDeletionMode: $inDeletionMode) {
                            self.locations.removeAll { $0 == location }
                        }
                        .onAppear {
                            loadWeather(for: location)
                        }
                        .padding(.bottom, location == locations.last ? 50 : 0)
                    }
                }
                .padding()
            }
            .background(
                Image("Background")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
            )
            .navigationBarItems(leading: deleteButton, trailing: addButton)
            .navigationBarTitle("Weather", displayMode: .inline)
            .sheet(isPresented: $showingAddCityView) {
                AddCityView(locations: $locations, showing: $showingAddCityView)
            }
        }
    }

    private var deleteButton: some View {
        Button(action: {
            inDeletionMode.toggle()
        }) {
            Image(systemName: inDeletionMode ? "minus.circle.fill" : "minus.circle").foregroundColor(.primary)
        }
    }

    private var addButton: some View {
        Button(action: {
            showingAddCityView = true
        }) {
            Image(systemName: "plus").foregroundColor(.primary)
        }
    }

    func loadWeather(for location: String) {
        weatherService.fetchWeather(forCity: location) { weatherData in
            if let weatherData = weatherData {
                DispatchQueue.main.async {
                    weatherInfo[location] = weatherData
                }
            }
        }
    }
}

struct WeatherCard: View {
    var location: String
    var weather: WeatherData?
    @Binding var inDeletionMode: Bool
    var deleteAction: () -> Void

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(location).font(.title2)
                if let weather = weather {
                    HStack {
                        Image(systemName: "sun.max.fill") // Placeholder for weather condition icon
                        Text("\(Int(round(weather.main.temp)))°F - \(weather.weather.first?.main ?? "")")
                    }
                } else {
                    Text("Loading...").foregroundColor(.gray)
                }
            }
            Spacer()
            if inDeletionMode {
                Button(action: deleteAction) {
                    Image(systemName: "trash.fill")
                        .foregroundColor(.red)
                }
            }
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.8)))
        .shadow(radius: 5)
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}
