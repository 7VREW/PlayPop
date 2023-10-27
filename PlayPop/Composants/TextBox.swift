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
        Text(text)
            .font(.callout)
            .padding(.bottom)
            .padding()
            .frame(width: 352, alignment: .leading)
            .background(Color(.systemGray5))
            .clipShape(RoundedRectangle(cornerRadius: 20))
        
    }
}

#Preview {
    TextBox(text: "Hello, World!")
}

