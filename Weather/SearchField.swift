//
//  SearchField.swift
//  Weather
//
//  Created by Raushan Kashyap on 16/06/24.
//

import SwiftUI

// myKey is the key i have stored in a separate file which is the key you will get with api (open weather api)

// urlString is the link address
// also you will find the link for that as well, link's format will be like this "https://api.openweathermap.org/data/2.5/weather?&units=metric&q="


struct SearchField: View {
    @Binding var cityName: String
    @ObservedObject var myModelView: ModelView
    
    var body: some View {
        HStack {
            TextField("City Name", text: $cityName )
                .padding()
                .background(Color.white.opacity(0.5).cornerRadius(10))
                .foregroundStyle(.black)
                .font(.system(size: 23, weight: .bold, design: .rounded))
            Button(action: {
                // do all activity here
                myModelView.getWeatherData(tempUrlString: urlString, cityName: cityName, myKey: myKey)
            }) {
                Text("Search")
                    .textCase(.uppercase)
                    .padding()
                    .background(Color.white.cornerRadius(10))
                    .foregroundStyle(.black)
                    .font(.system(size: 17, weight: .bold, design: .rounded))
            }
        }
    }
}

#Preview {
    SearchField(cityName: .constant("Muzaffarpur"), myModelView: ModelView())
}
