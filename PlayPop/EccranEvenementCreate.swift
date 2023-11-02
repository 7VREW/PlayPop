/*
 Ecran 5: Création d'un événement

 */


import SwiftUI

struct EcranEvenementCreate: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var data: Data
    
    @Binding var navToProfile: Bool
    @Binding var showCreate: Bool
    
    @State private var activeButton = false
    @State var eventCreate: Event = Event(eLabel: "", eDesc: "", eLeasure: 0, eImage: [], eMinU: 2, eMaxU: 2, eUsersList: [], eLocation: "", eDate: Date(), ePast: false, eActualNumberParticipant: 0)
    
    var leasureIndex: Int = 0
    
    var body: some View {
        NavigationStack{
            ZStack(alignment: .center) {
                VStack (spacing: 20){
                    ScrollView{
                        HeadImage(imageList: eventCreate.eImage)
                        VStack(alignment: .leading, spacing: 15) {
                            HStack {
                                Text("Titre:")
                                    .font(.title2)
                                    .padding(.top)
                                Spacer()
                            }
                            .zIndex(1)
                                .overlay(alignment: .trailing) {
                                    NumberPicker(pMin: eventCreate.eMinU, pMax: eventCreate.eMaxU)
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
                                }
                                

                            Text("Description:")
                                .font(.title2)
                            TextField(LocalizedStringKey("Description de l'événement"), text: $eventCreate.eDesc).textFieldStyle(.plain)
                                    .padding()
                                    .background(.ultraThinMaterial)
                                    .clipShape(Capsule())
                            
                            .font(.headline)
                            Text("Addresse:")
                                .font(.title2)
                            TextField(LocalizedStringKey("Addresse de l'événement"), text: $eventCreate.eLocation).textFieldStyle(.plain)
                                .padding()
                                .background(.ultraThinMaterial)
                                .clipShape(Capsule())
                        }
                        .padding(.horizontal, 20)
                       
                    }
                    
                }
                .ignoresSafeArea()
                    VStack {
                        HStack {
                            Button(action: {dismiss()}, label:{
                                Label(title:{
                                    Text(data.leasureList[leasureIndex].lLabel).font(.title3)}, icon: {
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
                        
                        if !(eventCreate.eLabel == "" || eventCreate.eDesc == "" || eventCreate.eLocation == "") {
                            Button(action: {
                                eventCreate.eLeasure = leasureIndex
                                eventCreate.eImage = data.leasureList[leasureIndex].lImage
                                eventCreate.eUsersList.append(data.user.pName)
                                eventCreate.eActualNumberParticipant += 1
                                data.eventList.append(eventCreate)
                                data.user.pEvents.append(eventCreate)
                                data.leasureList[leasureIndex].lEvents.append(eventCreate)
                                activeButton = true
                                navToProfile.toggle()
                                showCreate.toggle()
                            }, label: {FloatingButton(label: "Valider et créer")})
                            .tint(.primary)
                        }
                }
            }.interactiveDismissDisabled()
            .toolbar(.hidden, for: .navigationBar)
        }
    }
}

//#Preview {
//    EcranEvenementCreate(data: data, eventIndex: 2, eventCreate: eventList[0])
//}
