import Foundation

/// A `Presenter` is used to get a ViewModel from Entities or other Models.
public protocol Presenter {
    
    associatedtype Model
    associatedtype ViewModel
    
    /// Takes data from an Entity or another Model and returns a ViewModel.
    ///
    /// - parameter model: The model to present.
    /// - returns: The ViewModel.
    func present(model: Model) -> ViewModel
}
