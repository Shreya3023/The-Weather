//
//  WeatherModel.swift
//  The Weather
//
//  Created by Shreya Prasad on 07/12/22.
//

import Foundation
struct WeatherResponse1: Decodable{
    let main : Weather1
}
struct Weather1 : Decodable{
    var temp : Double?
    var humidity : Double?
}
