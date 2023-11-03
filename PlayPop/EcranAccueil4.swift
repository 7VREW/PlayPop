//
//  EcranAccueil.swift
//  PlayPop
//
//  Created by Émilio Williame on 30/10/2023.
//

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
                            
                            //Le bouton en haut accès profile
                            HStack {
                                Spacer()
                                ProfileButton()
                                    .buttonStyle(CustomButtonAnimation())
                                    .padding(.bottom, 230)
                                .padding(.top, 50)
                            }
                            .padding(.horizontal, 25)
                            
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
                                    ListRowElement(label: tag.tLabel, icon: "chevron.right")
                                })
                                .buttonStyle(CustomButtonAnimation())
                                .tint(.primary)
                                
                            }
                        }
                        
                    }
                    .padding(.bottom, 150)
                }
                
            }
        }.tint(.primary)
    }
}

#Preview {
    EcranAccueil4()
        .environmentObject(dataDev)
}
