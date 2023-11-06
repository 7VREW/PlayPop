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
            Map(initialPosition: .region(
                MKCoordinateRegion(center: adress.coordinate,
                                   span: MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002)
                                  ))){
                Marker(adress.name, coordinate: adress.coordinate)
                    .tint(Color(.systemOrange))
            }
            .frame(width: 140, height: 150)
            .mapStyle(.standard(elevation: .realistic))
        }
        
        .frame(maxWidth: .infinity)
        .background(.ultraThinMaterial)
    }
}

#Preview {
    MapInfoRow(adress: Location(name: "Simplon", coordinate: CLLocationCoordinate2D(latitude: 43.566543, longitude: 1.397947)), date: Date())
}

extension CLLocationCoordinate2D {
    static let simplonLocation = CLLocationCoordinate2D(latitude: 43.566543, longitude: 1.397947)
}
