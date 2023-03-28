//
//  MockedShows.swift
//  CodeTestTests
//
//  Copyright © 2023 Jose Cruz Perez Pi. All rights reserved.
//

import Foundation
@testable import CodeTest

struct MockedShows {
    
    func data() -> [Show] {
        return [
            Show(id: 1, image: ShowImage(medium: ""), name: "My movie 1", rating: Average(average: 8), summary: "This is a summary"),
            Show(id: 2, image: ShowImage(medium: ""), name: "My movie 2", rating: Average(average: 8), summary: "This is a summary"),
            Show(id: 3, image: ShowImage(medium: ""), name: "My movie 3", rating: Average(average: 8), summary: "This is a summary")
        ]
    }
}
