//
//  ContactDetailViewModel.swift
//  AgendaMVVM
//
//  Created by Alumno on 16/05/25.
//

import Foundation

class ContactDetailViewModel: ObservableObject {
    @Published var name = ""
    @Published var phone = ""
    @Published var company = ""
    
}
