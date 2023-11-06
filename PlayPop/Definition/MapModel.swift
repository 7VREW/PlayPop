//
//  MapModel.swift
//  PlayPop
//
//  Created by Émilio Williame on 06/11/2023.
//

import Foundation
import MapKit

struct Address: Codable {
    let data: [Datum]
}

struct Datum: Codable {
    let latitude, longitude: Double
    let label: String?
}

struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

class MapAPI: ObservableObject {
    private let BASE_URL = "http://api.positionstack.com/v1/forward"
    private let API_KEY = "323b9b9420fccceb2b8f0642b65bbae7"
    
    @Published var region: MKCoordinateRegion
    @Published var coordinates = []
    @Published var locations: [Location] = []
    
    init() {
        self.region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 43.566543, longitude: 1.397947), //loc de base
                                         span: MKCoordinateSpan(latitudeDelta: 43.566543, longitudeDelta: 5)) //zoom sur la carte
    }
    
    func getLocation(adress: String, delta: Double) async throws {
        let pAddress = adress.replacingOccurrences(of: "", with: "%20")
        let url_string = "\(BASE_URL)?access_key=\(API_KEY)&query=\(pAddress)"
        
        guard let url = URL(string: url_string) else {
            print("Invalid URL")
            return
        }
        do {
        let (data, _) = try await URLSession.shared.data(from: url)
            
            guard let newCoordinates = try? JSONDecoder().decode(Address.self, from: data) else { return }
            
            if newCoordinates.data.isEmpty {
                throw "Could not find the adress..."
            }
            
            DispatchQueue.main.async {
                let details = newCoordinates.data[0]
                let lat = details.latitude
                let lon = details.longitude
                let name = details.label
                
                self.coordinates = [lat, lon]
                self.region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: lat, longitude: lon), //loc de base
                                                 span: MKCoordinateSpan(latitudeDelta: delta, longitudeDelta: delta)) //zoom sur la carte
                
                let new_location = Location(name: name ?? "Pin", coordinate: CLLocationCoordinate2D(latitude: lat, longitude: lon))
                self.locations.removeAll()
                self.locations.insert(new_location, at: 0)
                
                print("Succesfully loaded the location!")
            }
        } catch (let error) {
            print(error.localizedDescription)
            throw error
        }
    }
}

extension String: LocalizedError {
    public var errorDescription: String? {return self}
}
