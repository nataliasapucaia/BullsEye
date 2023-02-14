//
//  ContentView.swift
//  Bullseye
//
//  Created by Natália Sapucaia on 06/02/23.
//

import SwiftUI

struct ContentView: View {

    @State private var alertIsVisible = false
    @State private var sliderValue = 50.0
    @State private var game = Game()

    var body: some View {
        ZStack {
            BackgroundView(game: $game)
                .edgesIgnoringSafeArea(.all)
            VStack {
                InstructionsView(game: $game).padding(.bottom, alertIsVisible ? 0 : 100.0)
                if alertIsVisible {
                    PointsView(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game)
                        .transition(.scale)
                } else {
                    HitMeButton(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game)
                        .transition(.scale)
                }
            }
            if !alertIsVisible {
                SliderView(sliderValue: $sliderValue)
                    .transition(.scale)
            }
        }
    }
}

struct InstructionsView: View {
    @Binding var game: Game

    var body: some View {
        VStack {
            InstructionText(text: "🎯🎯🎯\nPUT THE BULLSEYE AS CLOSE YOU CAN TO ")
                .padding(.leading, 30.0)
                .padding(.trailing, 30.0)
            BigNumberText(text: String(game.target))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .previewLayout(.fixed(width: 568, height: 320))
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 568, height: 320))
    }
}
