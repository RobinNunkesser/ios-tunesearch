//  OutputBoundary.swift
//  AsynchronRecipe

import Foundation

protocol OutputBoundary {
    associatedtype EntityType    
    func receive(response : Response<EntityType>)
}
