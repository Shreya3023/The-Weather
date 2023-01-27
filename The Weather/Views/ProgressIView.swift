//
//  ProgressIView.swift
//  The Weather
//
//  Created by Shreya Prasad on 28/11/22.
//

import SwiftUI

struct ProgressIView: View {
    var body: some View {
    ProgressView()
            .progressViewStyle(CircularProgressViewStyle(
                tint: .white))
            .frame(maxWidth: .infinity,maxHeight: .infinity)
    }
}

struct ProgressIView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressIView()
    }
}
