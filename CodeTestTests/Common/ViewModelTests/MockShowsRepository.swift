//
//  MockShowsRepository.swift
//  CodeTestTests
//
//  Copyright © 2023 Jose Cruz Perez Pi. All rights reserved.
//

import Foundation
@testable import CodeTest

class MockShowsRepository: ShowsRepositoryProtocol {
    enum ShowsError: Error {
        case noInternet
    }

    var mockedData: [Show]? = nil
    var mockedError: Error? = nil
    
    func loadShows(page: Int, completion: @escaping ((_ shows: [Show]?, _ error: Error?) -> Void)) {
        completion(mockedData, mockedError)
    }
}
