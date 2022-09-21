//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Yu Yang on 9/9/22.
//

import Foundation


class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    private static let emojis = ["🚗", "🚛", "🚕", "🚜", "🚲",
                  "🛵", "🏍", "🚔", "🚍", "🚌",
                  "🚁", "💺", "🚀", "✈️", "🚇",
                  "🚦", "🚥", "🚏"]
    
    @Published private var model = MemoryGame(numberOfPairsOfCards: 4) { index in
        emojis[index]
    }
    
    var cards: [Card] {
        return model.cards
    }
    
    // MARK: -Intent(s)
    
    func choose(_ card: Card) {
        model.choose(card)
//        objectWillChange.send()
    }
}
