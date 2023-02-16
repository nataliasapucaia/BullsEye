//
//  BackgroundView.swift
//  Bullseye
//
//  Created by Natália Sapucaia on 10/02/23.
//

import SwiftUI

struct BackgroundView: View {
    @Binding var game: Game

    var body: some View {
        VStack {
            TopView(game: $game)
            Spacer()
            BottomView(game: $game)
        }
        .padding()
        .background(RingsView())
    }
}

struct TopView: View {
    @Binding var game: Game
    @State private var leaderboardIsShowing = false

    var body: some View {
        HStack {
            Button {
                game.restart()
            } label: {
                RoundedImageViewStroked(systemName: "arrow.counterclockwise")
            }
            Spacer()
            Button {
                leaderboardIsShowing = true
            } label: {
                RoundedImageViewFilled(systemName: "list.dash")
            }.sheet(isPresented: $leaderboardIsShowing) {
                LeaderboardView(leaderboardIsShowing: $leaderboardIsShowing, game: $game)
            }
        }
    }
}

struct BottomView: View {
    @Binding var game: Game

    var body: some View {
        HStack {
            NumberView(title: "Score", value: String(game.score))
            Spacer()
            NumberView(title: "round", value: String(game.round))
        }
    }
}

struct NumberView: View {
    var title: String
    var value: String

    var body: some View {
        VStack(spacing: 5) {
            LabelText(text: title)
            RoundRectTextView(value: value)
        }
    }
}

struct RingsView: View {

    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        ZStack {
            Color("BackgroundColor").edgesIgnoringSafeArea(.all)
            ForEach(1..<6) { ring in
                let opacity = colorScheme == .dark ? 0.1 : 0.3
                let size = CGFloat(ring * 100)
                Circle()
                    .stroke(lineWidth: 20.0)
                    .fill(
                        RadialGradient(colors: [Color("RingsColor").opacity(0.8 * opacity), Color("RingsColor").opacity(0)],
                                       center: .center,
                                       startRadius: 100,
                                       endRadius: 300)
                    )
                    .frame(width: size, height: size)
            }
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(game: .constant(Game()))
    }
}
