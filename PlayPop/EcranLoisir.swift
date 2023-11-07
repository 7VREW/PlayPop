/*
 Ecran 3: description d'un loisir et sélection de l'évènement
 
 Prends un loisir en argument
 
 */

import SwiftUI

struct EcranLoisir: View {
    @Environment (\.dismiss) var dismiss
    @EnvironmentObject var data: UserData
    @State var leasureIndex: Int
    
    @State var showCreate: Bool = false
    @State var navToProfile: Bool = false
    
    func rating ()-> Double {
        var stars: Double = 0

        
        for rate in data.leasureList[leasureIndex].lNotes {
            stars += rate
        }
        
        return stars/Double(data.leasureList[leasureIndex].lNotes.count)
    }
    
    var body: some View {            
        ZStack(alignment: .bottom) {
                VStack (spacing: 20){
                    ScrollView{
                        
                        // Affiche les images du loisir
                        HeadImage(imageList: data.leasureList[leasureIndex].lImage)
                        VStack(spacing: 20) {
                            
                            // Le nom et la note du loisir
                            HStack {
                                Text(data.leasureList[leasureIndex].lLabel)
                                    .font(.title2)
                                    .bold()
                                Spacer()
                                
                                HStack {
                                    if data.leasureList[leasureIndex].lNotes.count > 0 {
                                        Text(String(format: "%.1f", rating()))
                                            .fontWeight(.bold)
                                            .foregroundStyle(Color(.systemYellow))
                                    } else {
                                        Text("N/A")
                                            .fontWeight(.bold)
                                            .foregroundStyle(Color(.systemYellow))
                                    }
                                    Image(systemName: "star.fill")
                                        .foregroundStyle(Color(.systemYellow))
                                }
                                
                            }
                            .padding(.top)
                            
                            // Les tags du loisir
                            ScrollView(.horizontal, showsIndicators: false){
                                HStack{
                                    ForEach(data.leasureList[leasureIndex].lTags){tag in
                                        TagView(tag: tag)
                                    }
                                }
                                .padding(.horizontal, 20)
                            }
                            .padding(.horizontal, -20)
                            
                            // La description du loisir
                            TextBox(text: data.leasureList[leasureIndex].lDesc)
                            HStack{
                                Text("Évènement à venir")
                                Spacer()
                                Image(systemName: "line.horizontal.3.decrease")
                            }
                            .font(.headline)
                        }
                        .padding(.horizontal, 20)
                        
                        // La liste des événements programmés pour le loisir
                        ForEach(data.eventList.filter {event in
                            (event.eLeasure == leasureIndex && (event.eDate > Date()))
                        }){event in
                            NavigationLink(destination: {
                                if let idx = data.eventList.firstIndex(where: {$0.id == event.id}) {
                                    EcranEvenement(eventIndex: idx)
                                }
                            }, label: {
                                EventRow(event: event)
                            })
                            .tint(.primary)
                            .padding(.bottom, 150)
                        }
                    }
                }
                .ignoresSafeArea()
                
                NavigationLink(destination: EcranProfile(), isActive: $navToProfile, label: {EmptyView()})
                
                .fullScreenCover(isPresented: $showCreate) {
                    EcranEvenementCreate(navToProfile: $navToProfile, showCreate: $showCreate, leasureIndex: leasureIndex)
                }
                
                Button (action: {
                    showCreate.toggle()
                }, label: {
                    FloatingButton(label: "Créer un évènement")
                        .padding()
                }).tint(.primary)
                .toolbar {
                    ToolbarItem (placement: .navigationBarTrailing) {
                        ProfileButton()
                            .buttonStyle(CustomButtonAnimation())
                    }
                    ToolbarItem(placement: .topBarLeading) {
                        Button(action: {dismiss()}, label:{
                            HStack{
                                Image(systemName: "chevron.backward")
                                    .font(.title2)
                                Text("Retour")
                                    .font(.title3)
                            }
                            .padding(.horizontal)
                            .padding(.vertical, 6)
                            .background(.ultraThinMaterial)
                            .clipShape(Capsule())
                        })
                    }
                } .navigationBarBackButtonHidden()
            .toolbarBackground(.hidden, for: .navigationBar)
            }
    }
}

#Preview {
    EcranLoisir(leasureIndex: 5)
        .environmentObject(dataDev)
}
