//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Yu Yang on 9/5/22.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
