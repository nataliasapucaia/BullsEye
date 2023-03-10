//
//  TextViews.swift
//  Bullseye
//
//  Created by Natália Sapucaia on 09/02/23.
//

import SwiftUI

struct InstructionText: View {
    var text: String

    var body: some View {
        Text(text.uppercased())
            .foregroundColor(Color("TextColor"))
            .bold()
            .kerning(2.0)
            .multilineTextAlignment(.center)
            .lineSpacing(4.0)
            .font(.footnote)
    }
}

struct BigNumberText: View {
    var text: String

    var body: some View {
        Text(text)
            .foregroundColor(Color("TextColor"))
            .kerning(-1.0)
            .bold()
            .font(.largeTitle)
            .fontWeight(.black)
    }
}

struct LabelText: View {
    var text: String

    var body: some View {
        Text(text.uppercased())
            .foregroundColor(Color("TextColor"))
            .kerning(1.5)
            .bold()
            .font(.caption)
    }
}

struct BodyText: View {
    var text: String

    var body: some View {
        Text(text)
            .font(.subheadline)
            .fontWeight(.semibold)
            .multilineTextAlignment(.center)
            .lineSpacing(12.0)
    }
}

struct ButtonText: View {
    var text: String

    var body: some View {
        Text(text.capitalized)
            .font(.body)
            .bold()
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.accentColor)
            .foregroundColor(Color.white)
            .cornerRadius(12.0)
    }
}

struct ScoreText: View {
    var score: Int

    var body: some View {
        Text(String(score))
            .foregroundColor(Color("TextColor"))
            .font(.title3)
            .bold()
            .kerning(-0.2)
            .multilineTextAlignment(.center)
            .frame(width: Constants.Leaderboard.leaderboardScoreColWidth)
    }
}

struct BigBoldText: View {
    var text: String

    var body: some View {
        Text(text.uppercased())
            .foregroundColor(Color("TextColor"))
            .font(.title)
            .fontWeight(.black)
            .kerning(2.0)
            .multilineTextAlignment(.center)

    }
}

struct DateText: View {
    var date: Date

    var body: some View {
        Text(date, style: .time)
            .foregroundColor(Color("TextColor"))
            .font(.title3)
            .bold()
            .kerning(-0.2)
            .multilineTextAlignment(.center)
            .frame(width: Constants.Leaderboard.leaderboardDateColWidth)
    }
}

struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            InstructionText(text: "Instruction")
            BigNumberText(text: "999")
            LabelText(text: "score".uppercased())
            BodyText(text: "You scored 200 points\n🎉🎉🎉")
            ButtonText(text: "Start new round")
            ScoreText(score: 2389)
            DateText(date: Date())
            BigBoldText(text: "Leaderboard")
        }
        .padding()
    }
}
