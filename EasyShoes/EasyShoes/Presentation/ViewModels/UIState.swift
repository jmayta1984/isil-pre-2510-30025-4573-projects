//
//  UIState.swift
//  EasyShoes
//
//  Created by Alumno on 6/06/25.
//


enum UIState <T: Equatable> : Equatable {
    
    case initialState
    
    case loadingState
    
    case successState(T)
    
    case failureState(String)
}
