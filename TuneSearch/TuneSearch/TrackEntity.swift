//
//  Track.swift
//  iTunesHelper
//
//  Created by Prof. Dr. Nunkesser, Robin on 26.10.16.
//  Copyright © 2016 Hochschule Hamm-Lippstadt. All rights reserved.
//

import Foundation

class TrackEntity : NSObject{
    let trackNumber: Int
    let trackCount: Int
    let artistName: String
    let trackName: String
    let collectionName: String
    let discNumber: Int
    let discCount: Int
    let primaryGenreName: String
    let releaseYear: String
    let artworkUrl: URL
    
    init(trackNumber: Int, trackCount: Int, artistName: String, trackName: String, collectionName: String, discNumber: Int, discCount: Int, primaryGenreName: String, releaseYear: String, artworkUrl: URL) {
        self.trackNumber = trackNumber
        self.trackCount = trackCount
        self.artistName = artistName
        self.trackName = trackName
        self.collectionName = collectionName
        self.discNumber = discNumber
        self.discCount = discCount
        self.primaryGenreName = primaryGenreName
        self.releaseYear = releaseYear
        self.artworkUrl = artworkUrl
    }
    
    
    /*
     Code Field
     a Artist
     A Artist (no clobber)
     b BPM
     c Comments
     C Composer
     d Disc Number D Disc Count
     e Played Date
     f File Name (read-only)
     g Genre
     G Genre (no clobber)
     l Album
     L Album (no clobber)
     n Song Name
     p Played Count
     r Grouping
     R Grouping (no clobber)
     t Track Number
     T Track Count
     y Y ear
     0 Nothing (skip the text)
     # Rating (Between 0 and 100)
    
     %t|%T|%a|%n|%l|%d|%D|%g|%y
     */
    override var description : String {
        return "\(trackNumber)|\(trackCount)|\(artistName)|\(trackName)|\(collectionName)|\(discNumber)|\(discCount)|\(primaryGenreName)|\(releaseYear)"
    }
}
