//
//  ContentView.swift
//  TuneSearch
//
//  Created by Prof. Dr. Nunkesser, Robin on 15.01.20.
//  Copyright © 2020 Hochschule Hamm-Lippstadt. All rights reserved.
//

import SwiftUI
import BasicCleanArch

struct SearchView: View, Displayer {
    typealias ViewModelType = [CollectionViewModel]
    
    @State var searchText = "Jack Johnson"
    @State var navigate : Bool?
    @State private var showError = false
    @State private var errorText = ""

    var collectionsViewModel = CollectionsViewModel()
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                TextField("Searchterm", text: $searchText)
                NavigationLink(destination: TracksListView().environmentObject(collectionsViewModel), tag: true, selection: $navigate) {
                    Button(action: startSearch) {
                        Text("Search")
                    }
                }
            }
            .padding(.horizontal)
            .alert(isPresented: $showError) { () -> Alert in
                Alert(title: Text("Error"), message: Text(errorText),
                      dismissButton: .cancel(Text("OK")))
            }
            .navigationBarTitle("Search")
        }
    }
    
    func startSearch() {
        SearchInteractor(presenter: CollectionsPresenter()).execute(request: SearchRequest(term: searchText), displayer: self)
    }
    
    func display(failure: Error) {
        errorText = failure.localizedDescription
        showError.toggle()
    }
    
    func display(success: [CollectionViewModel], resultCode: Int) {
        collectionsViewModel.collections = success
        self.navigate = true
    }
    
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
