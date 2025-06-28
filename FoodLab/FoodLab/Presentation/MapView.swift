//
//  MapView.swift
//  FoodLab
//
//  Created by Alumno on 27/06/25.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    let latitude: CLLocationDegrees = -12.125829
    let longitude: CLLocationDegrees = -77.0248555
    
    var body: some View {
        Map {
            Marker("ISIL", coordinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude ))
        }
    }
}

#Preview {
    MapView()
}
