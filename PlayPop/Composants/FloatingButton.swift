//
//  ContentView.swift
//  PlayPop
//
//  Created by Émilio Williame on 26/10/2023.
//

import SwiftUI

struct CustomButtonAnimation: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 1.15 : 1)
            .animation(.bouncy(duration: 0.2, extraBounce: 0.2), value: configuration.isPressed)
    }
}

struct FloatingButton: View {
    
    var label: String
    
    var body: some View {

            ZStack {
                RoundedRectangle(cornerRadius: 30)
                    .frame(width: 200, height: 60)
                    .foregroundStyle(.regularMaterial)
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(LinearGradient(colors: [Color(.systemOrange), Color(.systemYellow)], startPoint: .leading, endPoint: .trailing), lineWidth: 3)
                )
                Text(label)
            }
    }
}

#Preview {
    FloatingButton(label: "Valider")
}
