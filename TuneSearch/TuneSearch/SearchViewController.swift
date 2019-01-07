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
    var orderedTracks : [String:[TracksTableViewController.ViewModel]] = [:]
    
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "TracksSegue" {
            let destination = segue.destination as! TracksTableViewController
            destination.items = orderedTracks
        }
        
    }
    
    func receive(response: Response<[TrackEntity]>) {
        switch response {
        case let .success(tracks):
            for track in tracks.sorted() {
                if !orderedTracks.keys.contains(track.collectionName) {
                    orderedTracks[track.collectionName] = []
                }
                orderedTracks[track.collectionName]!.append(TracksTableViewController.ViewModel(title: track.trackName, subtitle: track.artistName))
            }
            performSegue(withIdentifier: "TracksSegue", sender: self)
        case let .failure(error):
            self.present(error: error, handler: nil)
        }
    }
}

