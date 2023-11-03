//
//  EcranNotation.swift
//  PlayPop
//
//  Created by Émilio Williame on 03/11/2023.
//

import SwiftUI

struct EcranNotation: View {
    var body: some View {
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
//                        ZStack {
                            VStack(spacing: 20) {
                                                                
                                //Question
                                Text("✅")
                                    .font(.system(size: 63))
                                Text("Ça s'est bien passé ?")
                                    .font(.title)
                                Text("Tu viens de participer à un évènement, dévérouille ta récompense en le notant !")
                                    .font(.footnote)
                                    .multilineTextAlignment(.center)
                                    .foregroundStyle(.secondary)
                            }
                    }
                
                FloatingButton(label: "Valider")
                .buttonStyle(CustomButtonAnimation())
                .padding(.bottom, 80)
                
            }
            
        }
    }
}

#Preview {
    EcranNotation()
}
