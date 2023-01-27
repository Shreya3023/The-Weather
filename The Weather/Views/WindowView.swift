//
//  WindowView.swift
//  The Weather
//
//  Created by Shreya Prasad on 28/11/22.
//

import SwiftUI
import CoreLocationUI

struct WindowView: View {
    @EnvironmentObject var locationManager : LocationManager
    var body: some View {
        VStack{
            VStack(spacing: 10){
                Text("Welcome to The Weather App")
                    .bold().font(.title)
                Text("Share your location")
                    .padding()

            }
            .multilineTextAlignment(.center)
            .padding()
            LocationButton(.shareCurrentLocation)
            {
                locationManager.requestLocation()
            }
            .cornerRadius(30)
            .symbolVariant(.fill)
            .foregroundColor(.white)
        }
        .frame(maxWidth:.infinity, maxHeight: .infinity )
    }
}

struct WindowView_Previews: PreviewProvider {
    static var previews: some View {
        WindowView()
    }
}
