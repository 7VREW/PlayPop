//
//  ContentView.swift
//  PlayPop
//
//  Created by Émilio Williame on 26/10/2023.
//

import SwiftUI

struct FloatingButton: View {
    
    struct CustomButtonAnimation: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .scaleEffect(configuration.isPressed ? 1.2 : 1)
                .animation(.bouncy(duration: 0.2, extraBounce: 0.2), value: configuration.isPressed)
        }
    }
    
    var body: some View {
        Button(action: {
            
        }, label: {
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
        })
        .buttonStyle(CustomButtonAnimation())
    }
}

#Preview {
    FloatingButton()
}
