//
//  ListRowElement.swift
//  PlayPop
//
//  Created by apprenant50 on 26/10/2023.
//

import SwiftUI

struct ListRowElement: View {
    
    //texte affiché
    var label: String
    //icone affichée
    var icon: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30.0)
                .fill(.quinary)
            HStack {
                Text(label)
                    .font(.title3)
                Spacer()
                Image(systemName: icon)
            } .padding(.horizontal, 20)
        } .frame(width: 350, height: 60)
    }
}

#Preview {
    ListRowElement(label: "Envies ?", icon: "chevron.right")
}
