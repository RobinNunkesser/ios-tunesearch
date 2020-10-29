import Foundation
import BasicCleanArch

class SearchInteractor : UseCase {
    
    typealias DisplayerType = SearchView
    typealias PresenterType = CollectionsPresenter
    typealias RequestType = SearchRequest

    var presenter: CollectionsPresenter
    var gateway: ITunesSearchGateway
    
    init(presenter : CollectionsPresenter, gateway: ITunesSearchGateway) {
        self.presenter = presenter
        self.gateway = gateway
    }
    
    required convenience init(presenter : CollectionsPresenter) {
        self.init(presenter: presenter, gateway: ITunesSearchGateway())
    }

    func execute(request: SearchRequest, displayer: SearchView, resultCode: Int) {
        gateway.fetchData(searchTerm: request.term, completion:
            {
                switch $0 {
                case let .success(tracks):
                    let collections = self.presenter.present(model: tracks)
                    displayer.display(success: collections,resultCode: resultCode)
                case let .failure(error):
                    displayer.display(failure: error)
                }                
        })
    }
}
