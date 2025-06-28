//
//  GoogleMapView.swift
//  FoodLab
//
//  Created by Alumno on 27/06/25.
//

import SwiftUI
import GoogleMaps

struct GoogleMapView: UIViewRepresentable {
   

    let latitude: CLLocationDegrees = -12.125829
    let longitude: CLLocationDegrees = -77.0248555
    let zoom: Float = 15
    
    func makeUIView(context: Context) -> GMSMapView {
        let camera = GMSCameraPosition(latitude: latitude, longitude: longitude, zoom: zoom)
        
        let options = GMSMapViewOptions()
        options.camera = camera
        
        let mapview = GMSMapView(options: options)
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        marker.title = "ISIL"
        marker.snippet = "Campus Miraflores"
        marker.map = mapview
        
        return mapview
    }
    func updateUIView(_ uiView: GMSMapView, context: Context) {
        
    }
    
}
