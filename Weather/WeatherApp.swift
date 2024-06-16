//
//  WeatherApp.swift
//  Weather
//
//  Created by Raushan Kashyap on 14/06/24.
//

import SwiftUI

@main
struct WeatherApp: App {
    @StateObject var mView = ModelView()
    var body: some Scene {
        WindowGroup {
            ContentView(myModelView: mView)
        }
    }
}
