//
//  ViewController.swift
//  Set
//
//  Created by Amber Spadafora on 7/14/18.
//  Copyright © 2018 Amber Spadafora. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let cardColorsDict: [CardColor: UIColor] = [CardColor.one: #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1), CardColor.two: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1), CardColor.three: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)]
    
    @IBOutlet var cardButtons: [UIButton]!
    var game: SetGame = SetGame()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGame()
    }
    
    @IBAction func didTapCard(_ sender: UIButton) {
        if let indexOfTappedCard = cardButtons.index(of: sender) {
            game.chooseCard(at: indexOfTappedCard)
            updateUI()
        }
    }
    
    @IBAction func dealCardsButtonTapped(_ sender: UIButton) {
        for _ in 0..<3 {
            for index in game.cardsInPlay.indices {
                if game.cardsInPlay[index] == nil {
                    game.dealCard(at: index)
                    updateUI()
                    break
                }
            }
        }
    }
    
    @IBAction func restartButtonPressed(_ sender: UIButton) {
        game = SetGame()
        setupGame()
    }
    
    
    
    private func titleForCard(card: Card) -> NSAttributedString? {
        guard let cardColor = cardColorsDict[card.color] else { return nil }
        var alphaComponent: CGFloat = 1.0
        var strokeWidth: CGFloat = -1.0
        switch card.shading {
        case .one:
            strokeWidth = 4.0
        case .two:
            alphaComponent = 0.50
        default:
            break
        }
        var symbol: Character = Character("a")
        switch card.symbol {
        case .one:
            symbol = "■"
        case .two:
            symbol = "▲"
        case .three:
            symbol = "●"
        }
        let symbolString = String(repeating: symbol, count: card.number.rawValue + 1)
        let attributes: [NSAttributedStringKey: Any] = [
            NSAttributedStringKey.font : UIFont.systemFont(ofSize: 25),
            NSAttributedStringKey.strokeColor : cardColor,
            NSAttributedStringKey.foregroundColor : cardColor.withAlphaComponent(alphaComponent),
            NSAttributedStringKey.strokeWidth : strokeWidth,
            ]
        return NSAttributedString(string: symbolString, attributes: attributes)
    }
    
    private func updateUI(){
        for index in game.cardsInPlay.indices {
            cardButtons[index].backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            if let card = game.cardsInPlay[index] {
                let borderColor = game.selectedCards.contains(card) ? UIColor.black : UIColor.lightGray
                cardButtons[index].layer.borderColor = borderColor.cgColor
                cardButtons[index].layer.borderWidth = 2.0
                let attributedTitle = titleForCard(card: card)
                cardButtons[index].setAttributedTitle(attributedTitle, for: .normal)
            } else {
                cardButtons[index].layer.borderColor = UIColor.white.cgColor
                cardButtons[index].setAttributedTitle(nil, for: .normal)
            }
        }
    }
    
    private func setupGame(){
        for i in 0..<13 {
            game.dealCard(at: i)
            updateUI()
        }
    }
}

