import Foundation

/// A `Displayer` is used to display the result of a use case that changes the
/// displayed view.
public protocol Displayer {
    associatedtype ViewModelType

    /// Displays data from a ViewModel or an Error.
    ///
    /// - parameter result: The result to display.
    func display(result : Result<ViewModelType,Error>)
}
