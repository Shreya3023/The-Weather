//
//  ContentView.swift
//  The Weather
//
//  Created by Shreya Prasad on 28/11/22.
//


import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather : ResponseBody?
  
    var body: some View {
        VStack{
            SearchView()
                .frame(maxWidth: 250,maxHeight: 250)
                
            Spacer()
            if let location = locationManager.location{
                if let weather = weather{
                    WeatherView(weather: weather)
                   
                    
                }
                    else{
                        ProgressIView()
                            .task {
                                do{
            try await weather = weatherManager.getCurrentWeather(latitude :location.latitude, longitude: location.longitude)
                                }
                                catch{
                                    print(" error while getting data \(error)")
                                }
                            }
                    }
                }
            
            else{
                if locationManager.isLoading{
                    ProgressIView()
                }
                else{
                    
                    WindowView()
                        .environmentObject(locationManager)
                }
            }
          
        }
        .background(Color(hue: 0.527, saturation: 0.718, brightness: 0.964))
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

