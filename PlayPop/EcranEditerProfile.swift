//
//  EcranAccueilProfile.swift
//  PlayPop
//
//  Created by apprenant50 on 31/10/2023.
//

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
                        Text("Prénom, Nom :")
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
    }
}

#Preview {
    EcranAccueilProfile()
        .environmentObject(dataDev)
}
