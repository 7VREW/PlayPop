//
//  TagView.swift
//  PlayPop
//
//  Created by Émilio Williame on 26/10/2023.
//

import SwiftUI

var tag1: [Tag] = [Tag(tId: 0, tLabel: "Exemple")]

struct TagView: View {
    
    var tag: Tag
    
    var body: some View {
        Text(tag.tLabel)
            .foregroundStyle(.background)
            .padding(.vertical, 5)
            .padding(.horizontal, 15)
            .background(Color(.systemOrange))
            .clipShape(Capsule())
    }
}

#Preview {
    TagView(tag: tag1[0])
}
