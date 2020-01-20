//
//  TracksViewModel.swift
//  TuneSearch
//
//  Created by Prof. Dr. Nunkesser, Robin on 15.01.20.
//  Copyright © 2020 Hochschule Hamm-Lippstadt. All rights reserved.
//

import Foundation

class CollectionsViewModel : ObservableObject {
    @Published var collections : [CollectionViewModel] = []
    
    @Published var tracks : [TrackViewModel] = []
    
    @Published var items : [String:[TrackViewModel]]!
    /*var collections : [String] {
        return Array(items.keys)
    }*/
}
