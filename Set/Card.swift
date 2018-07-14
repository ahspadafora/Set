//
//  Card.swift
//  Set
//
//  Created by Amber Spadafora on 7/14/18.
//  Copyright © 2018 Amber Spadafora. All rights reserved.
//

import Foundation

struct Card {
    enum CardNumber: Int {
        case one
        case two
        case three
    }
    
    enum CardColor: String {
        case red
        case green
        case purple
    }
    
    enum CardSymbol: String {
        case diamond
        case squiggle
        case oval
    }
    
    enum CardShading: String {
        case solid
        case striped
        case open
    }
    
    var number: CardNumber
    var color: CardColor
    var symbol: CardSymbol
    var shading: CardShading
    
    var isMatched: Bool
}

extension Card: Hashable {
    var hashValue: Int {
        return number.hashValue + color.hashValue + symbol.hashValue + shading.hashValue
    }
    
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.number == rhs.number &&
            lhs.color == rhs.color &&
            lhs.symbol == rhs.symbol &&
            lhs.shading == rhs.shading
    }
    
    
}
