//
//  ContentView.swift
//  PlayPop
//
//  Created by Émilio Williame on 26/10/2023.
//

import SwiftUI

struct FloatingButton: View {
    
    @State private var animateGradient = true
    
    var label: String
    
    struct CustomButtonAnimation: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .scaleEffect(configuration.isPressed ? 1.15 : 1)
                .animation(.bouncy(duration: 0.2, extraBounce: 0.2), value: configuration.isPressed)
        }
    }
    
    var body: some View {
        Button(action: {
            
        }, label: {
            ZStack {
                Capsule()
                    .frame(width: 200, height: 60)
                    .foregroundStyle(.ultraThinMaterial)
                    .overlay(
                        Capsule()
                            .stroke(LinearGradient(colors: [Color(.systemOrange), Color(.systemYellow)], startPoint: .leading, endPoint: .trailing), lineWidth: 3)
                )
                Text(label)
            }
            
        })
        .buttonStyle(CustomButtonAnimation())
    }
}

#Preview {
    FloatingButton(label: "Valider")
}
