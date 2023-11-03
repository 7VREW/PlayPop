//
//  EcranAccueil.swift
//  PlayPop
//
//  Created by Kessem Quarks on 30/10/2023.
//

import SwiftUI

struct EcranAccueil2: View {
    
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
        for tag in accessTagsList[2...5]{
            if buttonCheck(tag: tag){
                return true
            }
        }
        return false
    }
    
    var body: some View {
        NavigationStack{
            ZStack (alignment: .bottom){
                
                //Background gradient
                Image("bgGradient")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                VStack {
                    ZStack(alignment: .top) {
                        
                        //Dégradé blanc
                        LinearGradient(colors: [.customBW, .clear], startPoint: .center, endPoint: .top)
//                        ZStack {
                            VStack(spacing: 20) {
                                
                                //Question
                                Text("👋")
                                    .font(.system(size: 63))
                                Text("Mon budget est...")
                                    .font(.title)
                                
                                
                                //Réponse
                                ForEach (accessTagsList.filter{
                                    tag in
                                    tag.tId > 101
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
                                    .tint(.primary)
                                    
                                }
                                
                            }
                            .offset(y: 220)
//                        }
                    }
                        
                    }
                if ButtonCheckAll(){
                    NavigationLink (destination: {
                        EcranAccueil3()
                    }, label: {
                        FloatingButton(label: "Valider")
                        
                    })
                    .buttonStyle(CustomButtonAnimation())
                    .padding(.bottom, 80)
                }
                }
            }
//        }
        .tint(.primary)
    }
}

#Preview {
    EcranAccueil2()
        .environmentObject(dataDev)
}
