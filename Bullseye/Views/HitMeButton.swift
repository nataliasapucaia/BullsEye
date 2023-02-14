//
//  HitMeButton.swift
//  Bullseye
//
//  Created by Natália Sapucaia on 09/02/23.
//

import SwiftUI

struct HitMeButton: View {
    @Binding var alertIsVisible: Bool
    @Binding var sliderValue: Double
    @Binding var game: Game

    var body: some View {
        Button("HIT ME") {
            withAnimation {
                alertIsVisible = true
            }
        }
        .bold()
        .font(.title3)
        .padding(20.0)
        .background(
            ZStack {
                Color("ButtonColor")
                LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
            })
        .foregroundColor(.white)
        .cornerRadius(Constants.General.roundRectCornerRadius)
        .overlay(RoundedRectangle(cornerRadius: Constants.General.roundRectCornerRadius).stroke(Color.white, lineWidth: Constants.General.strokeWidth))
    }
}

struct HitMeButton_Previews: PreviewProvider {
    static var previews: some View {
        HitMeButton(alertIsVisible: .constant(true), sliderValue: .constant(50), game: .constant(Game()))
    }
}
