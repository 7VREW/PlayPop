//
//  EcranAccueilProfile.swift
//  PlayPop
//
//  Created by apprenant50 on 31/10/2023.
//
// Permet a l'utilisateur de modifier son profil

import SwiftUI

struct EcranEditerProfile: View {
    @Environment (\.dismiss) var dismiss
    @EnvironmentObject var data: UserData
    
    var body: some View {
            ZStack (alignment: .bottom) {
                VStack{
                    Spacer()
                    
                    Group {
                        
                        //Question 1
                        Text("Prenom :")
                            .font(.title)
                        
                        TextField (LocalizedStringKey(""), text: $data.user.pName)
                            .textFieldStyle(.plain)
                            .padding()
                            .background(.ultraThinMaterial)
                            .clipShape(Capsule())
                        
                        
                        //Question 2
                        Text("Description :")
                            .font(.title)
                        
                        TextField (LocalizedStringKey(""), text: $data.user.pBio)
                            .textFieldStyle(.plain)
                            .padding()
                            .background(.ultraThinMaterial)
                            .clipShape(Capsule())
                        
                    }.keyboardType(.default)
                        .submitLabel(.done)
                    Spacer()
                    Spacer()
                }
                
                if (data.user.pName != "" && data.user.pBio != ""){
                    Button(action: {
                        dismiss()
                    }, label: {
                        FloatingButton(label: "Valider")
                        
                    })
                    .buttonStyle(CustomButtonAnimation())
                    .padding(.bottom, 100)
                }
            }.padding(.horizontal)
            .toolbar {
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
    EcranEditerProfile()
        .environmentObject(dataDev)
}
