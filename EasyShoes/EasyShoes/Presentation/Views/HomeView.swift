//
//  HomeView.swift
//  EasyShoes
//
//  Created by Alumno on 23/05/25.
//

import SwiftUI

struct HomeView: View {
    
    @State var search = ""
    
    let genders = ["All", "Men", "Women", "Kids"]
    
    var body: some View {
        VStack (spacing: 20){
            
            Search(search: $search)
            Banner()
            
            Spacer()

                
        }
        .padding()
        
    }
}

#Preview {
    HomeView()
}
