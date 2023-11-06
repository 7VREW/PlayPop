//
//  EcranAccueil1.swift
//  PlayPop
//
//  Created by Kessem Quarks on 30/10/2023.
//

import SwiftUI

struct EcranAccueil1: View {
    
    @EnvironmentObject var data: UserData
    
    @State var navTo4: Bool = false
    
    var body: some View {
        NavigationStack{
            ZStack {
                
                //Background gradient
                Image("bgGradient")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                VStack {
                        ZStack(alignment: .top) {
                            
                            //Dégradé blanc
                            LinearGradient(colors: [.customBW, .clear], startPoint: .center, endPoint: .top)
                            ZStack {
                                VStack(spacing: 20) {
                                    
                                    Spacer()
                                    
                                    //Question
                                    Text("👋")
                                        .font(.system(size: 63))
                                    Text("Aujourd'hui, j'ai ...")
                                        .font(.title)
                                    
                                    Spacer()
                                }
                                //Réponse
                                AgePicker()
                                    .offset(y: 110)
                            }
                        }
                    
                    
                    NavigationLink (destination: {
                        EcranAccueilProfile()
                    }, label: {
                        FloatingButton(label: "Valider")
                            
                            
                    })
                    .buttonStyle(CustomButtonAnimation())
                    .padding(.bottom, 80)
                    
                }
                
            }

        }
        .tint(.primary)
        .environmentObject(data)
    }
}

#Preview {
    EcranAccueil1()
        .environmentObject(dataDev)
}
