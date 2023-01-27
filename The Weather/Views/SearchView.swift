//
//  SearchView.swift
//  The Weather
//
//  Created by Shreya Prasad on 06/12/22.
//

import SwiftUI
struct SearchView: View {
    @ObservedObject var weatherVM : WeatherViewModel
    init() {
        self.weatherVM = WeatherViewModel()
    }
    var body: some View {
        VStack{
            Text(" Search Location ")
                .font(.title)
                .padding()
                
                TextField("Enter city name", text: self.$weatherVM.cityName){
                    self.weatherVM.search()
                }
            Text("TEMP -\(self.weatherVM.temperature)°C")
            Text("Humidity -\(self.weatherVM.humidity)%")
            Spacer()
        }
        .padding()
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
