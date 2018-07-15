//
//  Set.swift
//  Set
//
//  Created by Amber Spadafora on 7/14/18.
//  Copyright © 2018 Amber Spadafora. All rights reserved.
//

import Foundation

struct SetGame {
    var deck: [Card]
    var selectedCards: [Card]
    var matchedCards: [Card]
    var cardsInPlay: [Card?]
    
    init(){
        var deck: Set<Card> = []
        selectedCards = []
        matchedCards = []
        cardsInPlay = Array(repeating: nil, count: 24)
        
        for i in 0..<3 {
            guard let cardNumber = CardNumber(rawValue: i) else { break }
            for j in 0..<3 {
                guard let cardColor = CardColor(rawValue: j) else { break }
                for k in 0..<3 {
                    guard let cardSymbol = CardSymbol(rawValue: k) else { break }
                    for l in 0..<3 {
                        guard let cardShading = CardShading(rawValue: l) else { break }
                        let card = Card(number: cardNumber, color: cardColor, symbol: cardSymbol, shading: cardShading, isMatched: false)
                        deck.insert(card)
                    }
                }
            }
        }
        self.deck = Array(deck).shuffle()
    }
    
    mutating func dealCard(at index: Int) {
        if deck.count > 0 && index < cardsInPlay.count {
            let dealtCard = deck.remove(at: 0)
            let cardsInPlayContainsCard = cardsInPlay.contains(where: { (card) -> Bool in
                card == dealtCard
            })
            if !cardsInPlayContainsCard {
                cardsInPlay[index] = dealtCard
            }
        }
    }
    
    mutating func chooseCard(at index: Int) {
        guard let selectedCard = cardsInPlay[index] else { return }
        
        if selectedCards.count == 3 {
            if selectedCardsMakeASet(selectedCards: selectedCards) {
                for card in selectedCards {
                    if let indexOfMatchedCard = cardsInPlay.index(where: { (cardInPlay) -> Bool in
                        cardInPlay == card
                    }) {
                       cardsInPlay[indexOfMatchedCard] = nil
                        dealCard(at: indexOfMatchedCard)
                    }
                }
            }
            selectedCards.removeAll()
        }
        
        if selectedCards.contains(selectedCard) {
            guard let indexToBeRemoved = selectedCards.index(of: selectedCard) else { return }
            selectedCards.remove(at: indexToBeRemoved)
            return
        } else {
            selectedCards.append(selectedCard)
        }
    }
    
    func selectedCardsMakeASet(selectedCards: [Card]) -> Bool {
        guard selectedCards.count == 3 else { return false }
        let numbers = Set(selectedCards.map{$0.number.rawValue}).count
        let colors = Set(selectedCards.map{$0.color.rawValue}).count
        let symbols = Set(selectedCards.map{$0.symbol.rawValue}).count
        let shadings = Set(selectedCards.map{$0.shading.rawValue}).count
        print("numbers = \(numbers) \n colors = \(colors) \n symbols = \(symbols) \n \(shadings)")
        return numbers != 2 && colors != 2 && symbols != 2 && shadings != 2
    }
    
}

import GameKit

extension Array {
    func shuffle() -> [Element] {
        return GKRandomSource.sharedRandom().arrayByShufflingObjects(in: self) as! [Element]
    }
}
