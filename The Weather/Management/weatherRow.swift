//
//  weatherRow.swift
//  The Weather
//
//  Created by Shreya Prasad on 01/12/22.
//

import SwiftUI

struct weatherRow: View {
    var logo : String
    var name : String
    var value : String
    var body: some View {
        HStack(spacing: 20){
            Image(systemName: logo)
                .font(.title2)
                .frame(width: 20,height: 20)
                .padding()
                .background( Color(.gray))
                .cornerRadius(50)
            VStack(alignment: .leading, spacing: 8){
                Text(name)
                    .font(.caption)
                Text(value)
                    .bold()
                    .font(.title)
            }
        }
    }
}

struct weatherRow_Previews: PreviewProvider {
    static var previews: some View {
        weatherRow(logo: "thermometer", name: "feelsLike", value: "8°")
    }
}
