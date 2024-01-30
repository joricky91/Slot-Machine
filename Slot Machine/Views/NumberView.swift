//
//  NumberView.swift
//  Slot Machine
//
//  Created by Jonathan Ricky Sandjaja on 30/01/24.
//

import SwiftUI

struct NumberView: View {
    var title: String
    @Binding var coins: Int
    
    var body: some View {
        HStack {
            if title == "Your\nCoins" {
                Text(title.uppercased())
                    .scoreLabelStyle()
                    .multilineTextAlignment(.trailing)
                
                Text("\(coins)")
                    .scoreNumberStyle()
                    .modifier(ScoreNumberModifier())
            } else {
                Text("\(coins)")
                    .scoreNumberStyle()
                    .modifier(ScoreNumberModifier())
                
                Text(title.uppercased())
                    .scoreLabelStyle()
                    .multilineTextAlignment(.trailing)
            }
        }
        .modifier(ScoreContainerModifier())
    }
}

//#Preview {
//    NumberView()
//}
