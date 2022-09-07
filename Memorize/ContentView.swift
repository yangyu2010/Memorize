//
//  ContentView.swift
//  Memorize
//
//  Created by Yu Yang on 9/5/22.
//

import SwiftUI

struct ContentView: View {

    let emojis = ["🚗", "🚕", "🚜", "🚲", "🛵", "🏍", "🚔", "🚍", "🚌", "🚁", "💺", "🚀", "✈️", "🚇", "🚦", "🚥", "🚏"]
    @State var emojisCount = 6
    
    var body: some View {
        VStack {
            HStack() {
                ForEach(emojis[0..<emojisCount], id: \.self) { emoji in
                    CardView(content: emoji)
                }
            }
            .foregroundColor(.red)
            HStack {
                minus
                Spacer()
                plus
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding()
    }
    
    var minus: some View {
        Button {
            if emojisCount > 1 {
                emojisCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
        }
    }
    
    var plus: some View {
        Button {
            if emojisCount < emojis.count {
                emojisCount += 1
            }
        } label: {
            Image(systemName: "plus.circle")
        }
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp = true
    
    var body: some View {
        ZStack(alignment: .center) {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.stroke(lineWidth: 3)
                Text(content)
                    .font(.largeTitle)
            } else {
                shape
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 12 mini")
            .preferredColorScheme(.dark)
        ContentView()
            .previewDevice("iPhone 11")
            .preferredColorScheme(.light)
        ContentView()
            .previewDevice("iPhone 8")
            .preferredColorScheme(.light)
    }
}
