//
//  ShowsRepository.swift
//  FreshlyPressed
//
//  Created by Jose Cruz Perez Pi on 16/2/23.
//  Copyright © 2023 Automattic. All rights reserved.
//

import Foundation
import Alamofire

protocol ShowsRepositoryProtocol: AnyObject {
    func loadShows(page: Int, completion: @escaping ((_ shows: [Show]?, _ error: Error?) -> Void))
}

enum ShowsError: Error {
    case noInternet
}

class ShowsRepository: ShowsRepositoryProtocol {
    
    enum ShowsRepositoryError: Error {
        case errorData
    }
    
    func loadShows(page: Int, completion: @escaping ((_ shows: [Show]?, _ error: Error?) -> Void)) {
        guard let networkReachability = NetworkReachabilityManager(), networkReachability.isReachable else {
            completion(nil, ShowsError.noInternet)
            return
        }
        
        let parameters: Parameters = [
            "page": page
        ]
        
        let request = AF.request(URLConstants.showsUrl,
                                 method: .get,
                                 parameters: parameters,
                                 encoding: URLEncoding(destination: .queryString))
        
        request.response { response in
            switch response.result {
            case .success(let data):
                do {
                    let shows = try JSONDecoder().decode([ShowDTO].self, from: data!)
                    completion([], nil)
                }
                catch {
                    completion(nil, ShowsRepositoryError.errorData)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
