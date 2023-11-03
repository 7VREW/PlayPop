//
//  EcranAccueilProfile.swift
//  PlayPop
//
//  Created by apprenant50 on 31/10/2023.
//

import SwiftUI

struct EcranAccueilProfile: View {
    
    @EnvironmentObject var data: UserData
    
    var body: some View {
        NavigationStack{
            ZStack {
                
                //Background gradient
                Image("bgGradient")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                ZStack (alignment: .bottom) {
//                    ScrollView(showsIndicators: false){
                        ZStack(alignment: .top) {
                            
                            //Dégradé blanc
                            LinearGradient(colors: [.customBW, .clear], startPoint: .center, endPoint: .top)
                            VStack(alignment: .leading, spacing: 20) {
                                
                                Spacer()
                                
                                //Question 1
                                HStack {
                                    Text("👋 Salut")
                                        .font(.title)
                                
                                    TextField (LocalizedStringKey("Prénom, Nom"), text: $data.user.pName)
                                    .textFieldStyle(.plain)
                                    .padding()
                                    .background(.ultraThinMaterial)
                                    .clipShape(Capsule())
                                }

                                //Question 2
                                HStack {
                                    Text("Qui est-tu ?")
                                        .font(.title)
                                
                                    TextField (LocalizedStringKey("Looping Studio, Car videographer, Apple Developer"), text: $data.user.pBio)
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
//                   }
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
        }.tint(.primary)
    }
}

#Preview {
    EcranAccueilProfile()
        .environmentObject(dataDev)
}
