//
//  EcranAddressFinder.swift
//  PlayPop
//
//  Created by Émilio Williame on 06/11/2023.
//

import SwiftUI
import MapKit

struct EcranAddressFinder: View {
    @StateObject private var mapAPI = MapAPI()
    @State private var text = ""
    
    var body: some View {
        VStack {
            TextField("Entrer une adresse", text: $text)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
            
            Button("Chercher") {
                mapAPI.getLocation(adress: text, delta: 0.004)
            }
            .tint(Color(.systemOrange))
            
            Map(coordinateRegion: $mapAPI.region, annotationItems: mapAPI.locations) {
                location in
                MapMarker(coordinate: location.coordinate, tint: .orange)
            }
        }.padding(.top, 30)
    }
}

#Preview {
    EcranAddressFinder()
}
