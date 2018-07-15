//
//  Card.swift
//  Set
//
//  Created by Amber Spadafora on 7/14/18.
//  Copyright © 2018 Amber Spadafora. All rights reserved.
//

import Foundation

enum CardNumber: Int {
    case one
    case two
    case three
}

enum CardColor: Int {
    case one
    case two
    case three
}

enum CardSymbol: Int {
    case one
    case two
    case three
}

enum CardShading: Int {
    case one
    case two
    case three
}

struct Card {
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
