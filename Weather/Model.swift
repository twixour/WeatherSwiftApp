//
//  Model.swift
//  Weather
//
//  Created by Raushan Kashyap on 14/06/24.
//

import Foundation

struct WeatherForecast: Codable {

    struct Weather: Codable {
        let description: String
        let main: String
    }
    let name: String?
    let weather: [Weather]
    
    let main: [String: Double]
    let wind: [String: Double]
    
}

