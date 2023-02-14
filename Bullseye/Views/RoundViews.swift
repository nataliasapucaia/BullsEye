//
//  RoundViews.swift
//  Bullseye
//
//  Created by Natália Sapucaia on 10/02/23.
//

import SwiftUI

struct RoundedImageViewStroked: View {
    var systemName: String

    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("TextColor"))
            .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
            .overlay(Circle().stroke(Color("ButtonStrokeColor"), lineWidth: 1.0))
        
    }
}

struct RoundedImageViewFilled: View {
    var systemName: String

    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
            .foregroundColor(Color("ButtonFilledColor"))
            .background(Circle().fill(Color("TextColor")))
    }
}

struct RoundRectTextView: View {
    var value: String

    var body: some View {
        Text(value)
            .font(.title3)
            .kerning(-0.2)
            .bold()
            .padding()
            .minimumScaleFactor(0.8)
            .frame(width: Constants.General.roundedViewWidth, height: Constants.General.roundedViewHeight)
            .overlay(
                RoundedRectangle(cornerRadius: Constants.General.roundRectCornerRadius)
                    .stroke(Color("ButtonStrokeColor"), lineWidth: Constants.General.strokeWidth)
                    .foregroundColor(Color.clear)
            )
    }
}

struct PreviewView: View {
    var body: some View {
        VStack(spacing: 10) {
            RoundedImageViewStroked(systemName: "arrow.counterclockwise")
            RoundedImageViewStroked(systemName: "list.dash")
            RoundedImageViewFilled(systemName: "list.dash")
            RoundRectTextView(value: "1235")
        }
    }
}

struct RoundViews_Previews: PreviewProvider {
    static var previews: some View {
        PreviewView()
        PreviewView()
            .preferredColorScheme(.dark)
    }
}
