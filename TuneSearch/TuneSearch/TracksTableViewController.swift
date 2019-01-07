//
//  TracksTableViewController.swift
//  TuneSearch
//
//  Created by Prof. Dr. Nunkesser, Robin on 20.12.18.
//  Copyright © 2018 Hochschule Hamm-Lippstadt. All rights reserved.
//

import UIKit

class TracksTableViewController : UITableViewController {
    
    // MARK: - Properties
    
    var items : [String:[TrackViewModel]]!
    var collections : [String] {
        return Array(items.keys)
    }
    
    // MARK: - Methods
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: UITableViewDataSource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return items.keys.count
    }
    
    override func tableView(_ tableView: UITableView,
                            titleForHeaderInSection section: Int) -> String? {
        return collections[section]
    }

    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return items[collections[section]]!.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier:
                "SubtitleCell",
                                                     for: indexPath)
            let item = items[collections[indexPath.section]]![indexPath.row]
            cell.textLabel?.text = item.title
            cell.detailTextLabel?.text = item.subtitle
            return cell
    }
    
}

