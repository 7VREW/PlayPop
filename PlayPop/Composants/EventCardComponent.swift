//
//  EventCardComponent.swift
//  PlayPop
//
//  Created by apprenant50 on 26/10/2023.
//

import SwiftUI

struct EventCardComponent: View {
    
        var event: Event
        
        var body: some View {
            ZStack (alignment: .bottom) {
                Image(event.eImage[0])
                    .resizable()
                    .scaledToFit()
                ZStack (alignment: .leading) {
                    LinearGradient(colors: [.black, .black.opacity(0.8), .black.opacity(0.5), .clear], startPoint: .bottom, endPoint: .top)
                        .opacity(0.9)
                        .frame(width: 175, height: 45)
                    Text(event.eLabel)
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
