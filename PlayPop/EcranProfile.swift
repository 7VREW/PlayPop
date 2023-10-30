//
//  EcranProfile.swift
//  PlayPop
//
//  Created by Émilio Williame on 30/10/2023.
//

import SwiftUI

struct EcranProfile: View {
    var body: some View {
        ScrollView (showsIndicators: false) {
            VStack {
                ProfileView()
                TextBox(text: "Salut j'aime le karting je pratique du skate et la nomenclature de cette text box m'ennui. J'ai 12 ans en réalité")
                
                
                VStack (alignment: .leading){
                    Text("À venir")
                        .font(.title)
                        .fontWeight(.bold)
                    ScrollView (.horizontal, showsIndicators: false) {
                        HStack  {
                            EventCardComponent(event: skateEvent1)
                            EventCardComponent(event: horrorEvent1)
                            EventCardComponent(event: karting1)
                        }
                    }
                }
                .padding(.vertical, 20)
                
                VStack (alignment: .leading){
                    Text("Passé")
                        .font(.title)
                        .fontWeight(.bold)
                    ScrollView (.horizontal, showsIndicators: false) {
                        HStack  {
                            EventCardComponent(event: jDREvent1)
                            EventCardComponent(event: lectureEvent1)
                            EventCardComponent(event: skateEvent1)
                        }
                        .saturation(0)
                    }
                }
                .padding(.vertical, 20)
                
                Spacer()
            }
            .padding()
        }
        
        }
    }

#Preview {
    EcranProfile()
}
