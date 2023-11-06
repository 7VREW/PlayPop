/*
 Ecran 4: description d'un évènement
 
 Prends un évènement en argument
 
 Non fonctionnel
 */


import SwiftUI

struct EcranEvenement: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var data: UserData
    @State var eventIndex: Int
    @State private var activeButton = false
    @State private var isPresentingConfirm: Bool = false
    
    
    var body: some View {
            ZStack(alignment: .center) {
                VStack (spacing: 20){
                    ScrollView{
                        HeadImage(imageList: data.eventList[eventIndex].eImage)
                        VStack(spacing: 20) {
                            HStack {
                                Text(data.eventList[eventIndex].eLabel)
                                    .font(.title)
                                    .bold()
                                    .lineLimit(2)
                                Spacer()
                                ParticipantView(eventIndex: eventIndex)
                            }
                            HStack {
                                ScrollView(.horizontal, showsIndicators: false){
                                    HStack{
                                        ForEach(data.leasureList[data.eventList[eventIndex].eLeasure].lTags){tag in
                                            TagView(tag: tag)
                                        }
                                    }
                                    .padding(.horizontal, 20)
                                }
                                .padding(.horizontal, -20)
                            }
                            
                            TextBox(text: data.eventList[eventIndex].eDesc)
                            HStack{
                                Text("Détail de l'évènement")
                                Spacer()
                            }
                            .font(.headline)
                            MapInfoRow(adress: data.eventList[eventIndex].eLocation, date: data.eventList[eventIndex].eDate)
                                .padding(.horizontal, -20)
                        }
                        .padding(.horizontal, 20)
                        .padding(.bottom, 100)
                    }
                    
                }
                .ignoresSafeArea()
                
                
                VStack {
                    HStack {
                        Button(action: {dismiss()}, label:{
                            Label(title:{
                                Text("Retour").font(.title3)}, icon: {
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
                    if data.eventList[eventIndex].eUsersList.contains(data.user.id) {
                        Button(action: {
                            data.eventList[eventIndex].eUsersList.removeAll { user in
                                user == data.user.id}
                            data.eventList[eventIndex].eActualNumberParticipant -= 1
                        }, label: {
                            FloatingButton(label: "Annuler participation")
                                .confirmationDialog("Annuler ?",
                                  isPresented: $isPresentingConfirm) {
                                    Button("J'annule ma participation", role: .destructive){
                                        data.eventList[eventIndex].eUsersList.append(data.user.id)
                                        data.eventList[eventIndex].eActualNumberParticipant += 1
                                        activeButton = true
                                    }
                                } message: {
                                  Text("Peut-être une prochaine fois ?")
                                }
                        })
                    } else if data.eventList[eventIndex].eActualNumberParticipant > (data.eventList[eventIndex].eMaxU-1) {
                        FloatingButton(label: "Evènement complet")
                    } else {
                        Button(action: {
                            isPresentingConfirm = true
                        }, label: {
                            FloatingButton(label: "Participer")
                                
                        })
                        .confirmationDialog("Êtes-vous sûr ?",
                          isPresented: $isPresentingConfirm) {
                            Button("Je participe"){
                                data.eventList[eventIndex].eUsersList.append(data.user.id)
                                data.eventList[eventIndex].eActualNumberParticipant += 1
                                activeButton = true
                            }
                        } message: {
                          Text("En cliquant sur \"Participer\" vous vous engagez à être présent lors de l'évènement")
                        }
                        .tint(.primary)
                    }
                }
            }
            .toolbar(.hidden, for: .navigationBar)
        
//        .environmentObject(data)  // A enlever quand fini
    }
}

#Preview {
    EcranEvenement(eventIndex: 1)
        .environmentObject(dataDev)
}
