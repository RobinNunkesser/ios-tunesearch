//
//  File.swift
//  
//
//  Created by Prof. Dr. Nunkesser, Robin on 29.10.20.
//

import Foundation

class CollectionEntity {
    let name : String
    let tracks : [TrackEntity]
    
    init(name: String, tracks: [TrackEntity]) {
        self.name = name
        self.tracks = tracks
    }
}


