//
//  LosePopupView.swift
//  Slot Machine
//
//  Created by Jonathan Ricky Sandjaja on 30/01/24.
//

import SwiftUI

struct LosePopupView: View {
    @Binding var showingModal: Bool
    @Binding var coins: Int
    
    var body: some View {
        ZStack {
            ColorHelper.blackTransparent
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                Text("GAME OVER")
                    .font(.system(.title, design: .rounded))
                    .fontWeight(.heavy)
                    .padding()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .background(ColorHelper.pink)
                    .foregroundStyle(.white)
                
                Spacer()
                
                VStack(alignment: .center, spacing: 16) {
                    Image("gfx-seven-reel")
                        .resizable()
                        .scaledToFit()
                        .frame(maxHeight: 72)
                    
                    Text("Bad luck! You lost all of the coins. \nLet's play again!")
                        .font(.system(.body, design: .rounded))
                        .lineLimit(2)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.gray)
                        .layoutPriority(1)
                    
                    Button {
                        showingModal = false
                        coins = 100
                    } label: {
                        Text("NEW GAME")
                            .font(.system(.body, design: .rounded))
                            .fontWeight(.semibold)
                            .accentColor(ColorHelper.pink)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 8)
                            .frame(minWidth: 128)
                            .background(
                                Capsule()
                                    .strokeBorder(lineWidth: 1.75)
                                    .foregroundStyle(ColorHelper.pink)
                            )
                    }
                }
                
                Spacer()
            }
            .frame(minWidth: 280, idealWidth: 280, maxWidth: 320, minHeight: 260, idealHeight: 280, maxHeight: 320, alignment: .center)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(color: ColorHelper.blackTransparent, radius: 6, x: 0, y: 8)
        }
    }
}

//#Preview {
//    LosePopupView()
//}
