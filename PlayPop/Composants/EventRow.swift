//
//  EventCard.swift
//  PlayPop
//
//  Created by Apprenant 39 on 26/10/2023.
//

import SwiftUI

struct EventRow: View {
    var event: Event
    var dateInterval: Int { Int(event.eDate.distance(to: Date()))}
    var body: some View {
        
        
        VStack(spacing: 0) {
                   HStack{
                       VStack(alignment: .leading){
                           HStack{
                               Text(event.eLabel)
                                   .font(.headline)
                                   .lineLimit(1)
                               switch dateInterval{
                               case 0...3599:
                                   Text("Dans \(dateInterval/60) minutes")
                                       .foregroundStyle(Color(.systemOrange))
                               case 3600...86399:
                                   Text("Dans \(dateInterval/3600) heures")
                                       .foregroundStyle(Color(.systemOrange))
                               default:
                                   Text("Dans \(dateInterval/86400) jours")
                                       .foregroundStyle(Color(.systemOrange))
                               }
                           }
                           Text(event.eDesc)
                               .font(.callout)
                               .lineLimit(2, reservesSpace: true)
                       }
                       
                       Spacer()
                       
                       VStack {
                           Image(systemName: "person.2.fill")
                               .font(.title)
                           HStack {
                               Text(String(event.eUsersList.count))
                                   .foregroundStyle(Color(.systemOrange))
                               Text("/")
                               Text(String(event.eMaxU))
                           }
                       }
                       .frame(width: 80, height: 80)
                       .background(.background)
                       .clipShape(RoundedRectangle(cornerRadius: 20))
                   }
                   .padding(.horizontal)
                   .frame(width: 390, height: 111)
                   .background(.ultraThinMaterial)
                   Divider()
        }
    }
}

#Preview {
    EventRow(event: guitarEvent1)
}
