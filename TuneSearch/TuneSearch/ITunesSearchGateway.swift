//
//  ITunesSearchGateway.swift
//  TuneSearch
//
//  Created by Prof. Dr. Nunkesser, Robin on 19.12.18.
//  Copyright © 2018 Hochschule Hamm-Lippstadt. All rights reserved.
//

import Foundation
import Alamofire

class ITunesSearchGateway {
    let baseURLString = "https://itunes.apple.com/search"
        
    func restURL(_ parameters: [String:String]?) -> URL? {
        var components = URLComponents(string: baseURLString)!
        var queryItems = [URLQueryItem]()
        if let additionalParams = parameters {
            for (key,value) in additionalParams {
                let item = URLQueryItem(name: key, value: value)
                queryItems.append(item)
            }
        }
        components.queryItems = queryItems
        return components.url!
    }
    
    func fetchData(searchTerm: String, completion: @escaping (Swift.Result<[TrackEntity],Error>) -> Void) {
        if let url = restURL(["term":"\(searchTerm)","entity":"song","country":"de"]) {
            Alamofire.request(url)
                .validate()
                .responseJSON {
                    response in
                    switch response.result {
                    case .success:
                        do {
                            let decoder = JSONDecoder()
                             let items = try decoder.decode(ResultsEntity.self,
                             from: response.data!)
                            completion(Swift.Result<[TrackEntity],Error>.success(items.results))
                        } catch {
                            completion(Swift.Result.failure(error))
                        }
                    case .failure(let error):
                        completion(Swift.Result.failure(error))
                    }
            }
        }
    }
        //ITunesSearchAPI.restURL(["term":"\(artist) \(album)","entity":"song","country":"de"])
}
