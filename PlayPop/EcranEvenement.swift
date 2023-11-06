/*
 Ecran 4: description d'un évènement
 
 Prends un évènement en argument

 */


import SwiftUI

struct EcranEvenement: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var data: UserData
    @State var eventIndex: Int
    @State private var activeButton = false
    @State private var isPresentingConfirm: Bool = false
    
    
    var body: some View {
            ZStack(alignment: .bottom) {
                VStack (spacing: 20){
                    ScrollView{
                        
                        // Affiche les images de l'evenement
                        HeadImage(imageList: data.eventList[eventIndex].eImage)
                        
                        VStack(spacing: 20) {
                            
                            // Le titre et le nomre actuel de participant par rapport au maximum
                            HStack {
                                Text(data.eventList[eventIndex].eLabel)
                                    .font(.title)
                                    .bold()
                                    .lineLimit(2)
                                Spacer()
                                ParticipantView(eventIndex: eventIndex)
                            }
                            
                            // Rappel les tags du loisir
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
                            
                            // Decrit l'evenement
                            TextBox(text: data.eventList[eventIndex].eDesc)
                            HStack{
                                Text("Détail de l'évènement")
                                Spacer()
                            }
                            .font(.headline)
                            
                            // Affiche l'adress et la date de l'evenemtn (carte Placeholder)
                            MapInfoRow(adress: data.eventList[eventIndex].eLocation, date: data.eventList[eventIndex].eDate)
                                .padding(.horizontal, -20)
                        }
                        .padding(.horizontal, 20)
                        .padding(.bottom, 100)
                    }
                    
                }
                .ignoresSafeArea()
                
                
                    NavigationLink(destination: EcranProfile(), isActive: $activeButton, label: {EmptyView()})
                
                // Affiche différents boutons en fonction du statut de participation de l'utilisateur et du statut de l'evenement
                    if data.eventList[eventIndex].eUsersList.contains(data.user.id) {
                        Button(action: {
                            data.eventList[eventIndex].eUsersList.removeAll { user in
                                user == data.user.id}
                            data.eventList[eventIndex].eActualNumberParticipant -= 1
                        }, label: {
                            FloatingButton(label: "Annuler participation")
                                .padding(.bottom, 40)
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
                            .padding(.bottom, 40)
                    } else {
                        Button(action: {
                            isPresentingConfirm = true
                        }, label: {
                            FloatingButton(label: "Participer")
                                .padding(.bottom, 40)
                                
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
            .toolbar {
                ToolbarItem (placement: .navigationBarTrailing) {
                    ProfileButton()
                        .buttonStyle(CustomButtonAnimation())
                }
                ToolbarItem(placement: .navigationBarLeading) {
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
            }
            .navigationBarBackButtonHidden()
            .toolbarBackground(.hidden, for: .navigationBar)
        
        

    }
}

#Preview {
    EcranEvenement(eventIndex: 1)
        .environmentObject(dataDev)
}
