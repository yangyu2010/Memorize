//
//  MemoryGame.swift
//  Memorize
//
//  Created by Yu Yang on 9/9/22.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: [Card]
//    private var indexOfTheOneAndOnlyFaceUpCard: Int? {
//        get {
//            var array = [Int]()
//            for index in cards.indices {
//                if cards[index].isFaceUp {
//                    array.append(index)
//                }
//            }
//            if array.count == 1 {
//                return array.first
//            } else {
//                return nil
//            }
//        }
//
//        set {
//            for index in cards.indices {
//                cards[index].isFaceUp = index == newValue
//            }
//        }
//    }
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get { cards.indices.filter({ cards[$0].isFaceUp}).oneAndOnly }
        set { cards.indices.forEach { cards[$0].isFaceUp = ($0 == newValue) }}
    }
    
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
            }
            cards[chosenIndex].isFaceUp = true
        } else {
            indexOfTheOneAndOnlyFaceUpCard = chosenIndex
        }
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
        var isFaceUp = false
        var isMatched = false
        let content: CardContent
        let id: Int
    }
}


extension Array {
    var oneAndOnly: Element? { count == 1 ? first : nil }
}
