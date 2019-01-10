//  OutputBoundary.swift

import Foundation

protocol OutputBoundary {
    associatedtype ViewModelType    
    func receive(response : Response<ViewModelType>)
}
