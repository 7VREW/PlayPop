//
//  EcranFiltre.swift
//  PlayPop
//
//  Created by apprenant50 on 30/10/2023.
//

import SwiftUI

struct EcranFiltre: View {
    @Binding var isPresented: Bool
    
    @State var filtreTags = typeTagsList
   @Binding var fSelectedTags: [Tag]
    
    //Vérifie si le tag est séléctionné
   func buttonCheck (tag: Tag)-> Bool {
        var on = true
            if (!fSelectedTags.contains { tag1 in
                tag.id == tag1.id}) {
                on = false
                }
        return on
        }
    
    //séléctionne ou désélectionne le tag
    func buttonSwitch (tag: Tag) {
        if (!fSelectedTags.contains { tag1 in
            tag.id == tag1.id}) {
            fSelectedTags.append(tag)
            } else {
                fSelectedTags.removeAll { tag1 in
                        tag.id == tag1.id
                }
            }
    }
    var body: some View {
        ZStack (alignment: .bottom) {
            VStack (alignment: .leading) {
                ZStack  {
                    Text("Je veux :")
                        .font(.largeTitle)
                }
                    ScrollView {
                        
                        ForEach (filtreTags) {tag in
                            Button(action: {
                                buttonSwitch(tag: tag)
                                
                            }, label: {
                                ListRowElement(label: tag.tLabel, icon: buttonCheck(tag: tag) ? "minus" : "plus", isOn: buttonCheck(tag: tag))
                            }
                            ) .tint(.primary)
                        }
                    }
            }
            Button ( action: {
                isPresented = false
            }, label: {
            FloatingButton(label: "Valider")
                .padding(.bottom, 30)
            }) .tint(.primary)
                .buttonStyle(CustomButtonAnimation())
        }
    }
}

//#Preview {
//    EcranFiltre(fSelectedTags: [])
//}
