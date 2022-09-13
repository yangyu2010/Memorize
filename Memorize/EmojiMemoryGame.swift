//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Yu Yang on 9/9/22.
//

import Foundation


class EmojiMemoryGame: ObservableObject {
    private static let emojis = ["🚗", "🚛", "🚕", "🚜", "🚲",
                  "🛵", "🏍", "🚔", "🚍", "🚌",
                  "🚁", "💺", "🚀", "✈️", "🚇",
                  "🚦", "🚥", "🚏"]
    
    @Published private var model = MemoryGame(numberOfPairsOfCards: 4) { index in
        emojis[index]
    }
    
    var cards: [MemoryGame<String>.Card] {
        return model.cards
    }
    
    // MARK: -Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
//        objectWillChange.send()
    }
}
