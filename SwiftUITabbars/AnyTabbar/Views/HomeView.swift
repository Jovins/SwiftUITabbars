//
//  HomeView.swift
//  SwiftUI-Tabbar
//
//  Created by Jovins on 2021/7/26.
//

import SwiftUI

struct Weather: Identifiable {
    
    var id = UUID()
    var image: String
    var temp: Int
    var city: String
}

struct HomeView: View {
    
    let modelData: [Weather] = [Weather(image: "cloud.rain", temp: 21, city: "Amsterdam"),
                                Weather(image: "cloud.sun.rain", temp: 18, city: "London"),
                                Weather(image: "sun.max", temp: 25, city: "Paris"),
                                Weather(image: "cloud.sun", temp: 23, city: "Tokyo"),
                                Weather(image: "cloud.rain", temp: 21, city: "Amsterdam"),
                                Weather(image: "cloud.sun.rain", temp: 18, city: "London"),
                                Weather(image: "sun.max", temp: 25, city: "Paris"),
                                Weather(image: "cloud.sun", temp: 23, city: "Tokyo"),
                                Weather(image: "cloud.rain", temp: 21, city: "Amsterdam"),
                                Weather(image: "cloud.sun.rain", temp: 18, city: "London"),
                                Weather(image: "sun.max", temp: 25, city: "Paris"),
                                Weather(image: "cloud.sun", temp: 23, city: "Tokyo")]
    
    var body: some View {
        
        NavigationView() {
            List(self.modelData) { weather in
                NavigationLink(destination: Text(weather.city).font(.largeTitle)) {
                    WeatherCell(weather: weather)
                }
            }
            .navigationBarTitle(Text("首页"))
        }
    }
    
}

#if DEBUG
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
#endif

struct WeatherCell: View {
    
    let weather: Weather
    init(weather: Weather) {
        self.weather = weather
    }
    
    var body: some View {
        HStack {
            Image(systemName: self.weather.image)
                .frame(width: 50, height: 12, alignment: .leading)
            VStack(alignment: .leading) {
                Text(self.weather.city)
                    .font(.headline)
                    .foregroundColor(.blue)
                Text("Temp: \(self.weather.temp)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .font(.title)
        }
    }
}
