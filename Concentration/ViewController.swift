//
//  ViewController.swift
//  Concentration
//
//  Created by hoshiraku on 11.06.18.
//  Copyright © 2018 hoshiraku. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var flipCount: Int = 0 {
        didSet { // if flipCount changed, then excute the code below
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }

    
    @IBOutlet var cardsCollection: [UIButton]!
    
    var emojiString : [String] = ["😬","😑","😞","🙃"]
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBAction func tapCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber: Int = cardsCollection.index(of: sender){
            print("Card Number is : \(cardNumber)")
            flipCard(withEmoji: emojiString[cardNumber], onButton: sender)
        }else{
            print("The selected card is not in the card set.")
        }
    }
    
    //flip a card
    //external name, internal name, type
    func flipCard(withEmoji emoji: String, onButton button: UIButton){
        print("flipCard withEmoji: \(emoji)")
        if button.currentTitle == emoji{
            button.setTitle("", for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1)
        }else{
            button.setTitle(emoji, for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
    
}

