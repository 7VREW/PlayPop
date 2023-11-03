//
//  EcranNotation.swift
//  PlayPop
//
//  Created by Émilio Williame on 03/11/2023.
//

import SwiftUI

struct EcranNotation: View {
    @State var oRating = 0
    @State var lRating = 0
    @Environment (\.dismiss) var dismiss
    var body: some View {
        ZStack(alignment: .bottom) {
            
            //Background gradient
            Image("bgGradient")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
//            ScrollView(showsIndicators: false){
                ZStack {
                    
                    //Dégradé blanc
                    LinearGradient(colors: [.customBW, .clear], startPoint: .center, endPoint: .top)
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
                        
                        RatingStars(rating: $oRating, label: "L'organisateur ?")
                        RatingStars(rating: $lRating, label: "Le loisir ?")
                        
                        Button(action: {
                            data.user.pXP += 0.15
                            dismiss()
                        }, label: {
                            FloatingButton(label: "Valider")
                        })
                        .buttonStyle(CustomButtonAnimation())
                        .padding(.top, 30)
                    }
                }
//            }
        }
    }
}

#Preview {
    EcranNotation()
}
