//
//  ParticipantView.swift
//  PlayPop
//
//  Created by Émilio Williame on 26/10/2023.
//

import SwiftUI

struct ParticipantView: View {
    
    @EnvironmentObject var data: Data
    @State var eventIndex: Int
    
    var body: some View {
        HStack {
            Image(systemName: "person.2.fill")
            HStack(spacing: 5) {
                Text(String(data.eventList[eventIndex].eActualNumberParticipant))
                    .foregroundStyle(Color(.systemOrange))
                Text("/")
                Text(String(data.eventList[eventIndex].eMaxU))
            }
        }
        .foregroundStyle(.primary)
                .padding(.vertical, 5)
                .padding(.horizontal, 15)
                .background(.ultraThinMaterial)
            .clipShape(Capsule())
    }
}

//#Preview {
//    ParticipantView(event: karting1)
//}
