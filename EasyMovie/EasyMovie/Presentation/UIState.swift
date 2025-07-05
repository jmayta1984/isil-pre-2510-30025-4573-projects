//
//  UIState.swift
//  EasyMovie
//
//  Created by Alumno on 4/07/25.
//

enum UIState<T> {
    case initialState
    case loadingState
    case successState(T)
    case failureState(String)
}
