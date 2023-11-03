/*
 Ecran 3: description d'un loisir et sélection de l'évènement
 
 Prends un loisir en argument
 
 Non fonctionnel, reste à faire:
  - lien sur l'écran de l'évènement
  - lien sur l'écran de création d'évènement
  - tri des évènements
 */

import SwiftUI

struct EcranLoisir: View {
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
        NavigationStack{
            ZStack(alignment: .bottom) {
                VStack (spacing: 20){
                    ScrollView{
                        HeadImage(imageList: data.leasureList[leasureIndex].lImage)
                        VStack(spacing: 20) {
                            HStack {
                                Text(data.leasureList[leasureIndex].lLabel)
                                    .font(.title2)
                                    .bold()
                                Spacer()
                                
                                //A remplacer par la variable note
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
                            ScrollView(.horizontal, showsIndicators: false){
                                HStack{
                                    ForEach(data.leasureList[leasureIndex].lTags){tag in
                                        TagView(tag: tag)
                                    }
                                }
                                .padding(.horizontal, 20)
                            }
                            .padding(.horizontal, -20)
                            
                            TextBox(text: data.leasureList[leasureIndex].lDesc)
                            HStack{
                                Text("Évènement à venir")
                                Spacer()
                                Image(systemName: "line.horizontal.3.decrease")
                            }
                            .font(.headline)
                        }
                        .padding(.horizontal, 20)
                        ForEach(data.eventList.filter {event in
                            (event.eLeasure == leasureIndex && !event.ePast)
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
                })
            }
        }
        .tint(.primary)
    }
}

#Preview {
    EcranLoisir(leasureIndex: 7)
        .environmentObject(dataDev)
}
