//
//  WeatherService.swift
//  The Weather
//
//  Created by Shreya Prasad on 07/12/22.
//

import Foundation
class WeatherService{
    func getWeather(from city : String, completion :@escaping(Weather1?) -> ()){
        guard let url  = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=6d5065760b5927d9fe0eabdfc19c1f6e&units=metric") else{
            completion(nil)
            return
        }
        URLSession.shared.dataTask(with: url){ data , response, error in
            guard let data = data  , error == nil else{
                completion(nil)
                return
            }
            let responseData = try? JSONDecoder().decode(WeatherResponse1.self, from: data)
            if let weatherResponse = responseData{
                let weather = weatherResponse.main
                completion(weather)
            }
                else{
                    completion(nil)
                    return
                
            }
        }.resume()
    }
}
