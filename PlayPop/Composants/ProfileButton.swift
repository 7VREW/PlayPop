//
//  ProfileButton.swift
//  PlayPop
//
//  Created by Apprenant 44 on 27/10/2023.
//

import SwiftUI

struct ProfileButton: View {
    
    var body: some View {
        
        // Lien vers le profilte
        NavigationLink(destination: {
            EcranProfile()
        }, label: {
            HStack(spacing: 6) {
                Image(systemName: "person.circle")
                    .font(.title2)
                Image(systemName: "chevron.right")
                    .font(.title2)
                    .fontWeight(.bold)
            }
            
            .padding(.horizontal)
            .padding(.vertical, 6)
            .background(.ultraThinMaterial)
            .clipShape(Capsule())
        })
        .transition(.push(from: .bottom))
        .foregroundStyle(.primary)
    }
}

               
#Preview {
    ProfileButton()
}
