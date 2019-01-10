//
//  ViewController.swift
//  TuneSearch
//
//  Created by Prof. Dr. Nunkesser, Robin on 19.12.18.
//  Copyright © 2018 Hochschule Hamm-Lippstadt. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, OutputBoundary {
    typealias ViewModelType = [String:[TrackViewModel]]
    var orderedTracks : [String:[TrackViewModel]] = [:]
    
    @IBOutlet weak var searchTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func search(_ sender: UIButton) {
        orderedTracks = [:]
        Interactor().send(request: SearchRequest(term: searchTextField.text!), outputBoundary: self)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return identifier != "TracksSegue"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "TracksSegue" {
            let destination = segue.destination as! TracksTableViewController
            destination.items = orderedTracks
        }
        
    }
    
    func receive(response: Response<[String:[TrackViewModel]]>) {
        switch response {
        case let .success(result):
            orderedTracks = result
            performSegue(withIdentifier: "TracksSegue", sender: self)
        case let .failure(error):
            self.present(error: error, handler: nil)
        }
    }
}
