//
//  EcranProfile.swift
//  PlayPop
//
//  Created by Émilio Williame on 30/10/2023.
//
// le Profile de l'utilisateur

import SwiftUI

struct EcranProfile: View {
    @Environment (\.dismiss) var dismiss
    @EnvironmentObject var data: UserData
    @State var notationSheet: Bool = false
    
    var body: some View {
            ScrollView (showsIndicators: false) {
                VStack(spacing: 30) {
                    ProfileView()
                    TextBox(text: data.user.pBio)
                    
//                  Affiche les evenements futurs
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
                            .padding(.horizontal, 20)
                        }
                        .padding(.horizontal, -20)
                    }
                    
                    
                    // Affiche les evenements passés
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
                                
                                    Button (action: {
                                            notationSheet.toggle()
                                        }, label: {
                                            EventCardComponent(event: event)
                                        })
                                    .sheet(isPresented: $notationSheet) {
                                        EcranNotation(leasureIndex: event.eLeasure)
                                    }
                                }
                            }
                            .saturation(0)
                            .padding(.horizontal, 20)
                        }
                        .padding(.horizontal, -20)
                    }
                    
                    Spacer()
                }
                .padding()
                .padding(.horizontal, 5)
            }.toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {dismiss()}, label:{
                        HStack{
                            Image(systemName: "chevron.backward")
                                .font(.title2)
                            Text("Retour")
                                .font(.title3)
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 6)
                        .background(.ultraThinMaterial)
                        .clipShape(Capsule())
                    })
                }
            }
            .navigationBarBackButtonHidden()
    }
}

#Preview {
    EcranProfile()
        .environmentObject(dataDev)
}
