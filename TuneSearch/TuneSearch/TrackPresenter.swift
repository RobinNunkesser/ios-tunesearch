//
//  TrackPresenter.swift
//  TuneSearch
//
//  Created by Prof. Dr. Nunkesser, Robin on 07.01.19.
//  Copyright © 2019 Hochschule Hamm-Lippstadt. All rights reserved.
//

import Foundation

class TrackPresenter: Presenter {
    
    typealias Entity = TrackEntity
    
    typealias ViewModel = TrackViewModel
    
    static func present(entity: TrackEntity) -> TrackViewModel {
        var title = ""
        if let trackNumber = entity.trackNumber {
            title = "\(trackNumber) -"
        }
        if let trackName = entity.trackName {
            title = title + "\(trackName)"
        }
        return TrackViewModel(title: title, subtitle: entity.artistName, image: entity.artworkUrl100)
    }

}
