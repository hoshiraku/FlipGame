//
//  Card.swift
//  Concentration
//
//  Created by hoshiraku on 14.06.18.
//  Copyright © 2018 hoshiraku. All rights reserved.
//

import Foundation

struct Card {
    
    var isFaceUpside = false
    var isMatched = false
    // TODO: add a property, if the card is previously mismatched...
    var isTappedOnceWithMissmatch = false
    var indentify: Int
    
    static var identifyNumberFactory : Int = 0
    
    static func getIdentifiedNumber() -> Int{
        Card.identifyNumberFactory += 1
        return Card.identifyNumberFactory
    }
    
    init(){
        self.indentify = Card.getIdentifiedNumber()
    }
    
}
