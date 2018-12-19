import Foundation

class Interactor : InputBoundary {
    typealias OutputBoundaryType = SearchViewController
    typealias RequestType = SearchRequest
    
    func send(request: SearchRequest,
              outputBoundary: SearchViewController) {
        ITunesSearchGateway().fetchData(searchTerm: request.term, completion:
            {outputBoundary.receive(response: $0)})
    }
}
