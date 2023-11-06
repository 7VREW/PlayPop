//
//  EventMapInfos.swift
//  PlayPop
//
//  Created by Émilio Williame on 30/10/2023.
//

import SwiftUI
import MapKit

struct MapInfoRow: View {
    
    var adress: Location
    var date: Date

    @State private var position: MapCameraPosition = .automatic

    var body: some View {
        HStack {
            
            // Adresse et date
            VStack(alignment: .leading, spacing: 10) {
                Text(adress.name)
                    .font(.title3)
                    .lineLimit(2)
                    .fontWeight(.bold)
                Text(date.formatted(.dateTime.day().month().year().hour().minute()))
            }
                .padding()
            Spacer()
            
            // Affichage de la carte
            Map {
                Marker(adress.name, coordinate: adress.coordinate)
                    .tint(.orange)
            }
            .mapStyle(.hybrid(elevation: .realistic))
            .frame(width: 140, height: 150)
        }
        
        .frame(maxWidth: .infinity)
        .background(.ultraThinMaterial)
    }
}

#Preview {
    MapInfoRow(adress: Location(name: "London", coordinate: CLLocationCoordinate2D(latitude: 51.50, longitude: -0.1275)), date: Date())
}

extension CLLocationCoordinate2D {
    static let simplonLocation = CLLocationCoordinate2D(latitude: 43.566543, longitude: 1.397947)
}
