//
//  CollectionsPresenter.swift
//  TuneSearch
//
//  Created by Prof. Dr. Nunkesser, Robin on 16.01.20.
//  Copyright © 2020 Hochschule Hamm-Lippstadt. All rights reserved.
//

import Foundation
import BasicCleanArch

class CollectionsPresenter : Presenter {
    typealias Model = [TrackEntity]
    typealias ViewModel = [CollectionViewModel]
    
    let presenter = TrackPresenter()
    
    func present(model: [TrackEntity]) -> [CollectionViewModel] {
        var collections : [String:CollectionViewModel] = [:]
        for track in model.sorted() {
            if !collections.keys.contains(track.collectionName) {
                collections[track.collectionName] = CollectionViewModel(name: track.collectionName, tracks: [])
            }
            collections[track.collectionName]!.tracks.append(presenter.present(model: track))
        }
        let values = Array(collections.values)
        return values
    }

}
