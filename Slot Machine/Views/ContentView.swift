//
//  ContentView.swift
//  Slot Machine
//
//  Created by Jonathan Ricky Sandjaja on 26/01/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = SlotViewModel()
    
    var body: some View {
        ZStack {
            //MARK: - BACKGROUND
            LinearGradient(gradient: Gradient(colors: [ColorHelper.pink, ColorHelper.purple]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            //MARK: - INTERFACE
            VStack(alignment: .center, spacing: 5) {
                //MARK: - HEADER
                LogoView()
                
                Spacer()
                
                //MARK: - SCORE
                HStack {
                    NumberView(title: "Your\nCoins", coins: $viewModel.coins)
                    
                    Spacer()
                    
                    NumberView(title: "High\nScore", coins: $viewModel.highScore)
                }
                
                //MARK: - SLOT MACHINE
                VStack(alignment: .center, spacing: 0) {
                    ReelWrapView(image: $viewModel.symbols[viewModel.reels[0]])
                    
                    HStack(alignment: .center, spacing: 0) {
                        ReelWrapView(image: $viewModel.symbols[viewModel.reels[1]])
                        
                        Spacer()
                        
                        ReelWrapView(image: $viewModel.symbols[viewModel.reels[2]])
                    }
                    .frame(maxWidth: 500)
                    
                    Button {
                        viewModel.spinReels()
                        viewModel.checkWinning()
                        viewModel.isGameOver()
                    } label: {
                        Image("gfx-spin")
                            .renderingMode(.original)
                            .resizable()
                            .modifier(ImageModifier())
                    }
                }
                .layoutPriority(2)
                
                //MARK: - FOOTER
                Spacer()
                
                HStack {
                    ChipsView(isActiveBet: $viewModel.isActiveBet20, text: "20") {
                        viewModel.activateBet20()
                    }
                    
                    ChipsView(isActiveBet: $viewModel.isActiveBet10, text: "10") {
                        viewModel.activateBet10()
                    }
                }
            }
            //MARK: - BUTTONS
            .overlay(alignment: .topLeading) {
                Button {
                    print("Reset the game")
                } label: {
                    Image(systemName: "arrow.2.circlepath.circle")
                }
                .modifier(ButtonModifier())
            }
            .overlay(alignment: .topTrailing) {
                Button {
                    viewModel.showInfoView = true
                } label: {
                    Image(systemName: "info.circle")
                }
                .modifier(ButtonModifier())
            }
            .padding()
            .frame(maxWidth: 720)
            .blur(radius: $viewModel.showingModal.wrappedValue ? 5 : 0, opaque: false)
            
            //MARK: - POPUP
            if $viewModel.showingModal.wrappedValue {
                LosePopupView(showingModal: $viewModel.showingModal, coins: $viewModel.coins)
            }
        }
        .sheet(isPresented: $viewModel.showInfoView) {
            InfoView()
        }
    }
}

#Preview {
    ContentView()
}
