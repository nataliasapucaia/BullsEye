//
//  LeaderboardView.swift
//  Bullseye
//
//  Created by Natália Sapucaia on 14/02/23.
//

import SwiftUI

struct LeaderboardView: View {
    @Binding var leaderboardIsShowing: Bool
    @Binding var game: Game

    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 10) {
                HeaderView(leaderboardIsShowing: $leaderboardIsShowing)
                LabelView()
                ScrollView {
                    VStack(spacing: 10) {
                        ForEach(game.leaderboardEntries.indices) { i in
                            let leaderboardEntries = game.leaderboardEntries[i]
                            RowView(index: i+1, score: leaderboardEntries.score, date: leaderboardEntries.date)
                        }
                    }
                }
            }
        }
    }
}

struct HeaderView: View {
    @Binding var leaderboardIsShowing: Bool
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass

    var body: some View {
        ZStack {
            HStack {
                if verticalSizeClass == .regular && horizontalSizeClass == .compact {
                    BigBoldText(text: "leaderboard")
                        .padding(.leading)
                    Spacer()
                } else {
                    BigBoldText(text: "leaderboard")

                }
            }
            .padding(.top)
            HStack {
                Spacer()
                Button {
                    leaderboardIsShowing = false
                } label: {
                    RoundedImageViewFilled(systemName: "xmark")
                        .padding(.trailing)
                }
            }
        }
    }
}

struct LabelView: View {
    var body: some View {
        HStack {
            Spacer()
                .frame(width: Constants.General.roundedViewLength)
            Spacer()
            LabelText(text: "Score")
                .frame(width: Constants.Leaderboard.leaderboardScoreColWidth)
            Spacer()
            LabelText(text: "Date")
                .frame(width: Constants.Leaderboard.leaderboardDateColWidth)
        }
        .padding(.leading)
        .padding(.trailing)
        .frame(maxWidth: Constants.Leaderboard.leaderboardRowMaxWidth)
    }
}

struct RowView: View {
    let index: Int
    let score: Int
    let date: Date

    var body: some View {
        HStack {
            RoundedTextView(text: String(index))
            Spacer()
            ScoreText(score: score)
            Spacer()
            DateText(date: date)
        }
        .background(
            RoundedRectangle(cornerRadius: .infinity)
                .stroke(Color("LeaderboardRowColor"), lineWidth: Constants.General.strokeWidth)
        )
        .padding(.leading)
        .padding(.trailing)
        .frame(maxWidth: Constants.Leaderboard.leaderboardRowMaxWidth)
    }
}

struct LeaderboardView_Previews: PreviewProvider {
    static private var game = Binding.constant(Game(loadTestData: true))

    static var previews: some View {
        LeaderboardView(leaderboardIsShowing: .constant(false), game: game)
        LeaderboardView(leaderboardIsShowing: .constant(true), game: game)
            .previewLayout(.fixed(width: 568, height: 320))
        LeaderboardView(leaderboardIsShowing: .constant(true), game: game)
            .preferredColorScheme(.dark)
        LeaderboardView(leaderboardIsShowing: .constant(true), game: game)
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 568, height: 320))
    }
}
