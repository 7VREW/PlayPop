//
//  EcranAccueilProfile.swift
//  PlayPop
//
//  Created by Kessem Quarks on 31/10/2023.
//
// Permet a l'utilisateur de remplir son profil

import SwiftUI

struct EcranAccueilProfile: View {
    
    @EnvironmentObject var data: UserData
    
    var body: some View {
            ZStack {
                
                //Background gradient
                Image("bgGradient")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                ZStack (alignment: .bottom) {
                        ZStack(alignment: .top) {
                            
                            //Dégradé blanc
                            LinearGradient(colors: [.customBW, .clear], startPoint: .center, endPoint: .top)
                            VStack(alignment: .leading, spacing: 20) {
                                
                                Spacer()
                                
                                //Question 1
                                HStack {
                                    Text("👋 Salut")
                                        .font(.title)
                                
                                    TextField (LocalizedStringKey("Prenom"), text: $data.user.pName)
                                    .textFieldStyle(.plain)
                                    .padding()
                                    .background(.ultraThinMaterial)
                                    .clipShape(Capsule())
                                }.textInputAutocapitalization(.words)
                                    .autocorrectionDisabled()

                                //Question 2
                                HStack {
                                    Text("Qui es-tu ?")
                                        .font(.title)
                                
                                    TextField (LocalizedStringKey("Description"), text: $data.user.pBio)
                                    .textFieldStyle(.plain)
                                    .padding()
                                    .background(.ultraThinMaterial)
                                    .clipShape(Capsule())
                                }
                                    
                                    
                                
                                Spacer()
                            }.keyboardType(.default)
                                .submitLabel(.done)
                            .padding(.horizontal)
                            }
                    // Affiche le bouton valider seulement si tous les champs sont remplis
                    if (data.user.pName != "" && data.user.pBio != ""){
                        NavigationLink (destination: {
                            EcranAccueil2()
                        }, label: {
                            FloatingButton(label: "Valider")
                            
                        })
                        .buttonStyle(CustomButtonAnimation())
                        .padding(.bottom, 100)
                    }
                }
            }
    }
}

#Preview {
    EcranAccueilProfile()
        .environmentObject(dataDev)
}
