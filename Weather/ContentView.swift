//
//  ContentView.swift
//  Weather
//
//  Created by Raushan Kashyap on 14/06/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var myModelView: ModelView
    @State var cityName = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                SearchField(cityName: $cityName, myModelView: myModelView) 
                .padding([.trailing, .leading],10)
                
                if let weather = myModelView.weatherForecast {
                    WeatherDetailView(myModelView: myModelView, weather: weather)
                }
                else {
                    Text(myModelView.errorMessage)
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                        .foregroundStyle(.white)
                }
                Spacer()
            }
            .background(
                RadialGradient(
                        gradient: Gradient(colors: [.blue, .purple]),
                        center: .center,
                        startRadius: 20,
                        endRadius: 500
                    )
                    .edgesIgnoringSafeArea(.all)
            )
            .navigationTitle("Weather")
        }
    }
}


#Preview {
    ContentView(myModelView: ModelView(), cityName: "Muzaffarpur")
}
