//
//  ContentView.swift
//  PlayPop
//
//  Created by Émilio Williame on 26/10/2023.
//

import SwiftUI

struct FloatingButton: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .frame(width: 200, height: 60)
                .foregroundStyle(.regularMaterial)
                .overlay(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(LinearGradient(colors: [Color(.systemOrange), Color(.systemYellow)], startPoint: .leading, endPoint: .trailing), lineWidth: 3)
            )
            Text("Valider")
        }
    }
}

#Preview {
    FloatingButton()
}
