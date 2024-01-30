//
//  SlotViewModel.swift
//  Slot Machine
//
//  Created by Jonathan Ricky Sandjaja on 30/01/24.
//

import Foundation

class SlotViewModel: ObservableObject {
    
    @Published var showInfoView: Bool = false
    @Published var reels: Array = [0, 1, 2]
    @Published var highScore: Int = 0
    @Published var coins: Int = 100
    @Published var betAmount: Int = 10
    @Published var isActiveBet10: Bool = true
    @Published var isActiveBet20: Bool = false
    @Published var showingModal: Bool = false
    
    var symbols = ["gfx-bell", "gfx-cherry", "gfx-coin", "gfx-grape", "gfx-seven", "gfx-strawberry"]
    
    func spinReels() {
        reels = reels.map { _ in
            Int.random(in: 0...symbols.count - 1)
        }
    }
    
    func checkWinning() {
        if reels[0] == reels[1] && reels[1] == reels[2] && reels[0] == reels[2] {
            // PLAYER WINS
            playerWins()
            
            // NEW HIGH SCORE
            if coins > highScore {
                newHighScore()
            }
        } else {
            // PLAYER LOSES
            playerLoses()
        }
    }
    
    func playerWins() {
        coins += betAmount * 10
    }
    
    func newHighScore() {
        highScore = coins
    }
    
    func playerLoses() {
        coins -= betAmount
    }
    
    func activateBet20() {
        betAmount = 20
        isActiveBet20 = true
        isActiveBet10 = false
    }
    
    func activateBet10() {
        betAmount = 10
        isActiveBet10 = true
        isActiveBet20 = false
    }
    
    func isGameOver() {
        if coins <= 0 {
            showingModal = true
        }
    }
    
}
