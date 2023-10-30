//
//  EcranSuggestions.swift
//  PlayPop
//
//  Created by apprenant50 on 30/10/2023.
//

import SwiftUI
import Foundation

struct EcranSuggestions: View {
    
    @State var selectedTags: [Tag] = []
    @State var showingFiltres = false
    
    
    //Vérifie quels loisirs sont à afficher en fonction des tags
    func showInDisplay (leasure: Leasure)-> Bool {
        var show = true
        for tag in selectedTags {
            if (!leasure.lTags.contains { tag1 in
                tag.id == tag1.id}) {
                    show = false
                }
        }
        return show
    }
    
    var body: some View {
        NavigationStack {
            VStack (spacing: 20){
                ScrollView (.horizontal) {
                    HStack {
                        Button(action: {
                            showingFiltres.toggle()
                        }, label: {
                            Label(
                                title: { Text("éditer") },
                                icon: { Image(systemName: "tag") })
                                .foregroundStyle(.primary)
                                .padding(.vertical, 5)
                                .padding(.horizontal, 15)
                                .background(Color(.systemGray6))
                                .clipShape(Capsule())
                        })
                        ForEach (selectedTags) {tag in
                            TagView(tag: tag)
                        }
                    }
                }
                
                ScrollView {
                    if ((leasureList.filter {
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
                                ForEach(leasureList.filter {
                                    leasure in
                                    showInDisplay(leasure: leasure)
                                }) {
                                    leasure in
                                    CardComponent(leasure: leasure)
                                        .padding(5)
                                }
                            }).frame(width: 360)}
                    
                }
            }
            .navigationTitle("Suggestions")
            .padding(.horizontal, 16)
            .sheet(isPresented: $showingFiltres) {
                EcranFiltre(isPresented: $showingFiltres, fSelectedTags: $selectedTags)
                    }
        }
    }
}

#Preview {
    EcranSuggestions(selectedTags: [typeTagsList[6]])
}
