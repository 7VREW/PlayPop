//
//  CardComponent.swift
//  stackTest
//
//  Created by apprenant50 on 26/10/2023.
//

import SwiftUI

struct CardComponent: View {
    
    var leasure: Leasure
    
    var body: some View {
        ZStack (alignment: .bottom) {
            Rectangle()
                .fill(.gray)
            Image(leasure.lImage[0])
                .resizable()
                .scaledToFill()
            ZStack (alignment: .leading) {
                LinearGradient(colors: [.black, .black.opacity(0.8), .black.opacity(0.5), .clear], startPoint: .bottom, endPoint: .top)
                    .opacity(0.9)
                    .frame(width: 175, height: 45)
                Text(leasure.lLabel)
                    .font(.body)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 3)
                    .foregroundStyle(.white)
            }
        } .clipShape(RoundedRectangle(cornerRadius: 25))
            .frame(width: 175, height: 130)
            .shadow(radius: 5)
    }
}
