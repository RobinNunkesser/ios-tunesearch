//  InputBoundary.swift

import Foundation

protocol InputBoundary {
    associatedtype OutputBoundaryType : OutputBoundary
    associatedtype RequestType : Request
    func send(request : RequestType, outputBoundary : OutputBoundaryType)
}
