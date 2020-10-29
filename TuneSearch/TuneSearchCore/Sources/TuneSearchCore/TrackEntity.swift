//  Created by Prof. Dr. Nunkesser, Robin on 26.10.16.
//  Copyright © 2016 Hochschule Hamm-Lippstadt. All rights reserved.
//

import Foundation

class TrackEntity : Codable, Comparable {
    static func < (lhs: TrackEntity, rhs: TrackEntity) -> Bool {
        if lhs.collectionName != rhs.collectionName {
            return lhs.collectionName < rhs.collectionName
        }
        if lhs.discNumber != rhs.discNumber {
            return lhs.discNumber ?? 0 < rhs.discNumber ?? 0
        }
        return lhs.trackNumber ?? 0 < rhs.trackNumber ?? 0
    }
    
    static func == (lhs: TrackEntity, rhs: TrackEntity) -> Bool {
        return (lhs.collectionName == rhs.collectionName) &&
            (lhs.trackNumber == rhs.trackNumber) &&
        (lhs.discNumber == rhs.discNumber)
    }
    
    let trackNumber: Int?
    let artistName: String
    let trackName: String?
    let collectionName: String
    let discNumber: Int?
    let artworkUrl: URL
    
    init(artistName: String, collectionName: String, trackName: String, trackNumber: Int, discNumber: Int, artworkUrl: URL) {
        self.trackNumber = trackNumber
        self.artistName = artistName
        self.trackName = trackName
        self.collectionName = collectionName
        self.discNumber = discNumber
        self.artworkUrl = artworkUrl
    }
 
}
