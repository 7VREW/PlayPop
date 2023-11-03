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
        
        ZStack (alignment: .bottomLeading) {
            
            ZStack {
                leasure.lImage[0]
                    .resizable()
                    .scaledToFill()
                    .frame(width: 175, height: 250, alignment: .center)
                LinearGradient(colors: [.black.opacity(0.75), .clear], startPoint: .bottom, endPoint: .center)
            }

            
            VStack(alignment: .leading) {
                Text(leasure.lLabel)
                    .fontWeight(.bold)
            }
            .lineLimit(1)
            .foregroundStyle(.white)
            .padding()
        }
        .clipShape(RoundedRectangle(cornerRadius: 30))
            .frame(width: 175, height: 250)
    }
}

#Preview {
    CardComponent(leasure: leasureList[1])
}
