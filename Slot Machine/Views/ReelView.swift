//
//  ReelView.swift
//  Slot Machine
//
//  Created by Jonathan Ricky Sandjaja on 26/01/24.
//

import SwiftUI

struct ReelView: View {
    var body: some View {
        Image("gfx-reel")
            .resizable()
            .modifier(ImageModifier())
    }
}

#Preview {
    ReelView()
}
