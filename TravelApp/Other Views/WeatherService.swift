//
//  WeatherService.swift
//  TravelApp
//
//  Created by Kyle Fletcher on 4/25/24.
//

import SwiftUI

struct WeatherData: Codable {
    let main: WeatherMain
    let weather: [Weather]
}

struct WeatherMain: Codable {
    let temp: Double
}

struct Weather: Codable {
    let main: String
    let description: String
}


import Foundation

class WeatherService {
    func fetchWeather(forCity city: String, completion: @escaping (WeatherData?) -> Void) {
        let apiKey = "ef2e42b65c7abc5648a68a2e2fc0c4b1"
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)&units=imperial"  // Changed to imperial for Fahrenheit
        
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            let weatherResponse = try? JSONDecoder().decode(WeatherData.self, from: data)
            DispatchQueue.main.async {
                completion(weatherResponse)
            }
        }.resume()
    }
}



