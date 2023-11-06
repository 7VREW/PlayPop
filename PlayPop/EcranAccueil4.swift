//
//  EcranAccueil.swift
//  PlayPop
//
//  Created by Émilio Williame on 30/10/2023.
//
// Permet a l'utilisateur de filtrer en fonction de catégories

import SwiftUI

struct EcranAccueil4: View {
    
    @EnvironmentObject var data: UserData
    
    var body: some View {
        NavigationStack{
            ZStack (alignment: .bottom) {
                
                //Background gradient
                Image("bgGradient")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                ScrollView(showsIndicators: false){
                    ZStack {
                        
                        //Dégradé blanc
                        LinearGradient(colors: [.customBW, .clear], startPoint: .center, endPoint: .top)
                            .frame(minHeight: 900)
                        VStack(spacing: 20) {
                            
                            
                            //Question
                            Text("👋")
                                .font(.system(size: 63))
                            Text("Aujourd'hui, j'ai envie de...")
                                .font(.title)
                            
                            
                            //Réponse
                            ForEach (typeTagsList) {tag in
                                NavigationLink(destination: {
                                    EcranSuggestions(selectedTags: [tag])
                                }, label: {
                                    ListRowElement(label: tag.tLabel, icon: "plus")
                                })
                                .buttonStyle(CustomButtonAnimation())
                                .tint(.primary)
                                
                            }
                        }
                        
                    }
                    .padding(.bottom, 150)
                    .padding(.top, 80)
                }
                
            }
        }.navigationBarBackButtonHidden()
        .tint(.primary)
        .toolbar {
            ToolbarItem (placement: .navigationBarTrailing) {
                ProfileButton()
                    .buttonStyle(CustomButtonAnimation())
            }
        }.toolbar(.visible, for: .navigationBar)

    }
}

#Preview {
    EcranAccueil4()
        .environmentObject(dataDev)
}
