/*
 Ecran 4: description d'un évènement
 
 Prends un évènement en argument
 
 Non fonctionnel
 */


import SwiftUI

struct EcranEvenement: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var data: Data
//    @StateObject var data: Data  // A Enlever quand fini
    @State var eventIndex: Int
    @State private var activeButton = false
    
    
    var body: some View {
        NavigationStack{
            ZStack(alignment: .center) {
                VStack (spacing: 20){
                    ScrollView{
                        HeadImage(imageList: data.eventList[eventIndex].eImage)
                        VStack(spacing: 20) {
                            HStack {
                                Text(data.eventList[eventIndex].eLabel)
                                    .font(.title2)
                                    .bold()
                                Spacer()
                            }
                            HStack {
                                ScrollView(.horizontal, showsIndicators: false){
                                    HStack{
                                        ForEach(data.leasureList[data.eventList[eventIndex].eLeasure].lTags){tag in
                                            TagView(tag: tag)
                                        }
                                    }
                                }
                                ParticipantView(eventIndex: eventIndex)
                            }
                            TextBox(text: data.eventList[eventIndex].eDesc)
                            HStack{
                                Text("Détail de l'évènement")
                                Spacer()
                            }
                            .font(.headline)
                            MapInfoRow(adress: data.eventList[eventIndex].eLocation, date: data.eventList[eventIndex].eDate)
                        }
                        .padding(.horizontal, 20)
                       
                    }
                    
                }
                .ignoresSafeArea()
                
                
                VStack {
                    HStack {
                        Button(action: {dismiss()}, label:{
                            Label(title:{
                                Text(data.leasureList[data.eventList[eventIndex].eLeasure].lLabel).font(.title3)}, icon: {
                                    Image(systemName: "chevron.left").font(.title2)
                                })
                                .padding(.horizontal)
                                .padding(.vertical, 6)
                                .background(.ultraThinMaterial)
                                .clipShape(Capsule())
                        })
                        .tint(.primary)
                        Spacer()
                    }
                    .padding(.horizontal)
                    Spacer()
                    NavigationLink(destination: EcranProfile(), isActive: $activeButton, label: {EmptyView()})
                    if data.eventList[eventIndex].eActualNumberParticipant > (data.eventList[eventIndex].eMaxU-1) {
                        FloatingButton(label: "Evènement complet")
                    } else if data.user.pEvents.contains(where: {event in
                        data.eventList[eventIndex].id == event.id }) {
                        FloatingButton(label: "Déjà participant")
                    } else {
                        Button(action: {
                            data.eventList[eventIndex].eUsersList.append(data.user.pName)
                            data.eventList[eventIndex].eActualNumberParticipant += 1
                            data.user.pEvents.append(data.eventList[eventIndex])
                            activeButton = true
                        }, label: {FloatingButton(label: "Participer")})
                        .tint(.primary)
                    }
                }
            }
            .toolbar(.hidden, for: .navigationBar)
        }
        
//        .environmentObject(data)  // A enlever quand fini
    }
}

//#Preview {
//    EcranEvenement(data: data, eventIndex: 2)
//}
