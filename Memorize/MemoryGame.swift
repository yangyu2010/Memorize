//
//  MemoryGame.swift
//  Memorize
//
//  Created by Yu Yang on 9/9/22.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: [Card]
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int?
    
    mutating func choose(_ card: Card) {
        /// 找到当前点击的卡牌
        /// 卡牌必须没有匹配成功 卡牌必须没有翻起来
        guard let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
            cards[chosenIndex].isFaceUp == false,
            cards[chosenIndex].isMatched == false else { return  }

        if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
            if cards[potentialMatchIndex].content == cards[chosenIndex].content {
                cards[potentialMatchIndex].isMatched = true
                cards[chosenIndex].isMatched = true
            } else {
                indexOfTheOneAndOnlyFaceUpCard = nil
            }
        } else {
            for index in cards.indices {
                cards[index].isFaceUp = false
            }
            indexOfTheOneAndOnlyFaceUpCard = chosenIndex
        }
        
        cards[chosenIndex].isFaceUp.toggle()
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = [Card]()
        
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        
        var id: Int
    }
}
