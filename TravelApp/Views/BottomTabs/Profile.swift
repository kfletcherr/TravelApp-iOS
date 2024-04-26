import SwiftUI

struct Profile: View {
    @State private var locations: [String] = ["New York", "Orlando", "Las Vegas", "Paris", "Cozumel", "Houston", "Chicago"]
    @State private var weatherInfo: [String: WeatherData] = [:]
    
    private var weatherService = WeatherService()

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    ImageInCircle(imgName: "profile")
                        .padding(.bottom, 30)

                    ForEach(locations, id: \.self) { location in
                        WeatherCard(location: location, weather: weatherInfo[location])
                            .onAppear {
                                loadWeather(for: location)
                            }
                            // Apply padding conditionally if the location is the last one in the array
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
            .navigationBarItems(leading: settingsButton, trailing: editButton)
            .navigationBarTitle("Weather", displayMode: .inline)
        }



    }

    private var settingsButton: some View {
        Button(action: {
            print("Settings tapped")
        }) {
            Image(systemName: "gearshape").foregroundColor(.primary)
        }
    }

    private var editButton: some View {
        Button(action: {
            print("Edit tapped")
        }) {
            Image(systemName: "bell").foregroundColor(.primary)
        }
    }

    func loadWeather(for location: String) {
        weatherService.fetchWeather(forCity: location) { weatherData in
            if let weatherData = weatherData {
                DispatchQueue.main.async {
                    self.weatherInfo[location] = weatherData
                }
            }
        }
    }
}

struct WeatherCard: View {
    var location: String
    var weather: WeatherData?

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
