//
//  EcranSuggestions.swift
//  PlayPop
//
//  Created by apprenant50 on 30/10/2023.
//

import SwiftUI
import Foundation

struct EcranSuggestions: View {
    
    @EnvironmentObject var data: Data
    @State var selectedTags: [Tag] = []
    @State var showingFiltres = false
    
    
    //Vérifie quels loisirs sont à afficher en fonction des tags
    func showInDisplay (leasure: Leasure)-> Bool {
        var show = true
        for tag in (selectedTags) {
            if (!leasure.lTags.contains { tag1 in
                tag.id == tag1.id}) {
                    show = false
                    return show
                }
        }
        for tag in (leasure.lTags) {
            if (!data.user.pAnswers.contains { tag1 in
                tag.id == tag1.id} && tag.tId >= 100) {
                    show = false
                    return show
                }
        }
        return show
    }
    
    var body: some View {
        NavigationStack {
            VStack (alignment: .leading, spacing: 20){
                Text("Suggestions")
                    .font(.largeTitle)
                    .padding(.top, 50)
                ScrollView (.horizontal, showsIndicators: false) {
                    HStack {
                        Button(action: {
                            showingFiltres.toggle()
                        }, label: {
                            Label(
                                title: { Text("éditer") },
                                icon: { Image(systemName: "tag") })
                                .padding(.vertical, 5)
                                .padding(.horizontal, 15)
                                .background(Color(.systemGray6))
                                .clipShape(Capsule())
                        }) .foregroundStyle(.primary)
                        ForEach (data.user.pAnswers + selectedTags) {tag in
                            TagView(tag: tag)
                        }
                    }
                }
                
                ScrollView {
                    if ((data.leasureList.filter {
                        leasure in
                        showInDisplay(leasure: leasure)
                    }).count == 0) {
                        HStack {
                            Spacer()
                            Text("Aucun loisir ne correspond à ces tags")
                                .font(.headline)
                                .foregroundStyle(.tertiary)
                            .multilineTextAlignment(.center)
                            Spacer()
                        }
                    } else {
                    LazyVGrid(
                        columns: [GridItem(.adaptive(minimum: 130, maximum: 360))],
                        content:
                            {
                                ForEach(data.leasureList.filter {
                                    leasure in
                                    showInDisplay(leasure: leasure)
                                }) {leasure in
                                    NavigationLink(destination: {
                                        if let idx = data.leasureList.firstIndex(where: {$0.id == leasure.id}) {
                                            EcranLoisir(leasureIndex: idx)
                                        }
//                                        EcranLoisir(leasure: leasure)
                                    }, label: {
                                        CardComponent(leasure: leasure)
                                            .padding(5)
                                    })
                                }
                            }).frame(width: 360)}
                    
                }
            }
                .fullScreenCover(isPresented: $showingFiltres) {
                EcranFiltre(isPresented: $showingFiltres, fSelectedTags: $selectedTags)
                    }.padding()
        }.tint(.primary)
    }
}

//#Preview {
//    EcranSuggestions(selectedTags: [typeTagsList[6]])
//}
