//
//  DescriptionBox.swift
//  PlayPop
//
//  Created by Apprenant 39 on 27/10/2023.
//

import SwiftUI

struct TextBox: View {
    
    var text: String // contenu de la description
    
    var body: some View {
        VStack {
            
            // Afichage de la description
            Text(text)
                .font(.callout)
                .lineSpacing(4)
                .padding(25)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 25))
        }
    }
}

#Preview {
    TextBox(text: "Salut j'aime le karting je pratique du skate et la nomenclature de cette text box m'ennui. J'ai 12 ans en réalité")
}

