//
//  WeatherViewModel.swift
//  The Weather
//
//  Created by Shreya Prasad on 08/12/22.
//

import Foundation
import Combine
class WeatherViewModel: ObservableObject{
    @Published var weather = Weather1()
    private var weatherService : WeatherService!
    init() {
        self.weatherService = WeatherService()
        
    }
    var temperature : String{
        if let temp = self.weather.temp{
            return String(format: "%0.f", temp)
        }
        else{
            return ""
        }
    }
    var humidity : String{
        if let hum = self.weather.humidity{
            return String(format: "%0.f", hum)
        }
        else{
            return ""
        }
    }
    var cityName : String = ""
    func search(){
        if let city = self.cityName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed){
            fetchWeather(by: city)
        }
    }
    private func fetchWeather(by city : String){
        self.weatherService.getWeather(from : city){ weather in
            if let weatherData = weather{
                DispatchQueue.main.async {
                    self.weather = weatherData
                }
                
            }
            
        }
    }
}
