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
            ZStack (alignment: .bottomLeading) {
                
                ZStack {
                    event.eImage[0]
                        .resizable()
                        .scaledToFill()
                        .frame(width: 175, height: 250, alignment: .center)
                    LinearGradient(colors: [.black.opacity(0.75), .clear], startPoint: .bottom, endPoint: .center)
                }

                
                VStack(alignment: .leading) {
                    Text(event.eLabel)
                        .fontWeight(.bold)
                    Text("\(event.eDate.formatted(.dateTime.day().month().year()))")
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
    EventCardComponent(event: karting1)
}

//guitarEvent1
