//
//  BullseyeTests.swift
//  BullseyeTests
//
//  Created by Natália Sapucaia on 06/02/23.
//

import XCTest
@testable import Bullseye

final class BullseyeTests: XCTestCase {

    var game: Game!

    override func setUpWithError() throws {
        game = Game()
    }

    override func tearDownWithError() throws {
        game = nil
    }

    func testScorePositive() {
        let guess = game.target + 5
        let score = game.points(sliderValue: guess)

        XCTAssertEqual(score, 95)
    }

    func testScoreNegative() {
        let guess = game.target - 5
        let score = game.points(sliderValue: guess)

        XCTAssertEqual(score, 95)
    }

    func testScoreExact() {
        let guess = game.target
        let score = game.points(sliderValue: guess)

        XCTAssertEqual(score, 200)
    }

    func testScoreClose() {
        let guess = game.target + 2
        let score = game.points(sliderValue: guess)

        XCTAssertEqual(score, 98 + 50)
    }

    func testNewRound() {
        //When
        game.startNewRound(points: 100)

        //Then
        XCTAssertEqual(game.score, 100)
        XCTAssertEqual(game.round, 2)
    }

    func testReset() {
        //When
        game.startNewRound(points: 100)
        XCTAssertNotEqual(game.score, 0)
        XCTAssertNotEqual(game.round, 1)

        game.restart()
        //Then
        XCTAssertEqual(game.score, 0)
        XCTAssertEqual(game.round, 1)
    }

}
