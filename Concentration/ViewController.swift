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
    
    //add flip number
    var flipCount: Int = 0 {
        didSet { // if flipCount changed, then excute the code below
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    //add game score
    var gameScore: Int = 0 {
        didSet{
            gameScoreLabel.text = "Score: \(gameScore)"
        }
    }

    lazy var game: Concentration = Concentration(numberOfPairsOfCards: (cardsCollection.count + 1) / 2)
    
    @IBOutlet var cardsCollection: [UIButton]!
    
    var emojiString : [String] = ["😬","😑","😞","🙃"]
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet weak var gameScoreLabel: UILabel!
    
    @IBAction func tapCard(_ sender: UIButton) {
        //flipCount += 1
        if let cardNumber: Int = cardsCollection.index(of: sender){
            print("Card Number is : \(cardNumber)")
            game.chooseCard(at: cardNumber)
            gameScore = game.gameScorePoint
            flipCount = game.flipCardCount
            //flipCard(withEmoji: emojiString[cardNumber], onButton: sender)
            //every time chose a card, the view need to be updated from model
            updateViewFromModel()
            
        }else{
            print("The selected card is not in the card set.")
        }
    }
    
    @IBAction func beginNewGame(_ sender: UIButton) {
        // how to begin a new game?...
        flipCount = 0
        gameScore = 0
        game = Concentration(numberOfPairsOfCards: (cardsCollection.count + 1) / 2)
        //print(emojiChoices)
        originalEmojiChoices = getOneEmojiChoice()
        emojiChoices = originalEmojiChoices
        updateViewFromModel()
    }
    
    func updateViewFromModel(){
        
        for index in 0..<cardsCollection.count{
            let button = cardsCollection[index]
            let card = game.cards[index]
            if card.isFaceUpside == true {
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }else{
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ?  #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 0) : #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1)
            }
        }
        
    }
    
    //begin a new game
//    func updateViewFromModelForNewGame() {
//        //...
//    }
    
    var originalEmojiChoices = ["😑", "😬", "😆", "🙂", "😐", "😯","😦", "😉", "☺️", "🤤", "😴", "😠"]
    
    var emojiChoices = ["😑", "😬", "😆", "🙂", "😐", "😯","😦", "😉", "☺️", "🤤", "😴", "😠"]
    
    // TODO: add theme...
    var emojiChoicesFace = ["😑", "😬", "😆", "🙂", "😐", "😯","😦", "😉", "☺️", "🤤", "😴", "😠"]
    var emojiChoicesGesture = ["🤞", "✌️", "☝️", "👆", "🖕", "🤘", "👍", "🤙", "✋", "🤚", "✊", "👐"]
    var emojiChoicesLove = ["💑", "👩‍❤️‍👩", "👨‍❤️‍👨", "💏", "👩‍❤️‍💋‍👩", "👨‍❤️‍💋‍👨", "👪", "👨‍👩‍👧", "👨‍👩‍👧‍👦", "👨‍👩‍👦‍👦", "👨‍👩‍👧‍👧", "👨‍👨‍👦", "👩‍👩‍👧", "👩‍👩‍👦", "👨‍👨‍👧"]
    var emojiChoicesAnimal = ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐯", "🦁", "🐮", "🐷", "🐧", "🐤", "🦆", "🦅", "🦇"]
    var emojiChoicesFood = ["🍏", "🍊", "🍋", "🍒", "🍑", "🍍", "🥝", "🌶", "🍅", "🍆", "🌽", "🌭", "🥓", "🍙", "🍘"]
    var emojiChoicesActivity = ["⚽️", "🏀", "🏈", "⚾️", "🎾", "🏐", "🎱", "🎿", "🎹", "🎮", "🎤", "🎬", "🎨", "🎻", "🎸"]
    var emojiChoicesTravel = ["🚗", "🚎", "🚲", "🛵", "🚠", "🚄", "✈️", "🛳", "🎡", "🎢", "🎠", "⛱", "🏠", "🏘", "⛩"]
    var emojiChoicesObjects = ["⌚️", "📱", "💻", "🖥", "🕹", "🖲", "💽", "📀", "🎥", "📹", "🎙", "⏱", "🔫", "🛡", "⚔️"]
    
    
    var emoji : Dictionary<Int, String> = [Int: String]()
    
    var emojiChoicesCollection: Array<Array<String>> = []
    
    //get a random theme
    func getOneEmojiChoice() -> Array<String>{
        emojiChoicesCollection.append(emojiChoicesFace)
        emojiChoicesCollection.append(emojiChoicesGesture)
        emojiChoicesCollection.append(emojiChoicesLove)
        emojiChoicesCollection.append(emojiChoicesAnimal)
        emojiChoicesCollection.append(emojiChoicesFood)
        emojiChoicesCollection.append(emojiChoicesActivity)
        emojiChoicesCollection.append(emojiChoicesTravel)
        emojiChoicesCollection.append(emojiChoicesObjects)
        let randomChoiceIndex = Int(arc4random_uniform(UInt32(emojiChoicesCollection.count)))
        //originalEmojiChoices = emojiChoicesCollection[randomChoiceIndex]
        //emojiChoices = emojiChoicesCollection[randomChoiceIndex]
        return emojiChoicesCollection[randomChoiceIndex]
    }
    
    func emoji(for card: Card) -> String{
        if emoji[card.indentify] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.indentify] = emojiChoices.remove(at: randomIndex)
        }
        
        return emoji[card.indentify] ?? "?"
        
    }
    
    //flip a card
    //external name, internal name, type
//    func flipCard(withEmoji emoji: String, onButton button: UIButton){
//        print("flipCard withEmoji: \(emoji)")
//        if button.currentTitle == emoji{
//            button.setTitle("", for: UIControlState.normal)
//            button.backgroundColor = #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1)
//        }else{
//            button.setTitle(emoji, for: UIControlState.normal)
//            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
//        }
//    }
    
}

