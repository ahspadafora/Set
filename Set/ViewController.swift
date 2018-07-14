//
//  ViewController.swift
//  Set
//
//  Created by Amber Spadafora on 7/14/18.
//  Copyright © 2018 Amber Spadafora. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var cardButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for button in cardButtons {
            button.backgroundColor = #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)
        }
        
    }
    
    @IBAction func didTapCard(_ sender: UIButton) {
        
    }
    


}

