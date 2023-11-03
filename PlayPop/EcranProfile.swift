//
//  EcranProfile.swift
//  PlayPop
//
//  Created by Émilio Williame on 30/10/2023.
//

import SwiftUI

struct EcranProfile: View {
    @EnvironmentObject var data: UserData
    var body: some View {
        NavigationStack{
            ScrollView (showsIndicators: false) {
                VStack(spacing: 30) {
                    ProfileView()
                    TextBox(text: data.user.pBio)
                    
                    
                    VStack (alignment: .leading){
                        Text("À venir")
                            .font(.title)
                            .fontWeight(.bold)
                        
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(data.eventList.filter {event in
                                    (event.eDate >= Date.now &&
                                     event.eUsersList.contains(data.user.id))
                                }){event in
                                    NavigationLink(destination: {
                                        if let idx = data.eventList.firstIndex(where: {$0.id == event.id}) {
                                            EcranEvenement(eventIndex: idx)
                                        }
                                    }, label: {
                                        EventCardComponent(event: event)
                                    })
                                }
                            }
                        }
                    }
                    
                    VStack (alignment: .leading){
                        HStack {
                            Text("Passé")
                                .font(.title)
                                .fontWeight(.bold)
                            Text("Psst... gagne + de points en notant !")
                                .font(.callout)
                                .fontWeight(.light)
                                .foregroundStyle(.secondary)
                        }
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack  {
                                ForEach(data.eventList.filter {event in
                                    (event.eDate < Date.now &&
                                     event.eUsersList.contains(data.user.id))
                                }){event in
                                    NavigationLink(destination: {
                                        if let idx = data.eventList.firstIndex(where: {$0.id == event.id}) {
                                            EcranEvenement(eventIndex: idx)
                                        }
                                    }, label: {
                                        EventCardComponent(event: event)
                                    })
                                }
                            }
                            .saturation(0)
                            .padding(.horizontal, -20)
                        }
                        .padding(.horizontal, 20)
                    }
                    
                    Spacer()
                }
                .padding()
                .padding(.horizontal, 5)
            }
        }
    }
}

//#Preview {
//    EcranProfile()
//}
