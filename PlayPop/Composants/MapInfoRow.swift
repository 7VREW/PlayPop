//
//  EventMapInfos.swift
//  PlayPop
//
//  Created by Émilio Williame on 30/10/2023.
//

import SwiftUI
import MapKit

struct MapInfoRow: View {
    
    @State private var position: MapCameraPosition = .automatic

        var body: some View {
            HStack {
                VStack(alignment: .leading) {
                    Text("2 Rue Raymond Lizop, 31100 Toulouse")
                        .font(.title3)
                        .lineLimit(2)
                        .fontWeight(.bold)
                }
                .padding()
                Spacer()
                Map {
                            Marker("Simplon", coordinate: .simplonLocation)
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
    MapInfoRow()
}

extension CLLocationCoordinate2D {
    static let simplonLocation = CLLocationCoordinate2D(latitude: 43.566543, longitude: 1.397947)
}
