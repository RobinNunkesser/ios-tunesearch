//
//  Presenter.swift
//
//  Created by Prof. Dr. Nunkesser, Robin on 06.07.17.
//  Copyright © 2017 Hochschule Hamm-Lippstadt. All rights reserved.
//

import Foundation

protocol Presenter {
    
    associatedtype Entity
    associatedtype ViewModel
    
    static func present(entity: Entity) -> ViewModel
}
