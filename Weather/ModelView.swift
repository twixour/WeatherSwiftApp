//
//  ModelView.swift
//  Weather
//
//  Created by Raushan Kashyap on 14/06/24.
//

import Foundation
import SwiftUI

class ModelView: ObservableObject {
    @Published var weatherForecast: WeatherForecast?
    @Published var errorMessage = ""
    func getWeatherData(tempUrlString: String, cityName: String, myKey: String) {
        let urlString = tempUrlString + cityName + "&appId=\(myKey)"
        guard let url = URL(string: urlString) else {
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { (data,response, error) in
            if let data = data {
                let decoder = JSONDecoder()
                do {
                    let decodedData = try decoder.decode(WeatherForecast.self, from: data)
                    DispatchQueue.main.async {
                        self.weatherForecast = decodedData
                        self.errorMessage = ""
                    }
                }catch {
                    print("Printing from catch block")
                    DispatchQueue.main.async {
                        self.weatherForecast = nil
                        self.errorMessage = "Invalid City Name"
                    }
                }
            } else {
                self.errorMessage = "Invalid City Name"
            }
        }
        .resume()
    }
    
    var weatherImageName: String {
        switch weatherForecast?.weather.first?.main.lowercased() {
        case "clear":
            return "clear"
        case "clouds":
            return "clouds"
        case "rain":
            return "rain"
        case "snow":
            return "snow"
        case "thunderstorm":
            return "thunderstorm"
        case "haze":
            return "drizzle"
        default:
            return "default"
        }
    }
}
