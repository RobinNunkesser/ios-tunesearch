//  InputBoundary.swift

import Foundation

protocol InputBoundary {
    associatedtype OutputBoundaryType : OutputBoundary
    associatedtype RequestType
    func send(request : RequestType, outputBoundary : OutputBoundaryType)
}
