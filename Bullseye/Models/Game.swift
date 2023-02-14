//
//  Game.swift
//  Bullseye
//
//  Created by Natália Sapucaia on 06/02/23.
//

import Foundation

struct Game {
    var target: Int = Int.random(in: 1...100)
    var score: Int = 0
    var round: Int = 1

    func points(sliderValue: Int) -> Int {
        let difference = abs(target - sliderValue)
        var bonus: Int
        if difference == 0 {
            bonus = 100
        } else if difference <= 2 && difference > 0{
            bonus = 50
        } else {
            bonus = 0
        }
        return 100 - difference + bonus
    }

    mutating func restart() {
        score = 0
        round = 1
        target = Int.random(in: 1...100)
    }

    mutating func startNewRound(points: Int) {
        score += points
        round += 1
        target = Int.random(in: 1...100)
    }
}
