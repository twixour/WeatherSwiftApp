//
//  WeatherDetailView.swift
//  Weather
//
//  Created by Raushan Kashyap on 16/06/24.
//

import SwiftUI

struct WeatherDetailView: View {
    @ObservedObject var myModelView: ModelView
    let weather: WeatherForecast
    
    var body: some View {
        VStack {
            Image("\(myModelView.weatherImageName)")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300)
            Text("\(Int(weather.main["temp"] ?? 0)) °C")
                .foregroundStyle(.white)
                .font(.system(size: 46, weight: .bold, design: .rounded))
            Text("\(weather.name ?? "")")
                .foregroundStyle(.white)
                .font(.system(size: 38, weight: .bold, design: .rounded))
            Spacer()
            
            HStack(spacing: 20) {
                HStack {
                    Image("humidity")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 60)
                    VStack {
                        Text("\(Int(weather.main["humidity"] ?? 0)) %")
                        Text("Humidity")
                    }
                }
                Spacer()
                HStack {
                    VStack {
                        Text("\(Int(weather.wind["speed"] ?? 0)) km/hr")
                        Text("Wind Speed")
                    }
                    
                    Image("wind")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 60)
                }
            }
            .padding([.trailing, .leading], 12)
            .font(.system(size: 18, weight: .bold, design: .rounded))
            .foregroundStyle(.white)
        }
    }
}
#Preview {
    WeatherDetailView(myModelView: ModelView(), weather: WeatherForecast(name: "Sample City",
                                                                         weather: [WeatherForecast.Weather(description: "Clear", main: "Clear")],
                                                                         main: ["temp": 25.0, "humidity": 60],
                                                                         wind: ["speed": 10.0]) )
}
