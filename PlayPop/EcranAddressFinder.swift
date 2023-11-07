//
//  EcranAddressFinder.swift
//  PlayPop
//
//  Created by Émilio Williame on 06/11/2023.
//

import SwiftUI
import MapKit

struct EcranAddressFinder: View {
    
    @Environment (\.dismiss) private var dismiss
    
    @StateObject private var mapAPI = MapAPI()
    
    @State private var text = ""
    
    @Binding var newLoc: Location
    
    @FocusState private var nameIsFocused: Bool
    
    var body: some View {
        
        ZStack (alignment: .bottom) {
            VStack {
                TextField("Entrer une adresse", text: $text)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)
                    .focused($nameIsFocused)
                    .keyboardType(.default)
                        .submitLabel(.done)
                
                
                Button("Chercher") {
                    Task {
                        nameIsFocused = false
                        do {
                            try await mapAPI.getLocation(adress: text, delta: 0.004)
                        } catch (let error) {
                            print(error.localizedDescription)
                            throw error
                        }
                    }
                }
                .tint(Color(.systemOrange))
                
                Map(coordinateRegion: $mapAPI.region, annotationItems: mapAPI.locations) {
                    location in
                    MapMarker(coordinate: location.coordinate, tint: .orange)
                }
            }.padding(.top, 30)
                .interactiveDismissDisabled()
            if !mapAPI.locations.isEmpty {
                Button(action: {
                    newLoc = mapAPI.locations[0]
                    dismiss()
                }, label: {
                    FloatingButton(label: "Valider")
                        .tint(.primary)
                        .padding(.bottom, 80)
                })
            } else {
                EmptyView()
            }
            
        } .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    EcranAddressFinder(newLoc: .constant(Location(name: "Pin", coordinate: CLLocationCoordinate2D(latitude: 43.566543, longitude: 1.397947))))
}
