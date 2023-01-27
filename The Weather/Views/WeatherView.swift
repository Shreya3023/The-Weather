//
//  WeatherView.swift
//  The Weather
//
//  Created by Shreya Prasad on 01/12/22.
//

import SwiftUI

struct WeatherView: View {
    var weather : ResponseBody
    var body: some View {
        ZStack( alignment: .leading){
            
            VStack{
                VStack(alignment: .leading,spacing:  5){
                    Text(weather.name)
                        .bold().font(.title)
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                }
                .frame(maxWidth: .infinity,alignment: .leading)
                Spacer()
                VStack{
                    HStack{
                        VStack(spacing: 20){
                            Image(systemName: "sun.max")
                                .font(.system(size: 40))
                            Text(weather.weather[0].main)
                        }.frame(width: 150, alignment: .leading)
                        Spacer()
                        Text(weather.main.feelsLike.roundDouble() + "°")
                            .font(.system(size:100,weight: .bold))
                            .padding()
                    }
                    Spacer()
                        .frame(height: 80)
                    Spacer()
                }
                .frame(maxWidth: .infinity)
            }
            .padding()
            .frame(maxWidth: .infinity,alignment: .leading)
            VStack{
                Spacer()
                VStack(alignment: .leading, spacing: 20){
                    Text("Weather now")
                        .bold().padding(.bottom)
                    
                    HStack{
                        weatherRow(logo: "thermometer", name: "Min temp", value: (weather.main.tempMin.roundDouble() + "°"))
                        Spacer()
                        weatherRow(logo: "thermometer", name: "Max temp", value: (weather.main.tempMax.roundDouble() + "°"))
                    }
                    HStack{
                        weatherRow(logo: "wind", name: "Min temp", value: (weather.wind.speed.roundDouble() + "m/s"))
                        Spacer()
                        weatherRow(logo: "humidity", name: "Humidity", value: (weather.main.humidity.roundDouble() + "%"))
                    }
                }
                    
                    
                    .padding()
                    .padding(.bottom,20)
                    
                    .background(Color(hue: 0.60, saturation: 0.58, brightness: 0.4))
                    .background(Color(.white))
                    .cornerRadius (20)
                
            }
        }
            .edgesIgnoringSafeArea(.bottom)
            .background(Color(hue: 0.607, saturation: 0.527, brightness: 0.961))
            .preferredColorScheme(.dark)
        }
    
}
struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}
