//
//  ResultsEntity.swift
//  TuneSearch
//
//  Created by Prof. Dr. Nunkesser, Robin on 20.12.18.
//  Copyright © 2018 Hochschule Hamm-Lippstadt. All rights reserved.
//

import Foundation

class ResultsEntity: Decodable {
    let results: [TrackEntity]
}
