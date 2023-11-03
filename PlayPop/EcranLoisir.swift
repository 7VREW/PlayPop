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
                            }
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
                            .padding(.bottom, 100)
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

//#Preview {
//    EcranLoisir(leasure: leasureList[2])
//}
