//  OutputBoundary.swift

import Foundation

protocol OutputBoundary {
    associatedtype EntityType    
    func receive(response : Response<EntityType>)
}
