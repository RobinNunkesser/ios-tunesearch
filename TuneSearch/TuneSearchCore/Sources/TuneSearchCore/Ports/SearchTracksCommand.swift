//
//  File.swift
//  
//
//  Created by Prof. Dr. Nunkesser, Robin on 04.12.20.
//

import Foundation
import ExplicitArchitecture

protocol SearchTracksCommand : Command where outDTOType == [CollectionEntity], inDTOType == SearchTracksDTO {
    
    
}
