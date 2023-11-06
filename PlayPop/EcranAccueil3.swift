//
//  EcranAccueil.swift
//  PlayPop
//
//  Created by Kessem Quarks on 30/10/2023.
//
// Permet a l'utilisateur de filtrer en fonction de l'environnement

import SwiftUI

struct EcranAccueil3: View {
    
    @EnvironmentObject var data: UserData
    
    func buttonCheck (tag: Tag)-> Bool {
         var on = true
             if (!data.user.pAnswers.contains { tag1 in
                 tag.id == tag1.id}) {
                 on = false
                 }
         return on
         }
    
    func ButtonCheckAll () -> Bool {
        for tag in accessTagsList[0...1]{
            if buttonCheck(tag: tag){
                return true
            }
        }
        return false
    }
    
    var body: some View {
            ZStack {
                
                //Background gradient
                Image("bgGradient")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                ZStack (alignment: .bottom) {
                    ZStack(alignment: .center) {
                        
                        //Dégradé blanc
                        LinearGradient(colors: [.customBW, .clear], startPoint: .center, endPoint: .top)
                        VStack(spacing: 20) {
                            
                            
                            //Question
                            Text("👋")
                                .font(.system(size: 63))
                            Text("Je préfère pratiquer en...")
                                .font(.title)
                            
                            
                            //Réponse
                            ForEach (accessTagsList.filter{
                                tag in
                                tag.tId <= 101
                            }) {tag in
                                Button(action: {
                                    if (!data.user.pAnswers.contains { tag1 in
                                        tag.id == tag1.id}) {
                                        data.user.pAnswers.append(tag)
                                    } else {
                                        data.user.pAnswers.removeAll { tag1 in
                                            tag.id == tag1.id
                                        }
                                    }
                                }, label: {
                                    ListRowElement(label: tag.tLabel, icon: buttonCheck(tag: tag) ? "minus" : "plus", isOn: buttonCheck(tag: tag))
                                }
                                )
                                .buttonStyle(CustomButtonAnimation())
                                .tint(.primary)
                                
                            }
                        }
                        
                    }
                    if ButtonCheckAll(){
                        NavigationLink (destination: {
                            EcranAccueil4()
                        }, label: {
                            FloatingButton(label: "Valider")
                            
                        })
                        .buttonStyle(CustomButtonAnimation())
                        .padding(.bottom, 80)
                    }
                }
            }
    }
}

#Preview {
    EcranAccueil3()
        .environmentObject(dataDev)
}
