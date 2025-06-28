//
//  UIState.swift
//  FoodLab
//
//  Created by Alumno on 27/06/25.
//

enum UIState<T> {
    
    case initialState
    
    case loadingState
    
    case succesState(T)
    
    case failureState(String)
}
