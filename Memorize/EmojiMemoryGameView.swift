//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Yu Yang on 9/5/22.
//

import SwiftUI

struct EmojiMemoryGameView: View {

    @ObservedObject var game: EmojiMemoryGame
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                ForEach(game.cards) { card in
                    CardView(card: card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            game.choose(card)
                        }
                }
            }
//            .padding(.horizontal)
        }
        .foregroundColor(.red)
        .font(.largeTitle)
    }
}

struct CardView: View {
    let card: EmojiMemoryGame.Card
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            } else if card.isMatched {
                shape.opacity(0)
            } else {
                shape.fill()
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        EmojiMemoryGameView(game: game)
            .previewDevice("iPhone 12 mini")
            .preferredColorScheme(.dark)
        EmojiMemoryGameView(game: game)
            .previewDevice("iPhone 11")
            .preferredColorScheme(.light)
        EmojiMemoryGameView(game: game)
            .previewDevice("iPhone 8")
            .preferredColorScheme(.light)
    }
}
