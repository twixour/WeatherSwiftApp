//
//  SearchField.swift
//  Weather
//
//  Created by Raushan Kashyap on 16/06/24.
//

import SwiftUI

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
