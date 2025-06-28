//
//  GoogleMapHelper.swift
//  FoodLab
//
//  Created by Alumno on 27/06/25.
//

import GoogleMaps

class GoogleMapHelper {
    static let shared = GoogleMapHelper()
    
    private init() {
        GMSServices.provideAPIKey("AIzaSyBZK2NdMnF8-Ah1aC_rriyeS8qFizf8HZI")
    }
}
