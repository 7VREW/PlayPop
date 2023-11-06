/*
 Ecran 5: Création d'un événement

 */

import SwiftUI
import MapKit

struct EcranEvenementCreate: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var data: UserData
    
    @Binding var navToProfile: Bool
    @Binding var showCreate: Bool
    
    @State private var activeButton = false
    @State private var showMapPicker = false
    @State var eventCreate: Event = Event(eLabel: "", eDesc: "", eLeasure: 0, eImage: [], eMinU: 2, eMaxU: 5, eUsersList: [], eLocation: Location(name: "", coordinate: CLLocationCoordinate2D(latitude: 0, longitude: 0)), eDate: Date().addingTimeInterval(84600), ePast: false, eActualNumberParticipant: 0)
    
    @State private var isPresentingConfirm: Bool = false
    
    @State var pickerID: Int = 0
    
    var leasureIndex: Int = 0
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                ScrollView{
                    VStack (spacing: 20){
                        
                        // Permet d'ajouter des images pour un événement, sinon se remplit avec les images par defaut du loisir
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
                                
                                // Permet de selectionner une tranche de participants
                                NumberPicker(pMin: $eventCreate.eMinU, pMax: $eventCreate.eMaxU)
                            }
                            TextField(LocalizedStringKey("Titre de l'événement"), text: $eventCreate.eLabel).textFieldStyle(.plain)
                                .padding()
                                .background(.ultraThinMaterial)
                                .clipShape(Capsule())
                            
                            // Rappel les tags du loisir
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
                            Button(action: {
                                showMapPicker.toggle()
                            }, label: {
                                HStack {
                                    Text("Selectionner une adresse")
                                        .foregroundStyle(.secondary)
                                    Spacer()
                                }.padding()
                                .background(.ultraThinMaterial)
                                .clipShape(Capsule())
                                
                            }).tint(.primary)
//                            TextField(LocalizedStringKey("Addresse de l'événement"), text: $eventCreate.eLocation).textFieldStyle(.plain)
//                                .padding()
//                                .background(.ultraThinMaterial)
//                                .clipShape(Capsule())
                           
                            
                            DatePicker(
                                "Date:",
                                selection: $eventCreate.eDate,
                                displayedComponents: [.date, .hourAndMinute]
                            )
                            .id(pickerID)
                            .font(.title2)
                        }
                        .padding(.horizontal, 20)
                        .padding(.bottom, 100)
                        
                    }.padding(.bottom, 20)
                    
                }.ignoresSafeArea(edges: .top)
                    .keyboardType(.default)
                    .submitLabel(.done)
                
                NavigationLink(destination: EcranProfile(), isActive: $activeButton, label: {EmptyView()})
                
                
                // Affiche le bouton valider uniquement si tous les champs sont remplis
                if !(eventCreate.eLabel == "" || eventCreate.eDesc == "" || (eventCreate.eLocation.coordinate.latitude == 0 && eventCreate.eLocation.coordinate.longitude == 0) || eventCreate.eDate < Date.now) {
                    Button(action: {
                        pickerID += 1
                        DispatchQueue.main.async {
                            isPresentingConfirm = true
                        }
                    }, label: {
                        FloatingButton(label: "Valider et créer")
                    })
                    .tint(.primary)
                    .padding(.bottom, 80)
                } else {
                    EmptyView()
                        .frame(height: 0)
                }
                
            }.ignoresSafeArea()
                .toolbar {
                    ToolbarItem (placement: .navigationBarTrailing) {
                        ProfileButton()
                            .buttonStyle(CustomButtonAnimation())
                    }
                    ToolbarItem(placement: .topBarLeading) {
                        Button(action: {dismiss()}, label:{
                            HStack{
                                Image(systemName: "xmark")
                                    .font(.headline)
                                Text("Annuler")
                                    .font(.title3)
                            }
                            .padding(.horizontal)
                            .padding(.vertical, 6)
                            .background(.ultraThinMaterial)
                            .clipShape(Capsule())
                        })
                        .tint(.primary)
                    }
                }
                .interactiveDismissDisabled()
                .actionSheet(isPresented: $isPresentingConfirm, content: {
                    ActionSheet(title: Text("Je m'engage à être présent et à animer l'évènement."), buttons: [
                        .default(Text("Confirmer"), action: {
                            if eventCreate.eImage.isEmpty {
                                eventCreate.eImage = data.leasureList[leasureIndex].lImage
                            }
                            eventCreate.eLeasure = leasureIndex
                            eventCreate.eUsersList.append(data.user.id)
                            eventCreate.eActualNumberParticipant += 1
                            data.eventList.append(eventCreate)
                            activeButton = true
                            navToProfile.toggle()
                            showCreate.toggle()
                        }),
                        .cancel()
                    ])
                    
                })
                .sheet(isPresented: $showMapPicker, 
                       content: {
                    EcranAddressFinder()
                })
        }
    }
}

#Preview {
    EcranEvenementCreate(navToProfile: .constant(false), showCreate: .constant(false))
        .environmentObject(dataDev)
}
