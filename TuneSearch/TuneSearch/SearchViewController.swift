//
//  ViewController.swift
//  TuneSearch
//
//  Created by Prof. Dr. Nunkesser, Robin on 19.12.18.
//  Copyright © 2018 Hochschule Hamm-Lippstadt. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, OutputBoundary {
    typealias EntityType = [TrackEntity]
    
    @IBOutlet weak var searchTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func search(_ sender: UIButton) {
        Interactor().send(request: SearchRequest(term: searchTextField.text!), outputBoundary: self)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return identifier != "TracksSegue"
    }
    
    func receive(response: Response<[TrackEntity]>) {
        switch response {
        case let .success(tracks):
            debugPrint(tracks)
            performSegue(withIdentifier: "TracksSegue", sender: self)
        case let .failure(error):
            self.present(error: error, handler: nil)
        }
    }
}

