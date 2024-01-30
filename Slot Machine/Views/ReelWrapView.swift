//
//  ReelWrapView.swift
//  Slot Machine
//
//  Created by Jonathan Ricky Sandjaja on 30/01/24.
//

import SwiftUI

struct ReelWrapView: View {
    @Binding var image: String
    
    var body: some View {
        ZStack {
            ReelView()
            
            Image(image)
                .resizable()
                .modifier(ImageModifier())
        }
    }
}

//#Preview {
//    ReelWrapView()
//}
