//
//  EcranAccueil.swift
//  PlayPop
//
//  Created by Émilio Williame on 30/10/2023.
//

import SwiftUI

struct EcranAccueil: View {
    var body: some View {
        ZStack {
            
            //Background gradient
            Image("bgGradient")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            ScrollView(showsIndicators: false){
                ZStack(alignment: .top) {
                    
                    //Dégradé blanc
                        LinearGradient(colors: [.customBW, .clear], startPoint: .center, endPoint: .top)
                            .frame(minHeight: 900)
                    VStack(spacing: 20) {
                        
                        //Le bouton en haut accès profile
                        ProfileButton()
                            .padding(.bottom, 200)
                        
                        //Question
                        Text("👋")
                            .font(.system(size: 63))
                        Text("Quelle est mon envie ?")
                            .font(.title)
                        
                        
                        //Réponse
                        //ICI FAUT METTRE LE FOREACH
                        ListRowElement(label: "Frayeurs", icon: "chevron.right")
                        
                    }
                    .padding(.vertical, 60)
                    
                }
            }
        }
    }
}

#Preview {
    EcranAccueil()
}
