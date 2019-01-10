import Foundation

class Interactor : InputBoundary {
    typealias OutputBoundaryType = SearchViewController
    typealias RequestType = SearchRequest
    
    func send(request: SearchRequest,
              outputBoundary: SearchViewController) {
        ITunesSearchGateway().fetchData(searchTerm: request.term, completion:
            {
                switch $0 {
                case let .success(tracks):
                    var orderedTracks : [String:[TrackViewModel]] = [:]
                    for track in tracks.sorted() {
                        if !orderedTracks.keys.contains(track.collectionName) {
                            orderedTracks[track.collectionName] = []
                        }
                        orderedTracks[track.collectionName]!.append(TrackPresenter.present(entity: track))
                    }
                    outputBoundary.receive(response: Response.success(orderedTracks))
                case let .failure(error):
                    outputBoundary.receive(response: Response.failure(error))
                }                
        })
    }
}
