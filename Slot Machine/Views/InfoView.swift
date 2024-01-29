//
//  InfoView.swift
//  Slot Machine
//
//  Created by Jonathan Ricky Sandjaja on 29/01/24.
//

import SwiftUI

struct InfoView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            LogoView()
            
            Spacer()
            
            Form {
                Section {
                    FormRowView(firstItem: "Application", secondItem: "Slot Machine")
                    
                    FormRowView(firstItem: "Platforms", secondItem: "iPhone, iPad, Mac")
                    
                    FormRowView(firstItem: "Developer", secondItem: "Jonathan Ricky Sandjaja")
                    
                    FormRowView(firstItem: "Designer", secondItem: "Robert Petras")
                    
                    FormRowView(firstItem: "Music", secondItem: "Dan Lebowitz")
                    
                    FormRowView(firstItem: "Website", secondItem: "swiftuimasterclass.com")
                    
                    FormRowView(firstItem: "Copyright", secondItem: "© 2024 All rights reserved.")
                    
                    FormRowView(firstItem: "Version", secondItem: "1.0.0")
                } header: {
                    Text("About the application")
                }
            }
            .font(.system(.body, design: .rounded))
        }
        .padding(.top, 40)
        .overlay(alignment: .topTrailing) {
            Button {
                dismiss()
            } label: {
                Image(systemName: "xmark.circle")
                    .font(.title)
            }
            .padding(.top, 30)
            .padding(.trailing, 20)
            .accentColor(.secondary)
        }
    }
}

struct FormRowView: View {
    var firstItem: String
    var secondItem: String
    
    var body: some View {
        HStack {
            Text(firstItem)
                .foregroundStyle(.gray)
            
            Spacer()
            
            Text(secondItem)
        }
    }
}

#Preview {
    InfoView()
}
