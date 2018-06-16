//
//  Concentration.swift
//  Concentration
//
//  Created by hoshiraku on 14.06.18.
//  Copyright © 2018 hoshiraku. All rights reserved.
//

import Foundation

class Concentration{
    
    var cards: Array<Card> = Array<Card>() // create an empty array
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int){
        
//        if cards[index].isFaceUpside == true{
//            cards[index].isFaceUpside = false
//        }else{
//            cards[index].isFaceUpside = true
//        }
        if !cards[index].isMatched {
            //if not matched, do nothing, just ignore
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index{
                //check if cards match
                if cards[matchIndex].indentify == cards[index].indentify{
                    //matched!
                    cards[index].isMatched = true
                    cards[matchIndex].isMatched = true
                }
                //if matched or not matched...
                cards[index].isFaceUpside = true
                //very important!!!!!
                indexOfOneAndOnlyFaceUpCard = nil
            }else{
                //either no card or 2 cards are faced up
                for flipDownIndex in cards.indices{
                    //all cards flip down!!!
                    cards[flipDownIndex].isFaceUpside = false
                }
                //set the only card faced up, and the index of the only card
                cards[index].isFaceUpside = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    //initilize the cards array with a pair number
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        // TODO: Shuffle the cards array....
    }
}
