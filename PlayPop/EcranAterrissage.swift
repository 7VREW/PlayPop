//
//  SwiftUIView.swift
//  PlayPop
//
//  Created by apprenant50 on 02/11/2023.
//
//Affiche l'écran d'aterrissage aproprié en fonction de si oui ou non le profil est déja rempli
//Pas vraiment fonctionel parce que on ne stock pas de données d'une session à une autre

import SwiftUI

struct EcranAterrissage: View {
    
    @EnvironmentObject var data: UserData
    
    var body: some View {
        NavigationStack {
            VStack{
                if data.user.pComplete {
                    EcranAccueil4()
                } else {
                    EcranAccueil1()
                }
            }
            
        } .tint(.primary)
    }
}

#Preview {
    EcranAterrissage()
        .environmentObject(dataDev)
}
