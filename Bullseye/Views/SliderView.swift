//
//  SliderView.swift
//  Bullseye
//
//  Created by Natália Sapucaia on 09/02/23.
//

import SwiftUI

struct SliderLabelText: View {
    var text: String

    var body: some View {
        Text(text)
            .foregroundColor(Color("TextColor"))
            .bold()
            .frame(width: 38.0)
    }
}

struct SliderView: View {
    @Binding var sliderValue: Double
    
    var body: some View {
        HStack {
            SliderLabelText(text: "1")
            Slider(value: $sliderValue, in: 1.0...100.0)
            SliderLabelText(text: "100")
        }
        .padding()
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(sliderValue: .constant(50.0))
    }
}
