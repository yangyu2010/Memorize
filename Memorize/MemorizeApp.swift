//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Yu Yang on 9/5/22.
//

import SwiftUI

@main
struct MemorizeApp: App {
    private let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}
