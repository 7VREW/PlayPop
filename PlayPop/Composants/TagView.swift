//
//  TagView.swift
//  PlayPop
//
//  Created by Émilio Williame on 26/10/2023.
//

import SwiftUI

struct TagView: View {
    
    var tag: Tag
    
    var body: some View {
        
        // Affichage du tag
        Text(tag.tLabel)
            .foregroundStyle(.background)
            .padding(.vertical, 5)
            .padding(.horizontal, 15)
            .background(Color(.systemOrange))
            .clipShape(Capsule())
    }
}


var tag1: [Tag] = [Tag(tId: 0, tLabel: "Exemple")]

#Preview {
    TagView(tag: tag1[0])
}
