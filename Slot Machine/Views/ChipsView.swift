//
//  ChipsView.swift
//  Slot Machine
//
//  Created by Jonathan Ricky Sandjaja on 30/01/24.
//

import SwiftUI

struct ChipsView: View {
    @Binding var isActiveBet: Bool
    var text: String
    var tapAction: (() -> Void)
    
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            if text == "10" {
                Image("gfx-casino-chips")
                    .resizable()
                    .opacity(isActiveBet ? 1 : 0)
                    .modifier(CasinoChipsModifier())
                
                Button {
                    tapAction()
                } label: {
                    Text(text)
                        .fontWeight(.heavy)
                        .foregroundStyle(isActiveBet ? ColorHelper.yellow : .white)
                        .modifier(BetNumberModifier())
                }
                .modifier(BetCapsuleModifier())
            } else {
                Button {
                    tapAction()
                } label: {
                    Text(text)
                        .fontWeight(.heavy)
                        .foregroundStyle(isActiveBet ? ColorHelper.yellow : .white)
                        .modifier(BetNumberModifier())
                }
                .modifier(BetCapsuleModifier())
                
                Image("gfx-casino-chips")
                    .resizable()
                    .opacity(isActiveBet ? 1 : 0)
                    .modifier(CasinoChipsModifier())
            }
        }
    }
}

//#Preview {
//    ChipsView()
//}
