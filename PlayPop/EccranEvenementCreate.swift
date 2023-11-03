/*
 Ecran 5: Création d'un événement

 */


import SwiftUI

struct EcranEvenementCreate: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var data: UserData
    
    @Binding var navToProfile: Bool
    @Binding var showCreate: Bool
    
    @State private var activeButton = false
    @State var eventCreate: Event = Event(eLabel: "", eDesc: "", eLeasure: 0, eImage: [], eMinU: 2, eMaxU: 5, eUsersList: [], eLocation: "", eDate: Date(), ePast: false, eActualNumberParticipant: 0)
    
    @State private var isPresentingConfirm: Bool = false
    
    var leasureIndex: Int = 0
    
    var body: some View {
        NavigationStack{
            ZStack(alignment: .center) {
                VStack (spacing: 20){
                    ScrollView{
                        PhotoPicker(photoImages: $eventCreate.eImage)
                        VStack(alignment: .leading, spacing: 15) {
                            HStack {
                                Text("Titre:")
                                    .font(.title2)
                                    .padding(.top)
                                Spacer()
                            }
                            .zIndex(1)
                                .overlay(alignment: .trailing) {
                                    NumberPicker(pMin: $eventCreate.eMinU, pMax: $eventCreate.eMaxU)
                                }
                            TextField(LocalizedStringKey("Titre de l'événement"), text: $eventCreate.eLabel).textFieldStyle(.plain)
                                    .padding()
                                    .background(.ultraThinMaterial)
                                    .clipShape(Capsule())


                                ScrollView(.horizontal, showsIndicators: false){
                                    HStack{
                                        ForEach(data.leasureList[leasureIndex].lTags){tag in
                                            TagView(tag: tag)
                                        }
                                    }
                                    .padding(.horizontal, 20)
                                }
                                .padding(.horizontal, -20)
                                

                            Text("Description:")
                                .font(.title2)
                            TextField(LocalizedStringKey("Description de l'événement"), text: $eventCreate.eDesc).textFieldStyle(.plain)
                                    .padding()
                                    .background(.ultraThinMaterial)
                                    .clipShape(Capsule())
                            
                            Text("Addresse:")
                                .font(.title2)
                            TextField(LocalizedStringKey("Addresse de l'événement"), text: $eventCreate.eLocation).textFieldStyle(.plain)
                                .padding()
                                .background(.ultraThinMaterial)
                                .clipShape(Capsule())
                            DatePicker(
                                "Date:",
                                selection: $eventCreate.eDate,
                                displayedComponents: [.date, .hourAndMinute]
                            )
                            .font(.title2)
                        }
                        .padding(.horizontal, 20)
                        .padding(.bottom, 100)
                       
                    }
                    
                }.keyboardType(.default)
                    .submitLabel(.done)
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
                        
                        if !(eventCreate.eLabel == "" || eventCreate.eDesc == "" || eventCreate.eLocation == "" || eventCreate.eDate < Date.now) {
                            Button(action: {
                                isPresentingConfirm = true
//                                if eventCreate.eImage.count == 0 {
//                                    eventCreate.eImage = data.leasureList[leasureIndex].lImage
//                                }
//                                eventCreate.eLeasure = leasureIndex
//                                eventCreate.eUsersList.append(data.user.id)
//                                eventCreate.eActualNumberParticipant += 1
//                                data.eventList.append(eventCreate)
//                                activeButton = true
//                                navToProfile.toggle()
//                                showCreate.toggle()
                            }, label: {
                                FloatingButton(label: "Valider et créer")
                                    .confirmationDialog("Validation",
                                      isPresented: $isPresentingConfirm) {
                                        Button("Je suis sûr", role: .destructive){
                                            if eventCreate.eImage.count == 0 {
                                                eventCreate.eImage = data.leasureList[leasureIndex].lImage
                                            }
                                            eventCreate.eLeasure = leasureIndex
                                            eventCreate.eUsersList.append(data.user.id)
                                            eventCreate.eActualNumberParticipant += 1
                                            data.eventList.append(eventCreate)
                                            activeButton = true
                                            navToProfile.toggle()
                                            showCreate.toggle()
                                        }
                                    } message: {
                                      Text("En créant un évènement, tu t'engages à y être présent et à l'animer")
                                    }
                            })
                            .tint(.primary)
                        } else {
                            EmptyView()
                                .frame(height: 0)
                        }
                }
            }.interactiveDismissDisabled()
            .toolbar(.hidden, for: .navigationBar)
        }
    }
}

#Preview {
    EcranEvenementCreate(navToProfile: .constant(false), showCreate: .constant(false))
        .environmentObject(dataDev)
}
