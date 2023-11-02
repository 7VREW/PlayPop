/*
 Ecran 4: description d'un évènement
 
 Prends un évènement en argument
 
 Non fonctionnel
 */


import SwiftUI

struct EcranEvenementCreate: View {
    @Environment(\.dismiss) private var dismiss
//    @EnvironmentObject var data: Data
    @StateObject var data: Data  // A Enlever quand fini
    @State var eventIndex: Int
    @State private var activeButton = false

    
    @State var eventCreate: Event
    
    var body: some View {
        NavigationStack{
            ZStack(alignment: .center) {
                VStack (spacing: 20){
                    ScrollView{
                        HeadImage(imageList: data.eventList[eventIndex].eImage)
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
                                        ForEach(data.leasureList[data.eventList[eventIndex].eLeasure].lTags){tag in
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
                
                
//                ZStack {
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
                        Button(action: {
                            data.eventList.append(eventCreate)
                                activeButton = true
                            }, label: {FloatingButton(label: "Valider et créer")})
                            .tint(.primary)
                        
                    }
//                }
            }
            .toolbar(.hidden, for: .navigationBar)
        }
        
        .environmentObject(data)  // A enlever quand fini
    }
}

#Preview {
    EcranEvenementCreate(data: data, eventIndex: 2, eventCreate: eventList[0])
}
