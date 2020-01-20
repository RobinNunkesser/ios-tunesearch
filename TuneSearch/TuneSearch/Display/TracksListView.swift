//
//  TracksListView.swift
//  TuneSearch
//
//  Created by Prof. Dr. Nunkesser, Robin on 15.01.20.
//  Copyright © 2020 Hochschule Hamm-Lippstadt. All rights reserved.
//

import SwiftUI

struct TracksListView: View {
    @EnvironmentObject var viewModel : CollectionsViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.collections, id: \.name) { collection in
                Section(header: Text(collection.name)) {
                    ForEach(collection.tracks, id: \.title) {
                        TrackRow(text: $0.title, detailText: $0.subtitle, url: $0.image)
                    }
                }
            }
        }.navigationBarTitle("Collections")
    }
}

struct TracksListView_Previews: PreviewProvider {
    static var previews: some View {
        TracksListView()
    }
}
