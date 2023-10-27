//
//  ParticipantView.swift
//  PlayPop
//
//  Created by Émilio Williame on 26/10/2023.
//

import SwiftUI

struct ParticipantView: View {
    
    var event: Event
    
    var body: some View {
        HStack {
            Image(systemName: "person.2.fill")
            HStack(spacing: 5) {
                Text(String(event.eUsersList.count))
                    .foregroundStyle(Color(.systemOrange))
                Text("/")
                Text(String(event.eMaxU))
            }
        }
        .foregroundStyle(.primary)
                .padding(.vertical, 5)
                .padding(.horizontal, 15)
                .background(.ultraThinMaterial)
            .clipShape(Capsule())
    }
}

#Preview {
    ParticipantView(event: karting1)
}
