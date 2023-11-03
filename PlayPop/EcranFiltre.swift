//
//  EcranFiltre.swift
//  PlayPop
//
//  Created by apprenant50 on 30/10/2023.
//

import SwiftUI

struct EcranFiltre: View {
    @Binding var isPresented: Bool
    @EnvironmentObject var data: UserData
    @State var filtreTags = typeTagsList
    @Binding var fSelectedTags: [Tag]
    
    //Vérifie si le tag est séléctionné
   func buttonCheck (tag: Tag)-> Bool {
        var on = true
       if (!(fSelectedTags).contains { tag1 in
            tag.id == tag1.id}) {
            on = false
        }
        return on
    }
    
    func ButtonCheckAll () -> Bool {
        var test = false
        for tag in accessTagsList[0...1]{
            if (data.user.pAnswers.contains { tag1 in
                 tag.id == tag1.id}) {
                 test = true
             }
        }
        if test{
            for tag in accessTagsList[2...5]{
                if (data.user.pAnswers.contains { tag1 in
                     tag.id == tag1.id}) {
                     return true
                 }
            }
        }
        return false
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
            ScrollView {
                FiltreInOut()
                    .padding(.bottom, 20)
                FiltreBudget()
                    .padding(.bottom, 20)
                
                VStack {
                    Text("Je veux :")
                        .font(.title)
                    ForEach (filtreTags) {tag in
                        Button(action: {
                            buttonSwitch(tag: tag)
                            
                        }, label: {
                            ListRowElement(label: tag.tLabel, icon: buttonCheck(tag: tag) ? "minus" : "plus", isOn: buttonCheck(tag: tag))
                        }
                        )
                    }
                }.tint(.primary)
                    .padding(.bottom, 20)
                
                    }
            if ButtonCheckAll(){
                Button ( action: {
                    isPresented = false
                }, label: {
                    FloatingButton(label: "Valider")
                        .padding(.bottom, 30)
                }) .tint(.primary)
                    .buttonStyle(CustomButtonAnimation())
            }
        }
        .interactiveDismissDisabled()
    }
}

struct FiltreInOut: View {
    
    @EnvironmentObject var data: UserData
    func buttonCheck (tag: Tag)-> Bool {
         var on = true
        if (!data.user.pAnswers.contains { tag1 in
             tag.id == tag1.id}) {
             on = false
         }
         return on
     }
    
    var body: some View {
        VStack (alignment: .leading) {
            
            Text("Je préfère pratiquer en...")
                .font(.title)
            
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
                })}
        }
    }
}

struct FiltreBudget: View {
    
    @EnvironmentObject var data: UserData
    func buttonCheck (tag: Tag)-> Bool {
         var on = true
         if (!data.user.pAnswers.contains { tag1 in
             tag.id == tag1.id}) {
             on = false
         }
         return on
     }
    
    var body: some View {
        VStack (alignment: .leading) {
            Text("Mon budget est...")
                .font(.title)
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
                })}
        }
    }
}

#Preview {
    EcranFiltre(isPresented: .constant(true), fSelectedTags: .constant([]))
        .environmentObject(dataDev)
}
