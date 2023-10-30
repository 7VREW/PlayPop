//
//  EventMapInfos.swift
//  PlayPop
//
//  Created by Émilio Williame on 30/10/2023.
//

import SwiftUI
import MapKit

struct EventMapInfos: View {
    @State private var position: MapCameraPosition = .automatic

        var body: some View {
            HStack {
                VStack(alignment: .leading) {
                    Text("16 rue nana nana")
                        .font(.title2)
                        .fontWeight(.bold)
                    Text("3h de jeu de 14h à 17h")
                        .foregroundStyle(.white)
                        .padding(2)
                        .padding(.horizontal, 8)
                        .background(Color(.systemGray4))
                        .clipShape(Capsule())
                    Text("Zéro matériel requis")
                        .foregroundStyle(.white)
                        .padding(2)
                        .padding(.horizontal, 8)
                        .background(Color(.systemGray4))
                        .clipShape(Capsule())
                }
                .padding()
                Spacer()
                Map {
                            Marker("Empire state building", coordinate: .empireStateBuilding)
                                .tint(.orange)
                            Annotation("Columbia University", coordinate: .columbiaUniversity) {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 5)
                                        .fill(Color.teal)
                                    Text("🎓")
                                        .padding(5)
                                }
                            }
                        }
                    .frame(width: 135, height: 140)
            }
            .frame(maxWidth: .infinity)
            .background(.ultraThinMaterial)
        }
    }

#Preview {
    EventMapInfos()
}

extension CLLocationCoordinate2D {
    static let simplonLocation = CLLocationCoordinate2D(latitude: 40.7063, longitude: -74.1973)
    static let empireStateBuilding = CLLocationCoordinate2D(latitude: 40.7484, longitude: -73.9857)
    static let columbiaUniversity = CLLocationCoordinate2D(latitude: 40.8075, longitude: -73.9626)
}
